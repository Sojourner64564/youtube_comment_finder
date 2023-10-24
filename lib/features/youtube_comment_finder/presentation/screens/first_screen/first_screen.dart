import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/first_page.dart';

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Парсер комментов'),
      ),
      backgroundColor: MyColors.secondBackgroundColor,
      body: FirstPage(),
    );
  }

}