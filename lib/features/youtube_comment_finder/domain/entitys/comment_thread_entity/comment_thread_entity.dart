import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/page_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_thread_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CommentThreadEntity{
  final String kind;
  final String etag;
  final String nextPageToken;
  final PageInfoEntity pageInfo;
  final List<ItemEntity> items;

  const CommentThreadEntity({
     this.kind = '',
     this.etag = '',
     this.nextPageToken = '',
     this.pageInfo = const PageInfoEntity(),
     this.items = const [],
  });
}