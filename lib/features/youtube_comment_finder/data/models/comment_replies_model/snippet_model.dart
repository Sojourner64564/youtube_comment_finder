import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/snippet_entity.dart';

class SnippetModel extends SnippetEntity{
  SnippetModel({
    channelId,
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
}):super(
    channelId: channelId,
    textDisplay: textOriginal,
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

  factory SnippetModel.fromJson(Map<String, dynamic> json) =>
      SnippetModel(
        channelId: json['channelId'] as String? ?? '',
        textDisplay: json['textDisplay'] as String? ?? '',
        textOriginal: json['textOriginal'] as String? ?? '',
        parentId: json['parentId'] as String? ?? '',
        authorDisplayName: json['authorDisplayName'] as String? ?? '',
        authorProfileImageUrl: json['authorProfileImageUrl'] as String? ?? '',
        authorChannelUrl: json['authorChannelUrl'] as String? ?? '',
        authorChannelId: json['authorChannelId'] as String? ?? '',
        canRate: json['canRate'] as bool? ?? false,
        viewerRating: json['viewerRating'] as String? ?? '',
        likeCount: json['likeCount'] as int? ?? 0,
        publishedAt: json['publishedAt'] as String? ?? '',
        updatedAt: json['updatedAt'] as String? ?? '',
      );
}