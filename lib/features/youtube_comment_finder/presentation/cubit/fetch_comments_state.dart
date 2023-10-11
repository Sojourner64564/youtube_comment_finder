part of 'fetch_comments_cubit.dart';

abstract class MyState {}

class InitialState extends MyState {}
class LoadingState extends MyState {}

class LoadedState extends MyState {
  final String html;

  LoadedState(this.html);
}

class ErrorState extends MyState {}


