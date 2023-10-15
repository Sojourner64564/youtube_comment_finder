import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class RepliesEntity {
  final List<CommentEntity> comments;

  const RepliesEntity({
     this.comments = const [],
  });
}