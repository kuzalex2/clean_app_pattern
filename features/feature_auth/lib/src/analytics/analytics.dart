import 'package:analytics/analytics.dart';

enum ButtonClickEvent {
  google,
  apple,
  email,
  login,
}

extension on ButtonClickEvent {
  String get analyticsValue => "Auth.ButtonClickEvent${name.toCapitalized()}";
}

class Analytics {
  static final Analytics instance = Analytics._();

  Analytics._();

  void trackButtonClick(ButtonClickEvent event) {
    AnalyticsInstance.instance.logEvent(event.analyticsValue, {});
  }
}
