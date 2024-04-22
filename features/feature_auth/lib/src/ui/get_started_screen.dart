import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:router/router.dart';

import '../../../feature_auth.dart';
import '../analytics/analytics.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Container(
              color: KitColors.baseColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Button.ghost(
                    title: Text(strings.signupWithEmail),
                    onPressed: () {
                      Analytics.instance.trackButtonClick(ButtonClickEvent.email);

                      context.go(RouterPath.signup);
                    },
                  ),
                  Button.ghost(
                    title: Text(strings.login),
                    onPressed: () {
                      Analytics.instance.trackButtonClick(ButtonClickEvent.login);

                      context.go(RouterPath.login);
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
