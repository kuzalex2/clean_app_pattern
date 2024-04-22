import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

import '../../feature_inbox.dart';

class InboxWidget extends StatelessWidget {
  const InboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = InboxStrings.of(context);

    // Strings.inbox;
    return Placeholder(
      child: Center(child: Text(strings.inbox)),
    );
  }
}

class InboxNavbarDestination extends StatelessWidget {
  final ColorFilter activeColorFilter;

  SvgGenImage get image => Assets.graphics.icons.menu.m.inbox.normal;

  const InboxNavbarDestination({super.key, required this.activeColorFilter});

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
