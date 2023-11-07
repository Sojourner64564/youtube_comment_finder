part of 'find_comment_cubit.dart';

@immutable
abstract class FindCommentState {}

class InitialState extends FindCommentState {}
class LoadingState extends FindCommentState {}
class LoadedState extends FindCommentState {
  final List<ItemModel> commentList;
  final List<List<ItemRepliesEntity>> repliesList;
  final String count;
  LoadedState(this.commentList, this.repliesList, this.count);
}

class FailState extends FindCommentState{

}
class ErrorState extends FindCommentState {}
