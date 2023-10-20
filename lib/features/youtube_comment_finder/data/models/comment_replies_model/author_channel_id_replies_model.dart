import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/author_channel_id_replies_entity.dart';

class AuthorChannelIdRepliesModel extends AuthorChannelIdRepliesEntity{
  const AuthorChannelIdRepliesModel({
    value
}):super(value: value);

  factory AuthorChannelIdRepliesModel.fromJson(Map<String, dynamic> json) =>
      AuthorChannelIdRepliesModel(
        value: json['value'] as String? ?? '',
      );
}