import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

import 'button_text_style.dart';

class Button extends StatelessWidget {
  static const _buttonCornerRadius = 10.0;
  static const EdgeInsetsGeometry _defaultPadding = EdgeInsets.all(6.0);
  static const _loadingSize = 24.0;
  static const _minimumHeight = 54.0;
  static const _defaultElevation = 5.0;
  static const _minimumWidth = 255.0;
  static const EdgeInsets _defaultButtonStylePadding = EdgeInsets.symmetric(horizontal: 16);

  final Widget? title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonColorScheme colorScheme;
  final double minimumWidth;
  final double minimumHeight;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final EdgeInsetsGeometry? buttonStylePadding;
  final TextStyle? textStyle;

  const Button.primary({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.minimumWidth = _minimumWidth,
    this.minimumHeight = _minimumHeight,
    this.padding,
    this.colorScheme = primaryButtonsColorScheme,
    this.elevation = _defaultElevation,
    this.buttonStylePadding,
    this.textStyle = primaryButtonsTextStyle,
  });

  const Button.secondary({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.minimumWidth = _minimumWidth,
    this.minimumHeight = _minimumHeight,
    this.padding,
    this.colorScheme = secondaryButtonsColorScheme,
    this.elevation = 0,
    this.buttonStylePadding,
    this.textStyle = primaryButtonsTextStyle,
  });

  const Button.ghost({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.minimumWidth = _minimumWidth,
    this.minimumHeight = _minimumHeight,
    this.padding,
    this.elevation = 0,
    this.buttonStylePadding,
    this.textStyle = primaryButtonsTextStyle,
  }) : colorScheme = primaryButtonsColorSchemeGhost;

  const Button.dangerUnderline({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.minimumWidth = 0,
    this.minimumHeight = 0,
    this.elevation = 0,
    this.buttonStylePadding = const EdgeInsets.symmetric(horizontal: 0),
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.textStyle = dangledUnderlineButtonsTextStyle,
  }) : colorScheme = primaryButtonsColorSchemeDangerUnderline;

  // bool get _isOnlyIcon => title == null && icon != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: minimumHeight),
      padding: padding ?? _defaultPadding,
      child: ElevatedButton(
        onPressed: isLoading ? () => {} : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(_backgroundColor),
          overlayColor: MaterialStateProperty.resolveWith(_backgroundColor),
          foregroundColor: MaterialStateProperty.resolveWith(_foregroundColor),
          padding: MaterialStateProperty.all(buttonStylePadding ?? _defaultButtonStylePadding),
          minimumSize: MaterialStateProperty.all(Size(minimumWidth, minimumHeight)),
          elevation: MaterialStateProperty.resolveWith(_elevation),
          shape: MaterialStateProperty.resolveWith(_shape),
        ),
        child: Builder(builder: (context) {
          return DefaultTextStyle(
            style: DefaultTextStyle.of(context).style.merge(textStyle),
            child: _body(context),
          );
        }),
      ),
    );
  }

  Widget _body(BuildContext context) {
    if (isLoading) {
      return SizedBox.square(
        dimension: _loadingSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: colorScheme.loadingForegroundColor,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: title ?? const SizedBox.shrink(),
        ),
      ],
    );
  }

  Color _backgroundColor(Set<MaterialState> states) {
    if (isLoading) {
      return colorScheme.loadingBackgroundColor;
    }
    if (states.contains(MaterialState.disabled)) {
      return colorScheme.disabledBackgroundColor;
    }
    if (states.contains(MaterialState.pressed)) {
      return colorScheme.pressedBackgroundColor;
    }
    return colorScheme.defaultBackgroundColor;
  }

  Color _foregroundColor(Set<MaterialState> states) {
    if (isLoading) {
      return colorScheme.loadingForegroundColor;
    }
    if (states.contains(MaterialState.disabled)) {
      return colorScheme.disabledForegroundColor;
    }
    if (states.contains(MaterialState.pressed)) {
      return colorScheme.pressedForegroundColor;
    }
    return colorScheme.defaultForegroundColor;
  }

  OutlinedBorder? _shape(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_buttonCornerRadius),
      side: colorScheme.strokeColorScheme != null
          ? BorderSide(
              width: 1,
              color: _strokeColor(colorScheme.strokeColorScheme!, states),
            )
          : BorderSide.none,
    );
  }

  Color _strokeColor(ButtonStrokeColorScheme colorScheme, Set<MaterialState> states) {
    if (isLoading) {
      return colorScheme.loadingColor;
    }
    if (states.contains(MaterialState.disabled)) {
      return colorScheme.disabledColor;
    }
    if (states.contains(MaterialState.pressed)) {
      return colorScheme.pressedColor;
    }
    return colorScheme.defaultColor;
  }

  double? _elevation(Set<MaterialState> states) {
    if (isLoading) {
      return 0;
    }
    if (states.contains(MaterialState.disabled)) {
      return 0;
    }
    if (states.contains(MaterialState.pressed)) {
      return 0;
    }
    return elevation;
  }
}
