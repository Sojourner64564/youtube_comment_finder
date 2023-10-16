import 'package:dartz/dartz.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_replies_data_source/comment_replies_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/network/network_info.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';

class CommentRepliesRepositoryImpl implements CommentRepliesRepository{
  CommentRepliesRepositoryImpl(this.networkInfo, this.commentRepliesRemoteDataSource);
  final NetworkInfo networkInfo;
  final CommentRepliesRemoteDataSource commentRepliesRemoteDataSource;

  @override
  Future<Either<Failure, CommentRepliesModel>> getCommentReplies(CommentRepliesParams commentRepliesParams) async{
   if(await networkInfo.isConnected){
     final remoteReplies = await commentRepliesRemoteDataSource.fetchReplies(commentRepliesParams);
     return Right(remoteReplies);
   }else{
     return Left(ServerFailure());
   }
  }
}