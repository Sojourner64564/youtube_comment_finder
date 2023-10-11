import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FetchCommentsCubit myCubit = getIt<FetchCommentsCubit>();

  @override
  void initState() {
    myCubit.fetchComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<FetchCommentsCubit, MyState>(
            bloc: myCubit,
            builder: (context, state) {
              if (state is InitialState) {
                return const Text('sds');
              }
              if (state is LoadedState) {
                return Text(state.html);
              } else {
                return const Text('sds');
              }
            },
          ),
        ),
      ),
    );
  }
}
