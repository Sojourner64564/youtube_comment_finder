import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_entity.dart';

class ItemSnippetEntity {
  final String channelId;
  final String videoId;
  final CommentEntity topLevelComment;
  final bool canReply;
  final int totalReplyCount;
  final bool isPublic;

  const ItemSnippetEntity({
     this.channelId = '',
     this.videoId = '',
     this.topLevelComment = const CommentEntity(),
     this.canReply = false,
     this.totalReplyCount = 0,
     this.isPublic = false,
  });
}