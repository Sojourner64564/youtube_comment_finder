import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/item_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/replies_entity.dart';

class ItemModel extends ItemEntity{
  ItemModel({
    required String kind,
    required String etag,
    required String id,
    required ItemSnippetModel itemSnippet,
    required  replies,
  }):super(kind: kind, etag: etag, id: id, itemSnippet: itemSnippet, replies: replies);

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    kind: json['kind'] as String? ?? '',
    etag: json['etag'] as String? ?? '',
    id: json['id'] as String? ?? '',
    itemSnippet: json['snippet'] == null
        ?  ItemSnippetModel()
        : ItemSnippetModel.fromJson(
        json['snippet'] as Map<String, dynamic>),
    replies: json['replies'] == null
        ?  const RepliesEntity()
        : RepliesModel.fromJson(json['replies'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson(ItemModel instance) =>
      <String, dynamic>{
        'kind': instance.kind,
        'etag': instance.etag,
        'id': instance.id,
        'itemSnippet': instance.itemSnippet.toJson(),
        'replies': instance.replies.toJson(),
      };
}