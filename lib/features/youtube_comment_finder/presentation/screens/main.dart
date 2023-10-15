import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_comment_finder/assets/text_styles/my_text_styles.dart';
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
                    width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(state.commentList[firstIndex].itemSnippet.topLevelComment.snippet.textOriginal,
                            style: MyTextStyles.topLevelCommentTextStyle,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width*0.7,
                              child: ListView.separated(
                                itemCount: state.commentList[firstIndex].replies.comments.length,
                                itemBuilder: (BuildContext context, int secondIndex){
                                     return Text(state.commentList[firstIndex].replies.comments[secondIndex].snippet.textOriginal);
                              }, separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(height: 20,thickness: 5,);
                              },
                              ),
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
