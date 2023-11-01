import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/top_level_comment_snippet_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_entity.g.dart';

@JsonSerializable(explicitToJson: true)
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