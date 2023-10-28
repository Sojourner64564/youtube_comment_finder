import 'package:equatable/equatable.dart';

class Params extends Equatable{
  const Params({this.videoId='' ,this.pageToken=''});
  final String videoId;
  final String pageToken;
  @override
  List<Object?> get props => [videoId, pageToken];
}