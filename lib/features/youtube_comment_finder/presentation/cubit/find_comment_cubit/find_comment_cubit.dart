import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_replies_entity/item_replies_entity.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity/item_entity.dart';

part 'find_comment_state.dart';

@lazySingleton
class FindCommentCubit extends Cubit<FindCommentState> {
  FindCommentCubit() : super(InitialState());

  Future<void> findComment(String text) async{
    final myBox = await Hive.openBox('myBox');
    Object myOb = 'fdf';
    print(myOb.runtimeType);
    final ItemEntity itemEntity = ItemEntity();
    myBox.put('key', itemEntity);

  }

}
