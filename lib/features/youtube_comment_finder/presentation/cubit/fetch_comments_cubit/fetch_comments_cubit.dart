import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/no_params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_pager_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/state_models/comment_and_reply_state_model.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';
part 'fetch_comments_state.dart';

@lazySingleton
class FetchCommentsCubit extends Cubit<MyState> {
  FetchCommentsCubit(this.useCaseCommentThreadImpl, this.useCaseCommentThreadPagerImpl) : super(InitialState());
//AIzaSyCHzVbBgBV7jxMOaTNhngcW_O3AeIWtLmQ
  final UseCaseCommentThreadImpl useCaseCommentThreadImpl;
  final UseCaseCommentThreadPagerImpl useCaseCommentThreadPagerImpl;
  List<CommentThreadEntity> commentsList = [];
  List<String> repliesList = [];
  List<CommentAndReplyStateModel> myComments = [];

  void fetchComments() async {
    commentsList.clear();
    repliesList.clear();
    final failureOrCommentsEither = await useCaseCommentThreadImpl.call(NoParams());
    final failureOrComments = failureOrCommentsEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
    if(failureOrComments is ErrorState){
      emit(ErrorState());
      throw UnimplementedError();
    }
    commentsList.add(failureOrComments as CommentThreadEntity);
    print((failureOrComments).nextPageToken == '');
    if((failureOrComments).nextPageToken == ''){
      /*if(commentsList.length == 1){
        for(int b=0;b<commentsList[0].items.length;b++){
          if(commentsList[0].items[b].replies.comments.isNotEmpty){
            final List<String> replies = [];
            for(int c=0;c<commentsList[0].items[b].replies.comments.length;c++){
              replies.add(commentsList[0].items[b].replies.comments[c].snippet.textOriginal);
            }
            myComments.add(CommentAndReplyStateModel(
                topLevelComment: commentsList[0].items[b].itemSnippet.topLevelComment.snippet.textOriginal,
                replies: replies));
          }else{
            myComments.add(CommentAndReplyStateModel(topLevelComment: commentsList[0].items[b].itemSnippet.topLevelComment.snippet.textOriginal,));
          }
        }
      }
      emit(LoadedState(myComments));*/


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
      /*for(int i=0;i<commentsList.length;i++){
        for(int b=0;b<commentsList[i].items.length;b++){
          if(commentsList[i].items[b].replies.comments.isNotEmpty){
            final List<String> replies = [];
            for(int c=0;c<commentsList[i].items[b].replies.comments.length;c++){
              replies.add(commentsList[i].items[b].replies.comments[c].snippet.textOriginal);
            }
            print(replies.length.toString() + 'replies lenght');
            myComments.add(CommentAndReplyStateModel(
                topLevelComment: commentsList[i].items[b].itemSnippet.topLevelComment.snippet.textOriginal,
                replies: replies,
            ));
          }else{
            myComments.add(CommentAndReplyStateModel(topLevelComment: commentsList[i].items[b].itemSnippet.topLevelComment.snippet.textOriginal));
          }
        }
      }*/


      print(repliesList.length);
      emit(LoadedState(myComments));
    }
    print(commentsList.length);


  }


}
