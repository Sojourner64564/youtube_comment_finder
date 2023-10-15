import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart';

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
        body: BlocBuilder<FetchCommentsCubit, MyState>(
          bloc: myCubit,
          builder: (context, state) {
            if (state is InitialState) {
              return const Text('sds');
            }
            if (state is LoadedState) {
              return ListView.separated(
                itemCount: state.commentList.length,
                  itemBuilder: (BuildContext context, int firstIndex){
                  return Container(
                    color: Colors.cyan,
                      child: Column(
                        children: [
                          Text(state.commentList[firstIndex].topLevelComment),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width*0.7,
                            child: ListView.separated(
                                itemCount: state.commentList[firstIndex].replies.length,
                                itemBuilder: (BuildContext context, int secondIndex){
                                   return Text(state.commentList[firstIndex].replies[secondIndex]);
                            }, separatorBuilder: (BuildContext context, int index) {
                                  return const Divider(height: 20,thickness: 5,);
                            },
                            ),
                          ),
                        ],
                      ));
                  },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 30);
                },
              );
            } else {
              return const Text('sds');
            }
          },
        ),
      ),
    );
  }
}
