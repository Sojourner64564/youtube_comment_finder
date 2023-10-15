part of 'fetch_comments_cubit.dart';

abstract class MyState {}

class InitialState extends MyState {}
class LoadingState extends MyState {}

class LoadedState extends MyState {
  final List<ItemEntity> commentList;

  LoadedState(this.commentList);
}

class ErrorState extends MyState {}


