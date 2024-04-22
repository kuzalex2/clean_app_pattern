import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/atoms/kit_colors.dart';

class KitTextFormField2 extends StatelessWidget {
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final FocusNode? focusNode;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final ValueChanged<String>? onFieldSubmitted;

  const KitTextFormField2.primary({
    super.key,
    this.keyboardType,
    this.onChanged,
    this.readOnly = false,
    this.focusNode,
    this.autofocus = false,
    this.inputFormatters,
    this.textInputAction,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.onFieldSubmitted,
  });

  const KitTextFormField2.password({
    super.key,
    this.keyboardType,
    this.onChanged,
    this.readOnly = false,
    this.focusNode,
    this.autofocus = false,
    this.inputFormatters,
    this.textInputAction,
    this.hintText,
    this.errorText,
    this.obscureText = true,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
        filled: true,
        fillColor: !readOnly
            ? KitColors.inputFieldBackgroundEnabled
            : KitColors.inputFieldBackgroundDisabled,
        hintText: hintText,
        errorText: errorText,
        disabledBorder: const KitTextFormOutlineInputBorder(
          borderSide: BorderSide(color: KitColors.inputFieldStrokeDisabled),
        ),
        enabledBorder: const KitTextFormOutlineInputBorder(
          borderSide: BorderSide(color: KitColors.inputFieldStrokeEnabled),
        ),
        focusedBorder: const KitTextFormOutlineInputBorder(
          borderSide: BorderSide(color: KitColors.inputFieldStrokeActive),
        ),
        errorBorder: KitTextFormOutlineInputBorder(
          borderSide: BorderSide(
            color:
                !readOnly ? KitColors.inputFieldStrokeDisabled : KitColors.inputFieldStrokeDanger,
          ),
        ),
        focusedErrorBorder: const KitTextFormOutlineInputBorder(
          borderSide: BorderSide(color: KitColors.inputFieldStrokeDanger),
        ),
      ),
    );
  }
}

class KitTextFormOutlineInputBorder extends OutlineInputBorder {
  const KitTextFormOutlineInputBorder({super.borderSide})
      : super(borderRadius: const BorderRadius.all(Radius.circular(10)));
}
