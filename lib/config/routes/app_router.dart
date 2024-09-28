import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roohi_sample/config/routes/routes.dart';
import 'package:roohi_sample/presentation/screens/FacultyProfile.dart';
import 'package:roohi_sample/presentation/screens/SplashScreen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');



class AppRouter {
  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splashScreen,
    routes: <RouteBase>[
      _route(
        path: Routes.splashScreen,
        pageBuilder: (state) =>  const SplashScreen(),
      ),
      _route(
        path: Routes.facultyProfile,
        pageBuilder: (state) => const FacultyProfile(),
      ),

    ],
  );



  GoRoute _route({
    required String path,
    required Widget Function(GoRouterState state) pageBuilder,
    List<GoRoute> routes = const [],
  }) =>
      GoRoute(
        path: path,
        routes: routes,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<void>(
              key: state.pageKey,
              restorationId: state.pageKey.value,
              child: pageBuilder(state),
            ),
      );
}
