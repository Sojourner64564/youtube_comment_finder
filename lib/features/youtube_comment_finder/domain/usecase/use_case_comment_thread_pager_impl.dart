import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/usecase/use_case_comment_thread.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_thread_pager_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';

@lazySingleton
class UseCaseCommentThreadPagerImpl implements UseCaseCommentThread<CommentThreadModel,Params>{
  UseCaseCommentThreadPagerImpl(this.commentThreadPagerRepository);
  final CommentThreadPagerRepository commentThreadPagerRepository;

  @override
  Future<Either<Failure, CommentThreadModel>> call(Params params) async{
    return await commentThreadPagerRepository.getComments(params);
  }

}