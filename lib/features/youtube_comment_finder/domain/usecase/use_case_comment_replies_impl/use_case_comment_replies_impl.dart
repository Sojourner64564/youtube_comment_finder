import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/core/usecase/use_case.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_repository.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';

@lazySingleton
class UseCaseCommentRepliesImpl implements UseCase<CommentRepliesModel, CommentRepliesParams>{
  UseCaseCommentRepliesImpl(this.commentRepliesRepository);

  final CommentRepliesRepository commentRepliesRepository;

  @override
  Future<Either<Failure, CommentRepliesModel>> call(CommentRepliesParams commentRepliesParams) async{
    return await  commentRepliesRepository.getCommentReplies(commentRepliesParams);
  }


}