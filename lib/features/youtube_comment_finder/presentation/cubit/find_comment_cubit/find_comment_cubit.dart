import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/comment_thread_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/comment_thread_model/item_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_replies_entity.dart';

part 'find_comment_state.dart';

@lazySingleton
class FindCommentCubit extends Cubit<FindCommentState> {
  FindCommentCubit() : super(InitialState());

  Future<void> findComment(String text) async{
    final myBox = await Hive.openBox('myBox');
    final myJson = myBox.get('key');
    print(myJson);
    final myModel = CommentThreadModel.fromJson(json.decode(myJson));
    final itemList = myModel.items;
    print(myModel.items[0].itemSnippet.topLevelComment.snippet.textOriginal);
    print(itemList[0].itemSnippet.topLevelComment.snippet.textOriginal);
    /*emit(LoadingState());
    if(text.isNotEmpty){
      final myBox = await Hive.openBox('myBox');
      final myJson = myBox.get('key');
      final myModel = CommentThreadModel.fromJson(jsonDecode(myJson));
      final itemList = myModel.items;
      /*final listOfItem = itemList.where((element) =>
          element.itemSnippet.topLevelComment.snippet.textOriginal.contains(
              text));*/
      print(itemList[0]);

      if(itemList.isNotEmpty){
        emit(LoadedState(itemList, [], 0.toString()));

        //emit(LoadedState(listOfItem, [], listOfItem.length.toString()));
    }else{
      emit(FailState());
    }
    }else{
      emit(FailState());
    }*/
  }

}
