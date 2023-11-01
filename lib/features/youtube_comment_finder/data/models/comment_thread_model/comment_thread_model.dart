import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/item_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/page_info_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/comment_thread_entity.dart';

class CommentThreadModel extends CommentThreadEntity{
  const CommentThreadModel({
    required String kind,
    required String etag,
    required String nextPageToken,
    required PageInfoModel pageInfo,
    required List<ItemModel> items,
  }): super(
    kind: kind,
    etag: etag,
      nextPageToken: nextPageToken,
      pageInfo: pageInfo,
    items: items
  );

  factory CommentThreadModel.fromJson(Map<String, dynamic> json) {
      return CommentThreadModel(
        kind: json['kind'] as String? ?? '',
        etag: json['etag'] as String? ?? '',
        nextPageToken: json['nextPageToken'] as String? ?? '',
        pageInfo: json['pageInfo'] == null
            ? PageInfoModel()
            : PageInfoModel.fromJson(json['pageInfo'] as Map<String, dynamic>),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            const [],
      );
  }

  Map<String, dynamic> toJson(CommentThreadModel instance) {
   return <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'pageInfo': (instance.pageInfo as PageInfoModel).toJson(instance.pageInfo as PageInfoModel),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
  }



}



