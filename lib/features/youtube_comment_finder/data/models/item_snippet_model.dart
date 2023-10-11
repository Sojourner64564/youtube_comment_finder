import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_snippet_entity.dart';

class ItemSnippetModel extends ItemSnippetEntity{
  ItemSnippetModel({
    required String channelId,
    required String videoId,
    required CommentModel topLevelComment,
    required bool canReply,
    required int totalReplyCount,
    required bool isPublic,
  }) : super(channelId: channelId, videoId: videoId, topLevelComment: topLevelComment, canReply: canReply, totalReplyCount: totalReplyCount, isPublic: isPublic);

  factory ItemSnippetModel.fromJson(Map<String, dynamic> json) => ItemSnippetModel(
    channelId: json["channelId"],
    videoId: json["videoId"],
    topLevelComment: CommentModel.fromJson(json["topLevelComment"]),
    canReply: json["canReply"],
    totalReplyCount: json["totalReplyCount"],
    isPublic: json["isPublic"],
  );
}