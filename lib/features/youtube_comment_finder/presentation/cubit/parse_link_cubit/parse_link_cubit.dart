import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart';

@lazySingleton
class ParseLinkCubit extends Cubit<String> {
  ParseLinkCubit() : super('');

  final PageController pageController = PageController();

 void parseLink(String link){
   final fetchCommentsCubit = getIt<FetchCommentsCubit>();
    pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.linear);
    final list = link.split(''); //TODO сделать вывод ошибок в случае неправильного ввода
    list.removeRange(0, 32);
    final videoId = list.join('');
   fetchCommentsCubit.fetchComments(videoId);
 }
}
