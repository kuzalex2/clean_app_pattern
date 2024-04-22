import 'strings.dart';

/// The translations for Portuguese (`pt`).
class AuthStringsPt extends AuthStrings {
  AuthStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get signupWithEmail => 'Signup with Email';

  @override
  String get emailAlreadyInUse => 'The email address is already in use';

  @override
  String get enterAPassword => 'Enter a password';

  @override
  String get forgotPasswordButtonTitle => 'Forgot your password?';

  @override
  String get inputEmailInvalidText => 'Invalid email address';

  @override
  String get inputEmailPlaceholder => 'Your email';

  @override
  String get inputPasswordPlaceholder => 'Your password';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get loginButtonTitle => 'Log in';

  @override
  String get loginErrorText => 'Something went wrong... Please try again later.';

  @override
  String get loginErrorTitle => 'Oops...';

  @override
  String get loginPageTitle => 'Log in';

  @override
  String get ok => 'OK';

  @override
  String get pageNotFoundError => 'Something went wrong...';

  @override
  String get refresh => 'Refresh';

  @override
  String get startupError => 'Something went wrong... Click to refresh';

  @override
  String get wrongEmailOrPassword => 'Wrong email or password.';
}
