import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/no_params.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl.dart';
part 'fetch_comments_state.dart';

@lazySingleton
class FetchCommentsCubit extends Cubit<MyState> {
  FetchCommentsCubit(this.useCaseCommentThreadImpl) : super(InitialState());
//AIzaSyCHzVbBgBV7jxMOaTNhngcW_O3AeIWtLmQ
  final UseCaseCommentThreadImpl useCaseCommentThreadImpl;

  void fetchComments() async {
    final faliureOrCommentsEither = await useCaseCommentThreadImpl.call(NoParams());
    final falureOrComments = faliureOrCommentsEither.fold((failure) => ErrorState(), (commentThread) => commentThread);

  }
}
