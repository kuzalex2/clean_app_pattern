import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SendVerifyEmailScreen extends StatelessWidget {
  const SendVerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: KitAppBar(
        leading: SizedBox.shrink(),
      ),
      body: Placeholder(
        child: Center(child: Text("SendVerifyEmailScreen")),
      ),
    );
  }
}
