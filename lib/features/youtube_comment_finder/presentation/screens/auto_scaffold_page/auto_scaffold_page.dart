import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/core/routes/routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AutoScaffoldPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          FirstScreenRoute(),
        ],
      bottomNavigationBuilder: (buildContext, tabsRouter){
        return SalomonBottomBar(
          backgroundColor: Colors.redAccent,
          currentIndex: tabsRouter.activeIndex,

          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Главная"),
              selectedColor: Colors.white,
              unselectedColor: Colors.grey,
            ),

          ],

        );
      },
    );
  }

}