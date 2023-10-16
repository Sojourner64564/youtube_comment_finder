import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/page_info_entity.dart';

class PageInfoModel extends PageInfoEntity{
  PageInfoModel({
    resultsPerPage,
}):super(resultsPerPage: resultsPerPage);

  factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
      PageInfoModel(
        resultsPerPage: json['resultsPerPage'] as int? ?? 0,
      );
}