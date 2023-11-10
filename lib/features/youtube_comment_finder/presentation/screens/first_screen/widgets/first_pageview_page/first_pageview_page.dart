import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_comment_finder/assets/text_styles/my_text_styles.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/parse_link_cubit/parse_link_cubit.dart';

class FirstPageviewPage extends StatefulWidget{
  FirstPageviewPage();

  @override
  State<FirstPageviewPage> createState() => _FirstPageviewPageState();
}

class _FirstPageviewPageState extends State<FirstPageviewPage> {
  final fetchCommentCubit = getIt<FetchCommentsCubit>();

  final TextEditingController _controller = TextEditingController();

  final parseLinkCubit = getIt<ParseLinkCubit>();

  @override
  void initState() { //https://www.youtube.com/watch?v=5F6WUbhCr_c    https://www.youtube.com/watch?v=z8qaZax9qHM
    _controller.text = 'https://www.youtube.com/watch?v=5F6WUbhCr_c';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/4),
          Container(
            color: MyColors.firstBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Введите ссылку на видео',style: MyTextStyles.middleSizeGreyTextStyle,),
                  const SizedBox(height: 10),
                  BlocBuilder(
                    bloc: parseLinkCubit,
                      builder: (context, state){
                        return Text(state.toString(), style: MyTextStyles.smallSizeRedTextStyle,);
                      }
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  const Text('Пример: https://www.youtube.com/watch?v=pyKONWsQ1ek',
                  style: MyTextStyles.smallSizeGreyTextStyle,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      parseLinkCubit.parseLink(_controller.text);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(MyColors.purpleThemeColor),
                    ),
                    child: const Text('Запарсить',style: MyTextStyles.middleSizeGreyTextStyle,),
                  ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}