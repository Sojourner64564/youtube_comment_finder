import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/top_level_comment_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_entity.dart';

class CommentModel extends CommentEntity{
  CommentModel({
    required String kind,
    required String etag,
    required String id,
    required TopLevelCommentSnippetModel snippet,
  }) : super(kind: kind, etag: etag, id: id, snippet: snippet);

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: TopLevelCommentSnippetModel.fromJson(json["snippet"]),
  );
}