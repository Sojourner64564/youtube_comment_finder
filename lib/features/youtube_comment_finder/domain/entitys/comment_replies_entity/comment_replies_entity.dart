import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/page_info_entity.dart';

class CommentRepliesEntity {
  final String kind;
  final String etag;
  final PageInfoEntity pageInfo;
  final List<ItemEntity> items;

  const CommentRepliesEntity({
     this.kind = '',
     this.etag = '',
     this.pageInfo = const PageInfoEntity(),
     this.items = const [],
  });

}




