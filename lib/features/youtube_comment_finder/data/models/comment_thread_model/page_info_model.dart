import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/page_info_entity.dart';

class PageInfoModel extends PageInfoEntity{
 const PageInfoModel({
     totalResults,
     resultsPerPage,
  }) : super(totalResults: totalResults, resultsPerPage: resultsPerPage);

 factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
     PageInfoModel(
       totalResults: json['totalResults'] as int? ?? 0,
       resultsPerPage: json['resultsPerPage'] as int? ?? 0,
     );

 Map<String, dynamic> toJson(PageInfoModel instance) =>
     <String, dynamic>{
       'totalResults': instance.totalResults,
       'resultsPerPage': instance.resultsPerPage,
     };

}