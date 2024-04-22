import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

import '../../feature_notifications.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = NotificationsStrings.of(context);

    return Placeholder(
      child: Center(child: Text(strings.notifications)),
    );
  }
}

class NotificationsNavbarDestination extends StatelessWidget {
  final ColorFilter activeColorFilter;

  SvgGenImage get image => Assets.graphics.icons.menu.m.notification.normal;

  const NotificationsNavbarDestination({super.key, required this.activeColorFilter});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: image.svg(),
      selectedIcon: image.svg(
        colorFilter: activeColorFilter,
      ),
      label: '',
    );
  }
}
