import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SendResetPasswordScreen extends StatelessWidget {
  final String initialEmail;
  const SendResetPasswordScreen({super.key, required this.initialEmail});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: KitAppBar(),
      body: Placeholder(child: Center(child: Text("SendResetPasswordScreen"))),
    );
  }
}
