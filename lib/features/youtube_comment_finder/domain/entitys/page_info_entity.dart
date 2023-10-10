import 'package:equatable/equatable.dart';

class PageInfoEntity {
  final int totalResults;
  final int resultsPerPage;

 const PageInfoEntity({
    required this.totalResults,
    required this.resultsPerPage,
  });

 // @override
  //List<Object?> get props => [totalResults, resultsPerPage];
}