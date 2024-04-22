import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class CheckYourEmailScreen extends StatelessWidget {
  final String email;

  const CheckYourEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: KitAppBar(),
      body: Placeholder(child: Center(child: Text("CheckYourEmailScreen"))),
    );
  }
}
