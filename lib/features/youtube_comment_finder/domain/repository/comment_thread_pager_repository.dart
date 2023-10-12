import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';

abstract class CommentThreadPagerRepository{
  Future<Either<Failure, CommentThreadModel>> getComments(Params params);
}