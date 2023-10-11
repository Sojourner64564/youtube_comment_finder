import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/top_level_comment_snippet_entity.dart';

class CommentEntity {
  final String kind;
  final String etag;
  final String id;
  final TopLevelCommentSnippetEntity snippet;

  const CommentEntity({
     this.kind = '',
     this.etag = '',
     this.id = '',
     this.snippet = const TopLevelCommentSnippetEntity(),
  });
}