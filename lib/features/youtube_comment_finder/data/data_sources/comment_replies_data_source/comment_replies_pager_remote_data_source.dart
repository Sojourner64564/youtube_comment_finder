import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';

abstract class CommentRepliesPagerRemoteDataSource{
  Future<CommentRepliesModel> fetchReplies(Params params);
}