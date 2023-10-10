import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/page_info_entity.dart';

class PageInfoModel extends PageInfoEntity{
 const PageInfoModel({
    required int totalResults,
    required int resultsPerPage,
  }) : super(totalResults: totalResults, resultsPerPage: resultsPerPage);

  factory PageInfoModel.fromJson(Map<String, dynamic> json) => PageInfoModel(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );
}