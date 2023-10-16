import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/network/network_info.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source_impl.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_pager_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';
import 'package:youtube_comment_finder/random_shit/you.dart';

@LazySingleton(as: CommentThreadPagerRepository)
class CommentThreadPagerRepositoryImpl implements CommentThreadPagerRepository{
  CommentThreadPagerRepositoryImpl(this.networkInfo, this.commentThreadPagerRemoteDataSource);

  final NetworkInfo networkInfo;
  final CommentThreadPagerRemoteDataSource commentThreadPagerRemoteDataSource;

  @override
  Future<Either<Failure, CommentThreadModel>> getComments(Params params) async{
    if(await networkInfo.isConnected){
      final remoteComment = await commentThreadPagerRemoteDataSource.fetchComments(params);
      return Right(remoteComment);
    }else{
      return Left(ServerFailure());
    }
  }
}