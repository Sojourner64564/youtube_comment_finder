import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_snippet_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/replies_entity.dart';

class ItemEntity {
  final String kind;
  final String etag;
  final String id;
  final ItemSnippetEntity itemSnippetEntity;
  final RepliesEntity replies;

  ItemEntity({
    required this.kind,
    required this.etag,
    required this.id,
    required this.itemSnippetEntity,
    required this.replies,
  });
}