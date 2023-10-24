import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/widgets/first_pageview_page/first_pageview_page.dart';

class FirstPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        const FirstPageviewPage(),
        Text('df-----------d'),

      ],
    );
  }

}