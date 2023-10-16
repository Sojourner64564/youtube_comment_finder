import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/comment_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/snippet_entity.dart';

class ItemRepliesEntity {
  final String kind;
  final String etag;
  final String id;
  final SnippetEntity snippet;

 const ItemRepliesEntity({
     this.kind = '',
     this.etag = '',
     this.id = '',
     this.snippet = const SnippetEntity(),
  });

}