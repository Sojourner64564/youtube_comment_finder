import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/author_channel_id_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
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

  const TopLevelCommentSnippetEntity({
     this.channelId = '',
     this.videoId = '',
     this.textDisplay = '',
     this.textOriginal = '',
     this.parentId = '',
    this.authorDisplayName = '',
     this.authorProfileImageUrl = '',
     this.authorChannelUrl = '',
     this.authorChannelId = const AuthorChannelIdEntity(),
    this.canRate = false,
     this.viewerRating = '',
     this.likeCount = 0,
     this.publishedAt = '',
     this.updatedAt = '',
  });
}