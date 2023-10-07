import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_comment_finder/cubit_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyCubit myCubit = MyCubit();

  @override
  void initState() {
    myCubit.myMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: BlocBuilder<MyCubit, MyState>(
              bloc: myCubit,
              builder: (context, state) {
                if (state is Initial) {
                  return Text('sds');
                }
                if (state is Loaded) {
                  return Text(state.html);
                } else {
                  return Text('sds');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
