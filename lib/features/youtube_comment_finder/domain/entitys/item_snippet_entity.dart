import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_entity.dart';

class ItemSnippetEntity {
  final String channelId;
  final String videoId;
  final CommentEntity topLevelComment;
  final bool canReply;
  final int totalReplyCount;
  final bool isPublic;

  ItemSnippetEntity({
    required this.channelId,
    required this.videoId,
    required this.topLevelComment,
    required this.canReply,
    required this.totalReplyCount,
    required this.isPublic,
  });
}