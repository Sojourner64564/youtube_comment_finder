import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/author_channel_id_entity.dart';

class AuthorChannelIdModel extends AuthorChannelIdEntity{
  const AuthorChannelIdModel( {
    this.value = '',
  });

  final String value;

  factory AuthorChannelIdModel.fromJson(
      Map<String, dynamic> json) =>
      AuthorChannelIdModel(
        value: json['value'] as String? ?? '',
      );

  Map<String, dynamic> toJson(
      AuthorChannelIdModel instance) =>
      <String, dynamic>{
        'value': instance.value,
      };
}