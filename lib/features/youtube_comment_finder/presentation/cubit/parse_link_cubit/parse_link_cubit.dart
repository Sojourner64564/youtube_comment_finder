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
   emit('');
   final fetchCommentsCubit = getIt<FetchCommentsCubit>();
   if(link.contains('youtube')){
     if(link.contains('https')){
       pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.linear);
       final list = link.split('');
       list.removeRange(0, 32);
       final videoId = list.join('');
       fetchCommentsCubit.fetchComments(videoId);
       emit('');
     }else{
       emit('Неправильная ссылка');
     }
   }else{
     emit('Неправильная ссылка');
   }

 }
}
