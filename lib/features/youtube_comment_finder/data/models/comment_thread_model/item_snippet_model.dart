import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/top_level_comment_snippet_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_snippet_entity.dart';

class ItemSnippetModel{
  const ItemSnippetModel({
    this.channelId = '',
    this.videoId = '',
    this.topLevelComment = const CommentModel(),
    this.canReply = false,
    this.totalReplyCount = 0,
    this.isPublic = false,
  });

  final String channelId;
  final String videoId;
  final CommentModel topLevelComment;
  final bool canReply;
  final int totalReplyCount;
  final bool isPublic;

  factory ItemSnippetModel.fromJson(Map<String, dynamic> json) =>
      ItemSnippetModel(
        channelId: json['channelId'] as String? ?? '',
        videoId: json['videoId'] as String? ?? '',
        topLevelComment: json['topLevelComment'] == null
            ? CommentModel()
            : CommentModel.fromJson(
            json['topLevelComment'] as Map<String, dynamic>),
        canReply: json['canReply'] as bool? ?? false,
        totalReplyCount: json['totalReplyCount'] as int? ?? 0,
        isPublic: json['isPublic'] as bool? ?? false,
      );

  Map<String, dynamic> toJson(ItemSnippetModel instance) =>
      <String, dynamic>{
        'channelId': instance.channelId,
        'videoId': instance.videoId,
        'topLevelComment': instance.topLevelComment.toJson(instance.topLevelComment),
        'canReply': instance.canReply,
        'totalReplyCount': instance.totalReplyCount,
        'isPublic': instance.isPublic,
      };
}