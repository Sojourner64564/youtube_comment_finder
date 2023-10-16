import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class PageInfoEntity {
  final int totalResults;
  final int resultsPerPage;

 const PageInfoEntity({
     this.totalResults = 0,
     this.resultsPerPage = 0,
  });
}