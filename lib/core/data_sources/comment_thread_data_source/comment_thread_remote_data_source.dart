import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';

abstract class CommentThreadRemoteDataSource{
  Future<CommentThreadModel> fetchComments();
}