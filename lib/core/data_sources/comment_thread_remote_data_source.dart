import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model.dart';

abstract class CommentThreadRemoteDataSource{
  Future<CommentThreadModel> fetchComments();
}