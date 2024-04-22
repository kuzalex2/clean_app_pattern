import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: KitAppBar(),
      body: Placeholder(
        child: Center(child: Text("SignupScreen")),
      ),
    );
  }
}
