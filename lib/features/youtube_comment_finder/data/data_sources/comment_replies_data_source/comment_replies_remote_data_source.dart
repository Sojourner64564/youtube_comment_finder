import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_replies_data_source/comment_replies_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_replies_model/comment_replies_model.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/comment_replies_params/comment_replies_params.dart';
import 'dart:convert';

@LazySingleton(as: CommentRepliesRemoteDataSource)
class CommentRepliesRemoteDataSourceImpl implements CommentRepliesRemoteDataSource{
  @override
  Future<CommentRepliesModel> fetchReplies(CommentRepliesParams commentRepliesParams) async{
    final response = await http.get(
      Uri.parse('https://youtube.googleapis.com/youtube/v3/comments?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet&parentId=${commentRepliesParams.parentId}'),
    );
    if(response.statusCode == 200){
      return CommentRepliesModel.fromJson(json.decode(response.body));
    }else{
      throw ServerFailure();
    }
  }
}