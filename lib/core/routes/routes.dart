import 'package:auto_route/auto_route.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/auto_scaffold_page/auto_scaffold_page.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/screens/first_screen/first_screen.dart';

@MaterialAutoRouter(
    replaceInRouteName:'Page,Route',
    routes: <AutoRoute>[
        AutoRoute(
            initial: true,
            name: 'AutoScaffoldRouter',
            page: AutoScaffoldPage,
            children: [
                AutoRoute(
                    path: '',
                    name: 'FirstScreenRoute',
                    page: FirstScreen,
                ),
            ],
        ),
    ]
)
class $AppRouter{}