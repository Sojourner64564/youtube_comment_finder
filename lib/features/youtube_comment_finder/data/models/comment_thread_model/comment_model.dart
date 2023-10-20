import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/top_level_comment_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/comment_entity.dart';

class CommentModel extends CommentEntity{
 const CommentModel({
      kind,
      etag,
      id,
      snippet,
  }) : super(kind: kind, etag: etag, id: id, snippet: snippet);

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      CommentModel(
        kind: json['kind'] as String? ?? '',
        etag: json['etag'] as String? ?? '',
        id: json['id'] as String? ?? '',
        snippet: json['snippet'] == null
            ? TopLevelCommentSnippetModel()
            : TopLevelCommentSnippetModel.fromJson(
            json['snippet'] as Map<String, dynamic>),
      );
}