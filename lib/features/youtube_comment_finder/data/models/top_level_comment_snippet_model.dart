import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/author_channel_id_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/top_level_comment_snippet_entity.dart';

class TopLevelCommentSnippetModel extends TopLevelCommentSnippetEntity{
  const TopLevelCommentSnippetModel({
      channelId,
      videoId,
      textDisplay,
      textOriginal,
      parentId,
      authorDisplayName,
      authorProfileImageUrl,
      authorChannelUrl,
     authorChannelId,
      canRate,
      viewerRating,
      likeCount,
      publishedAt,
      updatedAt,
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

 /* factory TopLevelCommentSnippetModel.fromJson(Map<String, dynamic> json) => TopLevelCommentSnippetModel(
    channelId: json["channelId"] as String? ?? '',
    videoId: json["videoId"] as String? ?? '',
    textDisplay: json["textDisplay"] as String? ?? '',
    textOriginal: json["textOriginal"] as String? ?? '',
    parentId: json["parentId"] as String? ?? '',
    authorDisplayName: json["authorDisplayName"] as String? ?? '',
    authorProfileImageUrl: json["authorProfileImageUrl"] as String? ?? '',
    authorChannelUrl: json["authorChannelUrl"] as String? ?? '',
    authorChannelId: AuthorChannelIdModel.fromJson(json["authorChannelId"]),
    canRate: json["canRate"],
    viewerRating: json["viewerRating"],
    likeCount: json["likeCount"],
    publishedAt: json["publishedAt"],
    updatedAt: json["updatedAt"],
  );*/


  factory TopLevelCommentSnippetModel.fromJson(Map<String, dynamic> json) =>
      TopLevelCommentSnippetModel(
        channelId: json['channelId'] as String? ?? '',
        videoId: json['videoId'] as String? ?? '',
        textDisplay: json['textDisplay'] as String? ?? '',
        textOriginal: json['textOriginal'] as String? ?? '',
        parentId: json['parentId'] as String? ?? '',
        authorDisplayName: json['authorDisplayName'] as String? ?? '',
        authorProfileImageUrl: json['authorProfileImageUrl'] as String? ?? '',
        authorChannelUrl: json['authorChannelUrl'] as String? ?? '',
        authorChannelId: json['authorChannelId'] == null
            ? AuthorChannelIdModel()
            : AuthorChannelIdModel.fromJson(
            json['authorChannelId'] as Map<String, dynamic>),
        canRate: json['canRate'] as bool? ?? false,
        viewerRating: json['viewerRating'] as String? ?? '',
        likeCount: json['likeCount'] as int? ?? 0,
        publishedAt: json['publishedAt'] as String? ?? '',
        updatedAt: json['updatedAt'] as String? ?? '',
      );

}