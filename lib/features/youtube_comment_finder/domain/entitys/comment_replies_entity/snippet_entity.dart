import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/author_channel_id_replies_entity.dart';

class SnippetEntity {
  final String channelId;
  final String textDisplay;
  final String textOriginal;
  final String parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelIdRepliesEntity authorChannelIdReplies;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final String publishedAt;
  final String updatedAt;

 const SnippetEntity({
     this.channelId = '',
     this.textDisplay = '',
     this.textOriginal = '',
     this.parentId = '',
     this.authorDisplayName = '',
     this.authorProfileImageUrl = '',
     this.authorChannelUrl = '',
     this.authorChannelIdReplies = const AuthorChannelIdRepliesEntity(),
     this.canRate = false,
     this.viewerRating = '',
     this.likeCount = 0,
     this.publishedAt = '',
     this.updatedAt = '',
  });
}