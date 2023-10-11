import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/author_channel_id_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/top_level_comment_snippet_entity.dart';

class TopLevelCommentSnippetModel extends TopLevelCommentSnippetEntity{
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
  }) : super(
      channelId: channelId,
      videoId: videoId,
      textDisplay: textDisplay,
      textOriginal: textOriginal,
      parentId: parentId,
      authorDisplayName: authorDisplayName,
      authorProfileImageUrl: authorProfileImageUrl,
      authorChannelUrl: authorChannelUrl,
      authorChannelId: authorChannelId,
      canRate: canRate,
      viewerRating: viewerRating,
      likeCount: likeCount,
      publishedAt: publishedAt,
      updatedAt: updatedAt,
  );

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