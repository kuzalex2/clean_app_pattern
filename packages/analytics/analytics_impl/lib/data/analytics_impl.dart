import 'package:analytics/analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:log/log.dart';

class AnalyticsImpl implements AnalyticsTransport {
  final bool analyticsEnabled;

  const AnalyticsImpl({required this.analyticsEnabled});

  @override
  Future<void> initialize() => Future.value(null);

  @override
  Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
    L.d('logEvent: $name, $parameters');

    /// ...
  }

  @override
  Future<void> setCurrentScreen(String screenName, String screenClassOverride) async {
    /// ...
  }

  @override
  NavigatorObserver get routeObserver => NavigatorObserver();
}
