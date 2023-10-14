import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/author_channel_id_entity.dart';

class AuthorChannelIdModel extends AuthorChannelIdEntity{
  const AuthorChannelIdModel({
      value,
  }) : super(value: value);

  /*factory AuthorChannelIdModel.fromJson(Map<String, dynamic> json) => AuthorChannelIdModel(
    value: json["value"],
  );*/

  factory AuthorChannelIdModel.fromJson(
      Map<String, dynamic> json) =>
      AuthorChannelIdModel(
        value: json['value'] as String? ?? '',
      );
}