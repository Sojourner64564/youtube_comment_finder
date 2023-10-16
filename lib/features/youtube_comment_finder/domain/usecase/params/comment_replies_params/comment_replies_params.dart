import 'package:equatable/equatable.dart';

class CommentRepliesParams extends Equatable{
  const CommentRepliesParams({this.parentId = '', this.pageToken = ''});
  final String parentId;
  final String pageToken;
  @override
  List<Object?> get props => [parentId, pageToken];
}