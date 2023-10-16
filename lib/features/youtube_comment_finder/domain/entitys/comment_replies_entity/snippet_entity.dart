
class SnippetEntity {
  final String channelId;
  final String textDisplay;
  final String textOriginal;
  final String parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final String authorChannelId;
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
     this.authorChannelId = '',
     this.canRate = false,
     this.viewerRating = '',
     this.likeCount = 0,
     this.publishedAt = '',
     this.updatedAt = '',
  });

}