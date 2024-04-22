import 'package:flutter/services.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError {
  inputPasswordErrorTooWeakPasswordOneLowercase,
  inputPasswordErrorTooWeakPasswordOneUppercase,
  inputPasswordErrorTooWeakPasswordOneNumerical,
  inputPasswordErrorTooWeakPasswordOneSpecial,
  inputPasswordErrorTooWeakPasswordLength,

  /// other errors
  inputPasswordErrorTooWeakPassword,
}

enum ConfirmedPasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExpressions = {
    PasswordValidationError.inputPasswordErrorTooWeakPasswordOneLowercase: RegExp(r'(?=.*[a-z])'),
    PasswordValidationError.inputPasswordErrorTooWeakPasswordOneUppercase: RegExp(r'(?=.*[A-Z])'),
    PasswordValidationError.inputPasswordErrorTooWeakPasswordOneNumerical: RegExp(r'(?=.*\d)'),
    PasswordValidationError.inputPasswordErrorTooWeakPasswordOneSpecial: RegExp(r'(?=.*[!@#$&*])'),
    PasswordValidationError.inputPasswordErrorTooWeakPasswordLength: RegExp(r'.{8,}'),
  };

  static final inputFormatters = [
    LengthLimitingTextInputFormatter(64),
  ];

  @override
  PasswordValidationError? validator(String? value) {
    final password = value ?? '';
    final match = _passwordRegExpressions.values.every((regExp) => regExp.hasMatch(password));

    if (match) {
      return null;
    }

    for (var error in PasswordValidationError.values) {
      if (!_passwordRegExpressions[error]!.hasMatch(password)) {
        return error;
      }
    }

    return PasswordValidationError.inputPasswordErrorTooWeakPassword;
  }
}

class LoginPassword extends FormzInput<String, PasswordValidationError> {
  const LoginPassword.pure([super.value = '']) : super.pure();
  const LoginPassword.dirty([super.value = '']) : super.dirty();

  static final _loginPasswordRegExpression = RegExp(r'.+');

  static final inputFormatters = [
    LengthLimitingTextInputFormatter(64),
  ];

  @override
  PasswordValidationError? validator(String? value) {
    return _loginPasswordRegExpression.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.inputPasswordErrorTooWeakPasswordLength;
  }
}

class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// The original password
  final String password;

  const ConfirmedPassword.pure({required this.password, required String value}) : super.pure(value);
  const ConfirmedPassword.dirty({required this.password, required String value})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String? value) =>
      password == value ? null : ConfirmedPasswordValidationError.invalid;
}
