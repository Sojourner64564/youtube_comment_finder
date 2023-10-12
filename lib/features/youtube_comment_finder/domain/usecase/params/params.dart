import 'package:equatable/equatable.dart';

class Params extends Equatable{
  const Params(this.pageToken);
  final String pageToken;
  @override
  List<Object?> get props => [pageToken];
}