import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_snippet_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/replies_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_entity.g.dart';

@JsonSerializable(explicitToJson: true)
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