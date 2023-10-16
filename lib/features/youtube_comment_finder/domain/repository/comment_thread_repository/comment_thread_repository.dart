import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';

abstract class CommentThreadRepository{
  Future<Either<Failure, CommentThreadModel>> getCommentThread();
}