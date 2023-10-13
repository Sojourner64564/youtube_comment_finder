import 'package:json_annotation/json_annotation.dart';
part 'author_channel_id_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorChannelIdEntity {
  const AuthorChannelIdEntity({
     this.value = '',
  });

  final String value;

}