import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_model.dart';

class RepliesModel {

  RepliesModel({
    required List<CommentModel> comments,
  });

  factory RepliesModel.fromJson(Map<String, dynamic> json) => RepliesModel(
    comments: List<CommentModel>.from(json["comments"].map((x) => CommentModel.fromJson(x))),
  );
}