import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class Alertings extends StatelessWidget {
  final Widget text;
  final Widget? icon;

  const Alertings({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(44.5, 20, 44.5, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, const SizedBox(height: 4)],
            DefaultTextStyle.merge(
              child: text,
              style: TextStyles.mobileBodyMinus1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
