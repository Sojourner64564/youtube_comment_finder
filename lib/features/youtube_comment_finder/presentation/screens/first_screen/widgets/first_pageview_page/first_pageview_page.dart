import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/assets/text_styles/my_text_styles.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';

class FirstPageviewPage extends StatelessWidget{
  const FirstPageviewPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/4),
          Container(
            color: MyColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Введите ссылку на видео',style: MyTextStyles.middleSizeGreyTextStyle,),
                  const SizedBox(height: 10),
                   TextField(
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
                    onPressed: () {  },
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