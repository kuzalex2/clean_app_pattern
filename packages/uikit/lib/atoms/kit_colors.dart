import 'package:flutter/material.dart';

class KitColors {
  const KitColors._();

  static const Color transparent = Color.fromARGB(0, 0, 0, 0);
  static const Color baseColor = Color.fromRGBO(167, 121, 240, 1.0);

  ///
  /// text
  static const Color textPrimary = Color.fromRGBO(10, 10, 10, 1.0);
  static const Color buttonTextPressed = Color.fromRGBO(207, 207, 207, 1.0);

  ///
  /// button
  static const Color buttonBackgroundPrimaryEnabled = baseColor;
  static const Color buttonBackgroundPrimaryPressed = baseColor;
  static const Color buttonBackgroundDisabled = Color.fromRGBO(252, 252, 252, 1.0);
  static const Color buttonCircleBackgroundSecondary = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color buttonStrokePrimary = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color buttonStrokeTetriary = baseColor;
  static const Color buttonLabelPrimary = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color buttonLabelDisabled = Color.fromRGBO(183, 183, 183, 1.0);
  static const Color buttonLabelTetriary = Color.fromRGBO(136, 136, 136, 1.0);

  static const Color buttonLabelSecondary = Color.fromRGBO(10, 10, 10, 1.0);

  /// button Secondary
  ///
  static const Color buttonBackgroundSecondaryEnabled = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color buttonBackgroundSecondaryHover = Color.fromRGBO(254, 254, 254, 1.0);

  ///
  /// surface
  static const Color surfacePrimary = Color.fromRGBO(255, 255, 255, 1.0);

  ///
  ///
  static const Color buttonLabelDanger = baseColor;

  ///
  /// input fields
  static const Color inputFieldStrokeEnabled = Color.fromRGBO(231, 231, 231, 1.0);
  static const Color inputFieldStrokeDisabled = Color.fromRGBO(254, 254, 254, 1.0);
  static const Color inputFieldStrokeActive = baseColor;
  static const Color inputFieldStrokeDanger = baseColor;
  static const Color inputFieldBackgroundEnabled = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color inputFieldBackgroundDisabled = Color.fromRGBO(254, 254, 254, 1.0);

  ///
  /// icons
  static const Color iconBrand = baseColor;
}
