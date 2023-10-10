import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/author_channel_id_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/author_channel_id_entity.dart';

class TopLevelCommentSnippetModel {
  TopLevelCommentSnippetModel({
    required String channelId,
    required String videoId,
    required String textDisplay,
    required String textOriginal,
    required String parentId,
    required String authorDisplayName,
    required String authorProfileImageUrl,
    required String authorChannelUrl,
    required AuthorChannelIdModel authorChannelId,
    required bool canRate,
    required String viewerRating,
    required int likeCount,
    required String publishedAt,
    required String updatedAt,
  });

  factory TopLevelCommentSnippetModel.fromJson(Map<String, dynamic> json) => TopLevelCommentSnippetModel(
    channelId: json["channelId"],
    videoId: json["videoId"],
    textDisplay: json["textDisplay"],
    textOriginal: json["textOriginal"],
    parentId: json["parentId"],
    authorDisplayName: json["authorDisplayName"],
    authorProfileImageUrl: json["authorProfileImageUrl"],
    authorChannelUrl: json["authorChannelUrl"],
    authorChannelId: AuthorChannelIdModel.fromJson(json["authorChannelId"]),
    canRate: json["canRate"],
    viewerRating: json["viewerRating"],
    likeCount: json["likeCount"],
    publishedAt: json["publishedAt"],
    updatedAt: json["updatedAt"],
  );

}