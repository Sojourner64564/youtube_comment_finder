import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_entity.dart';

class RepliesEntity {
  final List<CommentEntity> comments;

  RepliesEntity({
    required this.comments,
  });
}