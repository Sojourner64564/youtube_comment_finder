import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';

abstract class CommentThreadPagerRemoteDataSource{
  Future<CommentThreadModel> fetchComments(Params params);
}