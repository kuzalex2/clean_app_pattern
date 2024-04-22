import 'package:flutter/services.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();
  const Email.dirty([super.value = '']) : super.dirty();

  /// RFC2822
  static final RegExp _emailRegExp = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    caseSensitive: false,
  );

  static final inputFormatters = [
    LengthLimitingTextInputFormatter(64),
  ];

  @override
  EmailValidationError? validator(String? value) =>
      _emailRegExp.hasMatch(value ?? '') ? null : EmailValidationError.invalid;
}
