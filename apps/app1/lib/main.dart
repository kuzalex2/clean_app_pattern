import 'package:engineer_menu/engineer_menu.dart';
import 'package:feature_auth/feature_auth.dart' as feature_auth;
import 'package:auth_provider1/auth_provider1.dart' as auth_provider1;
import 'package:feature_flags/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:log/log.dart';

import 'package:analytics/domain/analytics.dart';
import 'package:analytics_impl/analytics_impl.dart' as analytics_impl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app1/config/app_config.dart';
import 'package:app1/ui/app.dart';
import 'package:utils/utils.dart';

import 'config/dev_app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<AppConfig>(Flavor.dev.appConfig);

  GetIt.instance.registerLazySingleton<feature_auth.AuthRepository>(
    () => auth_provider1.Provider1AuthImpl(),
  );
  GetIt.instance.registerLazySingleton<AnalyticsTransport>(
    () => analytics_impl.AnalyticsImpl(analyticsEnabled: GetIt.I<AppConfig>().analyticsEnabled),
  );

  GetIt.instance.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  await L.init(qaLogging: GetIt.I<AppConfig>().enableQaLogging);
  L.d("Starting App");
  await AnalyticsInstance.init(GetIt.I<AnalyticsTransport>());

  await loadFeatureFlags();
  for (var feature in FeatureId.values) {
    L.d("Feature $feature enabled: ${isFeatureEnabled(null, feature)}");
  }

  await DebugInfo.init();

  runApp(const SampleApp());
}

Future<void> loadFeatureFlags() => FlagsStore.getInstance().load();

extension FlavorAppConfig on Flavor {
  AppConfig get appConfig => {
        Flavor.dev: devAppConfig,
      }[this]!;
}
