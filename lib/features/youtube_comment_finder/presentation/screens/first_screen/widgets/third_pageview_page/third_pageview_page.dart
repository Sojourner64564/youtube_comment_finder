import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_comment_finder/assets/text_styles/my_text_styles.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/find_comment_cubit/find_comment_cubit.dart';

class ThirdPageviewPage extends StatelessWidget{
  ThirdPageviewPage();
  final _controller = TextEditingController();
  final findComment = getIt<FindCommentCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(children: [
              const Text('Найдено совпадений: ',style: MyTextStyles.middleSizeGreyTextStyle,),
              BlocBuilder(
                bloc: findComment,
                  builder: (BuildContext context, FindCommentState state){
                    if(state is InitialState){
                      return const Text('',style: MyTextStyles.middleSizeGreyTextStyle);
                    }
                    if(state is LoadingState){
                      return const Text('. . .',style: MyTextStyles.middleSizeGreyTextStyle);
                    }
                    if(state is LoadedState){
                      return Text(state.count, style: MyTextStyles.middleSizeGreyTextStyle);
                    }
                    if(state is FailState){
                      return const Text('0',style: MyTextStyles.middleSizeGreyTextStyle);
                    }else{
                      return const Text('ошибка',style: MyTextStyles.middleSizeGreyTextStyle);
                    }

                  },
              ),
            ],),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              style: MyTextStyles.smallSizeGreyTextStyle,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: MyColors.purpleThemeColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: MyColors.redAccentThemeColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  findComment.findComment(_controller.text);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(MyColors.purpleThemeColor),
                ),
                child: const Text('Найти',style: MyTextStyles.middleSizeGreyTextStyle,),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            width: double.infinity,
            child: BlocBuilder<FindCommentCubit, FindCommentState>(
              bloc: findComment,
              builder: (BuildContext context, FindCommentState state) {
                if(state is InitialState){
                  return const Center(child: Text('Введите слово', style: MyTextStyles.largeThiccSizeGreyTextStyle,));
                }
                if(state is LoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                if(state is LoadedState){
                  return ListView.separated(
                    itemCount: state.commentList.length,
                    itemBuilder: (BuildContext context, int firstIndex){
                      return Container(
                          width: double.infinity,
                          color: MyColors.firstBackgroundColor,
                          child: Column(
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
                                child: Container(
                                  height: 2,
                                  width: double.infinity,
                                  color: MyColors.purpleThemeColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: SizedBox(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: ListView.separated(
                                    itemCount: state.repliesList[firstIndex].length,
                                    itemBuilder: (BuildContext context, int secondIndex){
                                      return Text(
                                        state.repliesList[firstIndex][secondIndex].snippet.textOriginal,
                                        style: MyTextStyles.bottomLevelCommentTextStyle,
                                      );
                                    }, separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(
                                      height: 20,
                                      thickness: 1,
                                      color: MyColors.redAccentThemeColor,
                                    );
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
                }
                if(state is FailState){
                  return const Center(child: Text('Cовпадений не найдено', style: MyTextStyles.middleSizeGreyTextStyle,),);
                }
                else{
                  return const Center(child: Text('cringe'));
                }

              },
            ),
          )
        ],
        ),
      ),
    );
  }

}