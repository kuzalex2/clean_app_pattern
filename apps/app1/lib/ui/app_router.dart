import 'dart:async';

import 'package:feature_auth/feature_auth.dart' as feature_auth;
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_main_screen/feature_main_screen.dart' as feature_main_screen;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:analytics/analytics.dart';
import 'package:log/log.dart';
import 'package:router/router.dart';
import 'package:utils/utils.dart';
import 'package:uikit/uikit.dart';

class AppRouter {
  GoRouter? _router;
  static final AppRouter instance = AppRouter();

  GoRouter get router => _router ??= GoRouter(
        initialLocation: RouterPath.welcome.n,
        redirect: (BuildContext context, GoRouterState state) {
          final user = context.read<feature_auth.AuthRepository>().user.value;
          L.d("check redirect for ${state.matchedLocation}");

          if (state.matchedLocation == "/") {
            return RouterPath.welcome.n;
          }

          if (user == null) {
            return RouterPath.welcome.n;
          }

          if (user.notLoggedIn) {
            if (state.matchedLocation.startsWith(RouterPath.getStarted.n)) {
              return null;
            }

            return RouterPath.getStarted.n;
          }

          ///
          /// user.loggedIn

          // if (state.matchedLocation == RouterPath.verifyEmail.n) {
          //   if (user.privateUser.emailVerified) {
          //     return RouterPath.home.n;
          //   } else {
          //     return null;
          //   }
          // }

          if (!user.privateUser.emailVerified) {
            return RouterPath.sendVerifyEmail.n;
          }

          // if the user is logged in but still on the login page, send them to
          // the home page

          if (state.matchedLocation.startsWith(RouterPath.getStarted.n) ||
              state.matchedLocation == RouterPath.welcome.n) {
            return RouterPath.home.n;
          }

          // no need to redirect at all
          return null;
        },
        routes: _routes,
        observers: [GetIt.I<AnalyticsTransport>().routeObserver],
        debugLogDiagnostics: true,
        errorBuilder: (context, state) => const _NotFoundScreen(),
        refreshListenable:
            _GoRouterRefreshStream(GetIt.instance.get<feature_auth.AuthRepository>().user),
      );

  final List<RouteBase> _routes = [
    GoRoute(
      path: RouterPath.welcome.n,
      name: RouterPath.welcome.name,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const feature_auth.WelcomeScreen(),
        name: RouterPath.welcome.name,
      ),
    ),

    GoRoute(
      path: RouterPath.sendVerifyEmail.n,
      name: RouterPath.sendVerifyEmail.name,
      builder: (context, state) => const feature_auth.SendVerifyEmailScreen(),
    ),

    GoRoute(
      path: RouterPath.getStarted.n,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const feature_auth.GetStartedScreen(),
        name: RouterPath.getStarted.name,
      ),
      routes: [
        GoRoute(
          path: RouterPath.login.name,
          name: RouterPath.login.name,
          builder: (context, state) => const feature_auth.LoginScreen(),
          routes: [
            GoRoute(
              path: RouterPath.sendResetPassword.name,
              name: RouterPath.sendResetPassword.name,
              builder: (context, state) => feature_auth.SendResetPasswordScreen(
                  initialEmail: state.extra.asOrNull<String>() ?? ""),
            ),
            GoRoute(
              path: RouterPath.checkYourEmail.name,
              name: RouterPath.checkYourEmail.name,
              builder: (context, state) => feature_auth.CheckYourEmailScreen(
                email: state.extra.asOrNull<String>() ?? "",
              ),
            ),
          ],
        ),
        GoRoute(
          path: RouterPath.signup.name,
          name: RouterPath.signup.name,
          builder: (context, state) => const feature_auth.SignupScreen(),
        ),
      ],
    ),

    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          _SomeStubRepositoryWidget(child: child),
      routes: [
        GoRoute(
          path: RouterPath.home.n,
          name: RouterPath.home.name,
          builder: (context, state) => const feature_main_screen.MainPage(),
          routes: const [
            ///...
          ],
        )
      ],
    ),
    // Home
  ];
}

class _SomeStubRepositoryWidget extends StatelessWidget {
  final Widget child;
  const _SomeStubRepositoryWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Alertings(
                    text: Text(strings.pageNotFoundError),
                    icon: Assets.graphics.icons.menu.m.lostConnection.svg(),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Button.primary(
                  onPressed: () => GoRouter.of(context).go("/"),
                  title: Text(strings.ok),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on RouterPath {
  String get n => "/$name";
}

class _GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
