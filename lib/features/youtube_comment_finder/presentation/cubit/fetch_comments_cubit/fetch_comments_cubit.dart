import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/item_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/comment_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/comment_thread_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/no_params.dart';
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
  List<CommentThreadEntity> commentsList = [];


  void fetchComments() async {
    commentsList.clear();
    final failureOrCommentsEither = await useCaseCommentThreadImpl.call(NoParams());
    final failureOrComments = failureOrCommentsEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
    if(failureOrComments is ErrorState){
      emit(ErrorState());
      throw UnimplementedError();
    }
    commentsList.add(failureOrComments as CommentThreadEntity);
    print((failureOrComments).nextPageToken == '');
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
        }///_---------------------
        if((failureOrCommentReplies as CommentRepliesEntity).items.isNotEmpty){
          if(failureOrCommentReplies.nextPageToken == ''){
            itemRepliesListTwo = failureOrCommentReplies.items;
           // print(failureOrCommentReplies.items[0].snippet.textOriginal);
            listOfListsTwo.add(itemRepliesListTwo);
            ///TODO ------------
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
      print(listOfListsTwo);
      //print(listOfListsTwo[1][0].snippet.textOriginal.toString() + '----------');
      emit(LoadedState(itemList, listOfListsTwo));///TODO----------
      ///
    }else{
      String nextPagToken = failureOrComments.nextPageToken;
      while(nextPagToken != ''){
        print(nextPagToken);
        final failureOrCommentsPagerEither = await useCaseCommentThreadPagerImpl.call(Params(nextPagToken));
        final failureOrCommentsPager = failureOrCommentsPagerEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
        if(failureOrCommentsPager is ErrorState){
          emit(ErrorState());
        }
        commentsList.add(failureOrCommentsPager as CommentThreadEntity);
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
              ///TODO ------------
          }else{
            String nextPageReplyToken = failureOrCommentReplies.nextPageToken;
            while(nextPageReplyToken != ''){
              final failureOrCommentRepliesPagerEither = await useCaseCommentRepliesPagerImpl.call(CommentRepliesParams(parentId: parentId, pageToken: nextPageReplyToken));
              final failureOrCommentRepliesPager = failureOrCommentRepliesPagerEither.fold((failure) => ErrorState(), (commentReplies) => commentReplies);
              if(failureOrCommentRepliesPager is ErrorState){
                emit(ErrorState());
              }
              listToExpand.add((failureOrCommentRepliesPager as CommentRepliesEntity).items);
            }
            itemRepliesList = listToExpand.expand((element) => element).toList();
            listOfLists.add(itemRepliesList);

          }
        }else{
          listOfLists.add([]);
        }
      }
      emit(LoadedState(itemList, listOfLists));
    }
  }
}
