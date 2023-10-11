import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/item_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/page_info_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity.dart';

class CommentThreadModel extends CommentThreadEntity{
  const CommentThreadModel({
    required String kind,
    required String etag,
    required PageInfoModel pageInfo,
    required List<ItemModel> items,
  }): super(
    kind: kind,
    etag: etag,
      pageInfo: pageInfo,
    items: items
  );

  factory CommentThreadModel.fromJson(Map<String, dynamic> json) => CommentThreadModel(
    kind: json["kind"],
    etag: json["etag"],
    pageInfo: PageInfoModel.fromJson(json["pageInfo"]),
    items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
  );
}



