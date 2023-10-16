import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_thread_data_source/comment_thread_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/network/network_info.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_repository.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';

@LazySingleton(as: CommentThreadRepository)
class CommentThreadRepositoryImpl implements CommentThreadRepository{
  CommentThreadRepositoryImpl(this.networkInfo, this.commentThreadRemoteDataSource);

  final NetworkInfo networkInfo;
  final CommentThreadRemoteDataSource commentThreadRemoteDataSource;

  @override
  Future<Either<Failure, CommentThreadModel>> getCommentThread() async{
    if(await networkInfo.isConnected){
      final remoteComment = await commentThreadRemoteDataSource.fetchComments();
      return Right(remoteComment);
    }else{
      return Left(ServerFailure());
    }
  }
}