import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/author_channel_id_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/top_level_comment_snippet_entity.dart';

class TopLevelCommentSnippetModel{
  const TopLevelCommentSnippetModel( {
    this.channelId = '',
    this.videoId = '',
    this.textDisplay = '',
    this.textOriginal = 'jgcutc6666',
    this.parentId = '',
    this.authorDisplayName = '',
    this.authorProfileImageUrl = '',
    this.authorChannelUrl = '',
    this.authorChannelId = const AuthorChannelIdModel(),
    this.canRate = false,
    this.viewerRating = '',
    this.likeCount = 0,
    this.publishedAt = '',
    this.updatedAt = '',
  });

  final String channelId;
  final String videoId;
  final String textDisplay;
  final String textOriginal;
  final String? parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelIdModel authorChannelId;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final String publishedAt;
  final String updatedAt;

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

  Map<String, dynamic> toJson(
      TopLevelCommentSnippetModel instance) =>
      <String, dynamic>{
        'channelId': instance.channelId,
        'videoId': instance.videoId,
        'textDisplay': instance.textDisplay,
        'textOriginal': instance.textOriginal,
        'parentId': instance.parentId,
        'authorDisplayName': instance.authorDisplayName,
        'authorProfileImageUrl': instance.authorProfileImageUrl,
        'authorChannelUrl': instance.authorChannelUrl,
        'authorChannelId': instance.authorChannelId.toJson(instance.authorChannelId),
        'canRate': instance.canRate,
        'viewerRating': instance.viewerRating,
        'likeCount': instance.likeCount,
        'publishedAt': instance.publishedAt,
        'updatedAt': instance.updatedAt,
      };
}