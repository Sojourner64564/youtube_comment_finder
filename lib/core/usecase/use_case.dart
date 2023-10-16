import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';

abstract class UseCase<Type, TypeParams>{
  Future<Either<Failure, Type>> call(TypeParams params);
}