import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/replies_entity.dart';

class RepliesModel{
  const RepliesModel({
    this.comments = const [],
  });

  final List<CommentModel> comments;

  factory RepliesModel.fromJson(Map<String, dynamic> json) =>
      RepliesModel(
        comments: (json['comments'] as List<dynamic>?)
            ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            const [],
      );

  Map<String, dynamic> toJson(RepliesModel instance) =>
      <String, dynamic>{
        'comments': instance.comments.map((e) => e.toJson(e)).toList(),
      };
}