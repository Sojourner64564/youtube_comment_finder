import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/item_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/top_level_comment_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/comment_entity.dart';

class CommentModel{
 const CommentModel( {
   this.kind = '',
   this.etag = '',
   this.id = '',
   this.snippet = const TopLevelCommentSnippetModel(),
  });

 final String kind;
 final String etag;
 final String id;
 final TopLevelCommentSnippetModel snippet;


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

 Map<String, dynamic> toJson(CommentModel instance) =>
     <String, dynamic>{
       'kind': instance.kind,
       'etag': instance.etag,
       'id': instance.id,
       'snippet': instance.snippet.toJson(instance.snippet),
     };
}