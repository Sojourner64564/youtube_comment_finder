import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/author_channel_id_entity.dart';

class AuthorChannelIdModel extends AuthorChannelIdEntity{
  AuthorChannelIdModel({
    required String value,
  }) : super(value: value);

  factory AuthorChannelIdModel.fromJson(Map<String, dynamic> json) => AuthorChannelIdModel(
    value: json["value"],
  );
}