import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/data_sources/comment_thread_data_source/comment_thread_remote_data_source.dart';
import 'package:youtube_comment_finder/core/error/failure.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:http/http.dart' as http;


@LazySingleton(as: CommentThreadRemoteDataSource)
class CommentThreadRemoteDataSourceImpl implements CommentThreadRemoteDataSource{
  @override
  Future<CommentThreadModel> fetchComments() async{ // _HebGGHVaZI - 1 коммент _94dSVxTW80 - много комментов
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=9qCir67FlU8'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return CommentThreadModel.fromJson(json.decode(response.body));
    } else {
      throw ServerFailure();
    }
  }

}
