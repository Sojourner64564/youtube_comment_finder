import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/cubit/parse_link_cubit/parse_link_cubit.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/widgets/first_pageview_page/first_pageview_page.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/widgets/second_pageview_page/second_pageview_page.dart';

class FirstPage extends StatefulWidget{

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late PageController _pageController;
  final parseLinkCubit = getIt<ParseLinkCubit>();
  @override
  void initState() {
    _pageController = parseLinkCubit.pageController;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        FirstPageviewPage(),
        SecondPageviewPage(),

      ],
    );
  }
}