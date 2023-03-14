import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';
import 'package:riverpod_boilerplate/src/feature/auth/auth.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final key = GlobalKey<NavigatorState>();
    return GoRouter(
      initialLocation: Paths.splashRoute.path,
      navigatorKey: key,
      routes: [
        GoRoute(
          path: Paths.splashRoute.path,
          name: Paths.splashRoute.routeName,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
          ),
        ),
      ],
      errorBuilder: (context, state) => const ErrorScreen(),
      redirect: (BuildContext context, GoRouterState state) async {
        return null;
      },
      debugLogDiagnostics: kDebugMode,
    );
  },
);

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          ),
        );
}
