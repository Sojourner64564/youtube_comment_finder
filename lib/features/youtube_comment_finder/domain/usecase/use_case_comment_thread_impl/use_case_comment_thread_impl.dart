import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/usecase/use_case.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/no_params.dart';

@lazySingleton
class UseCaseCommentThreadImpl implements UseCase<CommentThreadModel,NoParams>{
  UseCaseCommentThreadImpl(this.commentThreadRepository);
  final CommentThreadRepository commentThreadRepository;

  @override
  Future<Either<Failure, CommentThreadModel>> call(NoParams params) async{
      return await commentThreadRepository.getCommentThread();
  }
}