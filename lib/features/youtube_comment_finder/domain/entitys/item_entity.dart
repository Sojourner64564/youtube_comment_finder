import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_snippet_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/replies_entity.dart';

class ItemEntity {
  final String kind;
  final String etag;
  final String id;
  final ItemSnippetEntity itemSnippet;
  final RepliesEntity replies;

 const ItemEntity({
     this.kind = '',
     this.etag = '',
     this.id = '',
     this.itemSnippet = const ItemSnippetEntity(),
     this.replies = const RepliesEntity(),
  });
}