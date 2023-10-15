import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_entity.dart';
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
      emit(LoadedState(itemList));
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
      emit(LoadedState(itemList));
    }
  }
}
