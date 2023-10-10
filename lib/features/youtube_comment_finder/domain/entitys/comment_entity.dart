import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/top_level_comment_snippet_entity.dart';

class CommentEntity {
  final String kind;
  final String etag;
  final String id;
  final TopLevelCommentSnippetEntity snippet;

  CommentEntity({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });
}