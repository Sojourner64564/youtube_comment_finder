import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_model.dart';

class ItemSnippetModel {
  ItemSnippetModel({
    required String channelId,
    required String videoId,
    required CommentModel topLevelComment,
    required bool canReply,
    required int totalReplyCount,
    required bool isPublic,
  });

  factory ItemSnippetModel.fromJson(Map<String, dynamic> json) => ItemSnippetModel(
    channelId: json["channelId"],
    videoId: json["videoId"],
    topLevelComment: CommentModel.fromJson(json["topLevelComment"]),
    canReply: json["canReply"],
    totalReplyCount: json["totalReplyCount"],
    isPublic: json["isPublic"],
  );
}