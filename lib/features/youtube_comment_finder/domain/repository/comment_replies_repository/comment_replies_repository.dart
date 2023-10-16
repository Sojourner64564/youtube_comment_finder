import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';

abstract class CommentRepliesRepository{
  Future<Either<Failure, CommentRepliesModel>> getCommentReplies(CommentRepliesParams commentRepliesParams);
}