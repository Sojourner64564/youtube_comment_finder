import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/assets/text_styles/my_text_styles.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/first_page.dart';

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.firstBackgroundColor,
        centerTitle: true,
        title: const Text('Парсер комментов', style: MyTextStyles.largeThiccSizeGreyTextStyle,),
      ),
      backgroundColor: MyColors.secondBackgroundColor,
      body: FirstPage(),
    );
  }

}