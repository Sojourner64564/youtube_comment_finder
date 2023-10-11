import 'package:equatable/equatable.dart';

class PageInfoEntity {
  final int totalResults;
  final int resultsPerPage;

 const PageInfoEntity({
     this.totalResults = 0,
     this.resultsPerPage = 0,
  });
}