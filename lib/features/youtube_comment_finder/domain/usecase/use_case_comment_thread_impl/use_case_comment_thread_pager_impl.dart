import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/usecase/use_case.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_pager_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';

@lazySingleton
class UseCaseCommentThreadPagerImpl implements UseCase<CommentThreadModel,Params>{
  UseCaseCommentThreadPagerImpl(this.commentThreadPagerRepository);
  final CommentThreadPagerRepository commentThreadPagerRepository;

  @override
  Future<Either<Failure, CommentThreadModel>> call(Params params) async{
    return await commentThreadPagerRepository.getComments(params);
  }

}