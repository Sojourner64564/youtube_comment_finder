part of 'cubit_cubit.dart';

@immutable
abstract class MyState {}

class Initial extends MyState {}
class Loaded extends MyState {
  final String html;

  Loaded(this.html);
}

