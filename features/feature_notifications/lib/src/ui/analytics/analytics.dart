import 'package:analytics/analytics.dart';

class Analytics {
  static final Analytics instance = Analytics._();

  Analytics._();

  void testEvent() {
    AnalyticsInstance.instance.logEvent("Notifications.testEvent1", {});
  }
}
