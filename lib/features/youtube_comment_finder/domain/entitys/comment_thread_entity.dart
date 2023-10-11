import 'package:equatable/equatable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/page_info_entity.dart';

class CommentThreadEntity{
  final String kind;
  final String etag;
  final PageInfoEntity pageInfo;
  final List<ItemEntity> items;

  const CommentThreadEntity({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

//  @override
 // List<Object?> get props => [kind, etag, pageInfoEntity, items];

}