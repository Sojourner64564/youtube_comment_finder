import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_snippet_entity.dart';

class ItemSnippetModel extends ItemSnippetEntity{
  ItemSnippetModel({
      channelId,
      videoId,
      topLevelComment,
      canReply,
      totalReplyCount,
      isPublic,
  }) : super(channelId: channelId, videoId: videoId, topLevelComment: topLevelComment, canReply: canReply, totalReplyCount: totalReplyCount, isPublic: isPublic);

 /* factory ItemSnippetModel.fromJson(Map<String, dynamic> json) => ItemSnippetModel(
    channelId: json["channelId"],
    videoId: json["videoId"],
    topLevelComment: CommentModel.fromJson(json["topLevelComment"]),
    canReply: json["canReply"],
    totalReplyCount: json["totalReplyCount"],
    isPublic: json["isPublic"],
  );*/

  factory ItemSnippetModel.fromJson(Map<String, dynamic> json) =>
      ItemSnippetModel(
        channelId: json['channelId'] as String? ?? '',
        videoId: json['videoId'] as String? ?? '',
        topLevelComment: json['topLevelComment'] == null
            ? CommentModel()
            : CommentModel.fromJson(
            json['topLevelComment'] as Map<String, dynamic>),
        canReply: json['canReply'] as bool? ?? false,
        totalReplyCount: json['totalReplyCount'] as int? ?? 0,
        isPublic: json['isPublic'] as bool? ?? false,
      );
}