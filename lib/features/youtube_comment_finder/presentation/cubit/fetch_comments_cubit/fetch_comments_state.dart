part of 'fetch_comments_cubit.dart';

abstract class MyState {}

class InitialState extends MyState {}
class LoadingState extends MyState {}

class LoadedState extends MyState {
  final List<ItemModel> commentList;
  final List<List<ItemRepliesEntity>> repliesList;
  LoadedState(this.commentList, this.repliesList);
}


class ErrorState extends MyState {}


