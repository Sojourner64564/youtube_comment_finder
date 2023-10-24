// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/youtube_comment_finder/presentation/screens/auto_scaffold_page/auto_scaffold_page.dart'
    as _i1;
import '../../features/youtube_comment_finder/presentation/screens/first_screen/first_screen.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AutoScaffoldRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.AutoScaffoldPage(),
      );
    },
    FirstScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.FirstScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          AutoScaffoldRouter.name,
          path: '/',
          children: [
            _i3.RouteConfig(
              FirstScreenRoute.name,
              path: '',
              parent: AutoScaffoldRouter.name,
            )
          ],
        )
      ];
}

/// generated route for
/// [_i1.AutoScaffoldPage]
class AutoScaffoldRouter extends _i3.PageRouteInfo<void> {
  const AutoScaffoldRouter({List<_i3.PageRouteInfo>? children})
      : super(
          AutoScaffoldRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AutoScaffoldRouter';
}

/// generated route for
/// [_i2.FirstScreen]
class FirstScreenRoute extends _i3.PageRouteInfo<void> {
  const FirstScreenRoute()
      : super(
          FirstScreenRoute.name,
          path: '',
        );

  static const String name = 'FirstScreenRoute';
}
