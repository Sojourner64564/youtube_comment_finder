
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/item_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/replies_model.dart';

class ItemModel {
  ItemModel({
    required String kind,
    required String etag,
    required String id,
    required ItemSnippetModel itemSnippetModel,
    required RepliesModel repliesModel,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    itemSnippetModel: ItemSnippetModel.fromJson(json["snippet"]),
    repliesModel: RepliesModel.fromJson(json["replies"]),
  );
}