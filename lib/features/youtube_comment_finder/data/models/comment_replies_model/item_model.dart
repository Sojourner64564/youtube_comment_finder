import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/snippet_entity.dart';

class ItemModel extends ItemEntity{
  ItemModel({
    kind,
    etag,
    id,
    snippet,
});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    kind: json['kind'] as String? ?? '',
    etag: json['etag'] as String? ?? '',
    id: json['id'] as String? ?? '',
    snippet: json['snippet'] == null
        ? const SnippetEntity()
        : SnippetModel.fromJson(json['snippet'] as Map<String, dynamic>),
  );
}