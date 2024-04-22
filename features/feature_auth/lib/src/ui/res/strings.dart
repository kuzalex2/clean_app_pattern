import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'strings_en.dart';
import 'strings_pt.dart';
import 'strings_ru.dart';

/// Callers can lookup localized strings with an instance of AuthStrings
/// returned by `AuthStrings.of(context)`.
///
/// Applications need to include `AuthStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'res/strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AuthStrings.localizationsDelegates,
///   supportedLocales: AuthStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AuthStrings.supportedLocales
/// property.
abstract class AuthStrings {
  AuthStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AuthStrings of(BuildContext context) {
    return Localizations.of<AuthStrings>(context, AuthStrings)!;
  }

  static const LocalizationsDelegate<AuthStrings> delegate = _AuthStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('ru')
  ];

  /// No description provided for @signupWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Signup with Email'**
  String get signupWithEmail;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The email address is already in use'**
  String get emailAlreadyInUse;

  /// No description provided for @enterAPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter a password'**
  String get enterAPassword;

  /// No description provided for @forgotPasswordButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPasswordButtonTitle;

  /// No description provided for @inputEmailInvalidText.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get inputEmailInvalidText;

  /// No description provided for @inputEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Your email'**
  String get inputEmailPlaceholder;

  /// No description provided for @inputPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Your password'**
  String get inputPasswordPlaceholder;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @loginButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginButtonTitle;

  /// No description provided for @loginErrorText.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong... Please try again later.'**
  String get loginErrorText;

  /// No description provided for @loginErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops...'**
  String get loginErrorTitle;

  /// No description provided for @loginPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginPageTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @pageNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get pageNotFoundError;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @startupError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong... Click to refresh'**
  String get startupError;

  /// No description provided for @wrongEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong email or password.'**
  String get wrongEmailOrPassword;
}

class _AuthStringsDelegate extends LocalizationsDelegate<AuthStrings> {
  const _AuthStringsDelegate();

  @override
  Future<AuthStrings> load(Locale locale) {
    return SynchronousFuture<AuthStrings>(lookupAuthStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AuthStringsDelegate old) => false;
}

AuthStrings lookupAuthStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AuthStringsEn();
    case 'pt': return AuthStringsPt();
    case 'ru': return AuthStringsRu();
  }

  throw FlutterError(
    'AuthStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
