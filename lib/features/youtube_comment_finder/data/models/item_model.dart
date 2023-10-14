
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/item_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_entity.dart';

class ItemModel extends ItemEntity{
  ItemModel({
    required String kind,
    required String etag,
    required String id,
    required ItemSnippetModel itemSnippet,
    required RepliesModel replies,
  }) : super(kind: kind, etag: etag, id: id, itemSnippet: itemSnippet, replies: replies);

  /*factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    itemSnippet: ItemSnippetModel.fromJson(json["snippet"]),
    replies: RepliesModel.fromJson(json["replies"]),
  );*/

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    kind: json['kind'] as String? ?? '',
    etag: json['etag'] as String? ?? '',
    id: json['id'] as String? ?? '',
    itemSnippet: json['snippet'] == null
        ?  ItemSnippetModel()
        : ItemSnippetModel.fromJson(
        json['snippet'] as Map<String, dynamic>),
    replies: json['replies'] == null
        ?  RepliesModel()
        : RepliesModel.fromJson(json['replies'] as Map<String, dynamic>),
  );
}