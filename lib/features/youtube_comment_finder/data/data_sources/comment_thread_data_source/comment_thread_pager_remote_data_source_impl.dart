import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/usecase/params/params.dart';

@LazySingleton(as: CommentThreadPagerRemoteDataSource)
class CommentThreadPagerRemoteDataSourceImpl implements CommentThreadPagerRemoteDataSource{
  @override
  Future<CommentThreadModel> fetchComments(Params params) async{ // dbF9oRa0a7g мои комменты //много комментов WxcsUbjJNKs
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=WxcsUbjJNKs&pageToken=${params.pageToken}'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return CommentThreadModel.fromJson(json.decode(response.body));
    } else {
      throw ServerFailure();
    }
  }

}