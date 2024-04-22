import 'package:flutter/material.dart';
import '../../uikit.dart';

class ButtonStrokeColorScheme {
  const ButtonStrokeColorScheme({
    required this.defaultColor,
    required this.pressedColor,
    required this.disabledColor,
    required this.loadingColor,
  });

  final Color defaultColor;
  final Color pressedColor;
  final Color disabledColor;
  final Color loadingColor;
}

class ButtonColorScheme {
  final Color defaultBackgroundColor;
  final Color pressedBackgroundColor;
  final Color disabledBackgroundColor;
  final Color loadingBackgroundColor;

  final Color defaultForegroundColor;
  final Color pressedForegroundColor;
  final Color disabledForegroundColor;
  final Color loadingForegroundColor;
  final ButtonStrokeColorScheme? strokeColorScheme;

  const ButtonColorScheme({
    required this.defaultBackgroundColor,
    required this.pressedBackgroundColor,
    required this.disabledBackgroundColor,
    required this.loadingBackgroundColor,
    required this.defaultForegroundColor,
    required this.pressedForegroundColor,
    required this.disabledForegroundColor,
    required this.loadingForegroundColor,
    this.strokeColorScheme,
  });

  ButtonColorScheme copyWith({
    Color? defaultBackgroundColor,
    Color? pressedBackgroundColor,
    Color? disabledBackgroundColor,
    Color? loadingBackgroundColor,
    Color? defaultForegroundColor,
    Color? pressedForegroundColor,
    Color? disabledForegroundColor,
    Color? loadingForegroundColor,
    ValueGetter<ButtonStrokeColorScheme?>? strokeColorScheme,
  }) {
    return ButtonColorScheme(
      defaultBackgroundColor: defaultBackgroundColor ?? this.defaultBackgroundColor,
      pressedBackgroundColor: pressedBackgroundColor ?? this.pressedBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      loadingBackgroundColor: loadingBackgroundColor ?? this.loadingBackgroundColor,
      defaultForegroundColor: defaultForegroundColor ?? this.defaultForegroundColor,
      pressedForegroundColor: pressedForegroundColor ?? this.pressedForegroundColor,
      disabledForegroundColor: disabledForegroundColor ?? this.disabledForegroundColor,
      loadingForegroundColor: loadingForegroundColor ?? this.loadingForegroundColor,
      strokeColorScheme:
          strokeColorScheme != null ? strokeColorScheme.call() : this.strokeColorScheme,
    );
  }
}

const primaryButtonsColorScheme = ButtonColorScheme(
  /// background
  defaultBackgroundColor: KitColors.buttonBackgroundPrimaryEnabled,
  pressedBackgroundColor: KitColors.buttonBackgroundPrimaryPressed,
  disabledBackgroundColor: KitColors.buttonBackgroundDisabled,
  loadingBackgroundColor: KitColors.buttonBackgroundPrimaryPressed,

  /// foreground
  defaultForegroundColor: KitColors.buttonLabelPrimary,
  pressedForegroundColor: KitColors.buttonLabelPrimary,
  disabledForegroundColor: KitColors.buttonLabelDisabled,
  loadingForegroundColor: KitColors.buttonLabelPrimary,
);

const primaryButtonsColorSchemeGhost = ButtonColorScheme(
  /// background
  defaultBackgroundColor: Colors.transparent,
  pressedBackgroundColor: Color.fromRGBO(184, 29, 39, 0.06),
  loadingBackgroundColor: Colors.transparent,
  disabledBackgroundColor: Colors.transparent,

  /// foreground
  defaultForegroundColor: KitColors.buttonLabelPrimary,
  pressedForegroundColor: KitColors.buttonLabelPrimary,
  loadingForegroundColor: KitColors.buttonLabelPrimary,
  disabledForegroundColor: KitColors.buttonLabelDisabled,
);

const primaryButtonsColorSchemeDangerUnderline = ButtonColorScheme(
  /// background
  defaultBackgroundColor: Colors.transparent,
  pressedBackgroundColor: Colors.transparent,
  loadingBackgroundColor: Colors.transparent,
  disabledBackgroundColor: Colors.transparent,

  /// foreground
  defaultForegroundColor: KitColors.buttonLabelTetriary,
  pressedForegroundColor: KitColors.buttonTextPressed,
  loadingForegroundColor: KitColors.buttonLabelTetriary,
  disabledForegroundColor: KitColors.buttonLabelTetriary,
);

const secondaryButtonsColorScheme = ButtonColorScheme(
  /// background
  defaultBackgroundColor: KitColors.buttonBackgroundSecondaryEnabled,
  pressedBackgroundColor: KitColors.buttonBackgroundSecondaryHover,
  disabledBackgroundColor: KitColors.buttonBackgroundDisabled,
  loadingBackgroundColor: KitColors.buttonBackgroundSecondaryEnabled,

  /// foreground
  defaultForegroundColor: KitColors.buttonLabelSecondary,
  pressedForegroundColor: KitColors.buttonLabelDanger,
  disabledForegroundColor: KitColors.buttonLabelDisabled,
  loadingForegroundColor: KitColors.buttonLabelDanger,

  strokeColorScheme: ButtonStrokeColorScheme(
    defaultColor: KitColors.buttonStrokePrimary,
    pressedColor: KitColors.buttonStrokeTetriary,
    disabledColor: KitColors.buttonBackgroundDisabled,
    loadingColor: KitColors.buttonStrokeTetriary,
  ),
);
