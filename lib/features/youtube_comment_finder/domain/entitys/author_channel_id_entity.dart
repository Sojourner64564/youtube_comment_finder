import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true)
class AuthorChannelIdEntity {
  const AuthorChannelIdEntity({
     this.value = '',
  });

  final String value;

}