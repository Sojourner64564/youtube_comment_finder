import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/usecase/use_case.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_pager_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';

class UseCaseCommentRepliesPagerImpl implements UseCase<CommentRepliesModel, CommentRepliesParams>{
  UseCaseCommentRepliesPagerImpl(this.commentRepliesPagerRepository);

  final CommentRepliesPagerRepository commentRepliesPagerRepository;

  @override
  Future<Either<Failure, CommentRepliesModel>> call(CommentRepliesParams commentRepliesParams) async{
    return await commentRepliesPagerRepository.getCommentReplies(commentRepliesParams);
  }

}