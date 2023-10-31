part of 'find_comment_cubit.dart';

@immutable
abstract class FindCommentState {}

class InitialState extends FindCommentState {}
class LoadingState extends FindCommentState {}
class LoadedState extends FindCommentState {
  final List<ItemEntity> commentList;
  final List<List<ItemRepliesEntity>> repliesList;

  LoadedState(this.commentList, this.repliesList);

}
class ErrorState extends FindCommentState {}
