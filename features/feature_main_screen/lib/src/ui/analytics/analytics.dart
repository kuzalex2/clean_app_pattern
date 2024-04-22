import 'package:analytics/analytics.dart';

import '../cubit.dart';

extension on MainPagePageType {
  String get analyticsValue => "MainScreen.trackNavbarClick${name.toCapitalized()}";
}

class Analytics {
  static final Analytics instance = Analytics._();

  Analytics._();

  void trackNavbarClick(MainPagePageType? page) {
    if (page != null) {
      AnalyticsInstance.instance.logEvent(page.analyticsValue, {});
    }
  }
}
