import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/no_params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl.dart';
part 'fetch_comments_state.dart';

@lazySingleton
class FetchCommentsCubit extends Cubit<MyState> {
  FetchCommentsCubit(this.useCaseCommentThreadImpl) : super(InitialState());
//AIzaSyCHzVbBgBV7jxMOaTNhngcW_O3AeIWtLmQ
  final UseCaseCommentThreadImpl useCaseCommentThreadImpl;
  List<CommentThreadEntity> commentsList = [];
  List<String> repliesList = [];
/*
  for(int i=0;i<commentsList.length;i++){
        repliesList.add(commentsList[i].items[0].itemSnippet.topLevelComment.snippet.textOriginal);
      }
 */

  void fetchComments() async {
    commentsList.clear();
    repliesList.clear();
    final failureOrCommentsEither = await useCaseCommentThreadImpl.call(NoParams());
    final failureOrComments = failureOrCommentsEither.fold((failure) => ErrorState(), (commentThread) => commentThread);
    if(failureOrComments is ErrorState){
      emit(failureOrComments);
    }
    commentsList.add(failureOrComments as CommentThreadEntity);
    if((failureOrComments).nextPageToken == ''){
      //:TODO --------------
    }else{

    }


  }


}
