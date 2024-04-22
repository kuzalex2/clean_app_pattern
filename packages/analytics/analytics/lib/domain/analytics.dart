import 'package:flutter/cupertino.dart';

abstract class AnalyticsTransport {
  Future<void> initialize();

  Future<void> logEvent(String name, Map<String, dynamic> parameters);

  Future<void> setCurrentScreen(String screenName, String screenClassOverride);

  NavigatorObserver get routeObserver;
}

class AnalyticsInstance {
  static late final AnalyticsTransport _instance;

  static AnalyticsTransport get instance => _instance;

  static Future<void> init(AnalyticsTransport plannerAnalyticsInterface) async {
    await plannerAnalyticsInterface.initialize();
    _instance = plannerAnalyticsInterface;
  }

  Future<void> initialize() => instance.initialize();

  Future<void> logEvent(String name, Map<String, dynamic> parameters) =>
      instance.logEvent(name, parameters);

  Future<void> setCurrentScreen(String screenName, String screenClassOverride) =>
      instance.setCurrentScreen(screenName, screenClassOverride);

  NavigatorObserver get routeObserver => instance.routeObserver;
}
