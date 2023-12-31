import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/item_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/comment_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_pager_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_pager_impl.dart';
part 'fetch_comments_state.dart';

@lazySingleton
class FetchCommentsCubit extends Cubit<MyState> {
  FetchCommentsCubit(this.useCaseCommentThreadImpl, this.useCaseCommentThreadPagerImpl, this.useCaseCommentRepliesImpl, this.useCaseCommentRepliesPagerImpl) : super(InitialState());
//AIzaSyCHzVbBgBV7jxMOaTNhngcW_O3AeIWtLmQ
  final UseCaseCommentThreadImpl useCaseCommentThreadImpl;
  final UseCaseCommentThreadPagerImpl useCaseCommentThreadPagerImpl;
  final UseCaseCommentRepliesImpl useCaseCommentRepliesImpl;
  final UseCaseCommentRepliesPagerImpl useCaseCommentRepliesPagerImpl;
  List<CommentThreadModel> commentsList = [];


  void fetchComments(String videoId) async {
    commentsList.clear();
    emit(LoadingState());
    final failureOrCommentsEither = await useCaseCommentThreadImpl.call(Params(videoId: videoId));
    final failureOrComments = failureOrCommentsEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
    if(failureOrComments is ErrorState){
      emit(ErrorState());
      throw UnimplementedError();
    }
    commentsList.add(failureOrComments as CommentThreadModel);
    if((failureOrComments).nextPageToken == ''){
      final itemList = commentsList.expand((element) => element.items).toList();

      List<ItemRepliesEntity> itemRepliesListTwo = [];
      final List<List<ItemRepliesEntity>> listOfListsTwo = [];
      final listToExpandTwo = <List<ItemRepliesEntity>>[];


      for(int i=0;i<itemList.length;i++){
        final parentId = itemList[i].id;
        final failureOrCommentRepliesEither = await useCaseCommentRepliesImpl.call(CommentRepliesParams(parentId: parentId));
        final failureOrCommentReplies = failureOrCommentRepliesEither.fold((failure) => ErrorState(), (commentReplies) => commentReplies);
        if(failureOrCommentReplies is ErrorState){
          emit(ErrorState());
        }
        if((failureOrCommentReplies as CommentRepliesEntity).items.isNotEmpty){
          if(failureOrCommentReplies.nextPageToken == ''){
            itemRepliesListTwo = failureOrCommentReplies.items;
            listOfListsTwo.add(itemRepliesListTwo);
          }else{
            String nextPageReplyToken = failureOrCommentReplies.nextPageToken;
            while(nextPageReplyToken != ''){
              final failureOrCommentRepliesPagerEither = await useCaseCommentRepliesPagerImpl.call(CommentRepliesParams(parentId: parentId, pageToken: nextPageReplyToken));
              final failureOrCommentRepliesPager = failureOrCommentRepliesPagerEither.fold((failure) => ErrorState(), (commentReplies) => commentReplies);
              if(failureOrCommentRepliesPager is ErrorState){
                emit(ErrorState());
              }
              listToExpandTwo.add((failureOrCommentRepliesPager as CommentRepliesEntity).items);
            }
            itemRepliesListTwo = listToExpandTwo.expand((element) => element).toList();
            listOfListsTwo.add(itemRepliesListTwo);

          }
        }else{
          listOfListsTwo.add([]);
        }
      }
      final myBox = await Hive.openBox('myBox');
      myBox.put('key',
          json.encode(const CommentThreadModel()
              .toJson(CommentThreadModel(items: itemList,))));
myBox.close();
      emit(LoadedState(itemList, listOfListsTwo));///----------
    }else{
      String nextPagToken = failureOrComments.nextPageToken;
      while(nextPagToken != ''){
        final failureOrCommentsPagerEither = await useCaseCommentThreadPagerImpl.call(Params(videoId: videoId, pageToken:nextPagToken));
        final failureOrCommentsPager = failureOrCommentsPagerEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
        if(failureOrCommentsPager is ErrorState){
          emit(ErrorState());
        }
        commentsList.add(failureOrCommentsPager as CommentThreadModel);
        nextPagToken = failureOrCommentsPager.nextPageToken;
      }


      final itemList = commentsList.expand((element) => element.items).toList();

      final List<List<ItemRepliesEntity>> listOfLists = [];
      List<ItemRepliesEntity> itemRepliesList = [];
      final listToExpand = <List<ItemRepliesEntity>>[];


      for(int i=0;i<itemList.length;i++){
        final parentId = itemList[i].id;
        final failureOrCommentRepliesEither = await useCaseCommentRepliesImpl.call(CommentRepliesParams(parentId: parentId));
        final failureOrCommentReplies = failureOrCommentRepliesEither.fold((failure) => ErrorState(), (commentReplies) => commentReplies);
        if(failureOrCommentReplies is ErrorState){
          emit(ErrorState());
        }
        if((failureOrCommentReplies as CommentRepliesEntity).items.isNotEmpty){
          if(failureOrCommentReplies.nextPageToken == ''){
            itemRepliesList = failureOrCommentReplies.items;
            listOfLists.add(itemRepliesList);
          }else{
            String nextPageReplyToken = failureOrCommentReplies.nextPageToken;
            while(nextPageReplyToken != ''){
              final failureOrCommentRepliesPagerEither = await useCaseCommentRepliesPagerImpl.call(CommentRepliesParams(parentId: parentId, pageToken: nextPageReplyToken));
              final failureOrCommentRepliesPager = failureOrCommentRepliesPagerEither.fold((failure) => ErrorState(), (commentReplies) => commentReplies);
              if(failureOrCommentRepliesPager is ErrorState){
                emit(ErrorState());
              }
              listToExpand.add((failureOrCommentRepliesPager as CommentRepliesEntity).items);
              nextPageReplyToken = failureOrCommentRepliesPager.nextPageToken;
            }
            itemRepliesList = listToExpand.expand((element) => element).toList();
            listOfLists.add(itemRepliesList);
          }
        }else{
          listOfLists.add([]);
        }
      }
      final myBox = await Hive.openBox('myBox');
      myBox.put('key', json.encode(const CommentThreadModel().toJson(CommentThreadModel(items: itemList))));
      myBox.close();
      emit(LoadedState(itemList, listOfLists)); ///--------------------------
    }
  }
}
