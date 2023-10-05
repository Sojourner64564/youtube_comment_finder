import 'package:bloc/bloc.dart';
import 'package:html/parser.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cubit_state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(Initial());

  void getif() async{
    var document = parse(
        sourceUrl: 'https://ufa.dikoed.ru/catalog/myed_paseka/', '');
    // print(document.head);
    //print(document.body);
    var response = await http.get(Uri.parse(
        'https://www.youtube.com/watch?v=R5tLKlaeEac'));
    //If the http request is successful the statusCode will be 200
    if (response.statusCode == 200) {
      final htmlToParse = response.body;
      var myDocument = parse(htmlToParse);
      emit(Loaded(htmlToParse));
      print(myDocument.body);
    } else {
      print(response.statusCode);
    }
  }
}
