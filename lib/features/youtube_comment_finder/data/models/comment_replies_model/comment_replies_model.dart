import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/item_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/page_info_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/comment_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/page_info_entity.dart';

class CommentRepliesModel extends CommentRepliesEntity{
  CommentRepliesModel({
    kind,
    etag,
    nextPageToken,
    pageInfo,
    items,
}):super(kind: kind, etag: etag, nextPageToken: nextPageToken, pageInfo: pageInfo, items: items);

  factory CommentRepliesModel.fromJson(Map<String, dynamic> json) {
    if((json['items'] as List<dynamic>).isNotEmpty){
      print((json['items'] as List<dynamic>?)
          ?.map((e) => ItemRepliesModel.fromJson(e as Map<String, dynamic>))
          .toList()[0].snippet.textOriginal ??
          const [],);
    }

    return CommentRepliesModel(
    kind: json['kind'] as String? ?? '',
    etag: json['etag'] as String? ?? '',
    nextPageToken: json['nextPageToken'] as String? ?? '',
    pageInfo: json['pageInfo'] == null
        ? const PageInfoEntity()
        : PageInfoModel.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => ItemRepliesModel.fromJson(e as Map<String, dynamic>))
        .toList() ??
        const [],
  );}

}