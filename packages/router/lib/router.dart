library router;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouterPath {
  welcome,
  getStarted,
  login,
  sendResetPassword,
  checkYourEmail,
  signup,
  sendVerifyEmail,
  home,
  ;
}

extension GoRouterHelper on BuildContext {
  void go(RouterPath location, {Object? extra, Map<String, String>? pathParams}) =>
      GoRouter.of(this).goNamed(location.name, extra: extra);
}
