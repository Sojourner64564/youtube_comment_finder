import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/author_channel_id_entity.dart';

class TopLevelCommentSnippetEntity {
  final String channelId;
  final String videoId;
  final String textDisplay;
  final String textOriginal;
  final String? parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelIdEntity authorChannelId;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final String publishedAt;
  final String updatedAt;

  TopLevelCommentSnippetEntity({
    required this.channelId,
    required this.videoId,
    required this.textDisplay,
    required this.textOriginal,
    required this.parentId,
    required this.authorDisplayName,
    required this.authorProfileImageUrl,
    required this.authorChannelUrl,
    required this.authorChannelId,
    required this.canRate,
    required this.viewerRating,
    required this.likeCount,
    required this.publishedAt,
    required this.updatedAt,
  });
}