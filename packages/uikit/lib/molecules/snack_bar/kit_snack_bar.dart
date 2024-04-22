import 'package:flutter/material.dart';

class KitSnackBars {
  static SnackBar simple(String text) => SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
      );
}
