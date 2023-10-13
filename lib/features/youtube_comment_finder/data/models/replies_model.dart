import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/replies_entity.dart';
import 'package:json_annotation/json_annotation.dart';

class RepliesModel extends RepliesEntity{

  RepliesModel({
    required List<CommentModel> comments,
  }) : super(comments: comments);

  factory RepliesModel.fromJson(Map<String, dynamic> json) => RepliesModel(
    comments: List<CommentModel>.from(json["comments"].map((x) => CommentModel.fromJson(x))),
  );
}