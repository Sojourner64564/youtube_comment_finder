import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:youtube_comment_finder/core/injectable/injectable.dart';
import 'package:youtube_comment_finder/core/routes/routes.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

}
