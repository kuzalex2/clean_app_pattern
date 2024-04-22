import 'package:engineer_menu/engineer_menu.dart';
import 'package:feature_auth/feature_auth.dart' as feature_auth;
import 'package:feature_main_screen/feature_main_screen.dart' as feature_main_screen;
import 'package:feature_inbox/feature_inbox.dart' as feature_inbox;
import 'package:feature_notifications/feature_notifications.dart' as feature_notifications;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:app1/ui/app_router.dart';
import 'package:utils/utils.dart';
import 'package:uikit/uikit.dart';

import '../config/app_config.dart';
import 'engineer_screen.dart';
import 'package:feature_flags/feature_flags.dart';

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<feature_auth.AuthRepository>.value(value: GetIt.instance.get()),
      ],
      child: const _SampleApp(),
    );
  }
}

class _SampleApp extends StatelessWidget {
  const _SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EngineerScreenCaller(
      enableGesture: GetIt.I<AppConfig>().enableDebugView &&
          (isFeatureEnabled(null, FeatureId.gestureInterceptors) || kIsWeb),
      enableShake: GetIt.I<AppConfig>().enableDebugView,
      onIntercept: () =>
          EngineerScreen.show(AppRouter.instance.router.routerDelegate.navigatorKey.currentContext),
      child: Features(store: FlagsStore.getInstance(), child: const _SampleAppMaterial()),
    );
  }
}

class _SampleAppMaterial extends StatefulWidget {
  const _SampleAppMaterial();

  @override
  State<_SampleAppMaterial> createState() => _SampleAppMaterialState();
}

class _SampleAppMaterialState extends State<_SampleAppMaterial> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        if (isFeatureEnabled(null, FeatureId.horizontalOrientation)) ...[
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: KitColors.baseColor),
        useMaterial3: false,
      ),
      routeInformationParser: AppRouter.instance.router.routeInformationParser,
      routeInformationProvider: AppRouter.instance.router.routeInformationProvider,
      routerDelegate: AppRouter.instance.router.routerDelegate,
      localizationsDelegates: const [
        ...feature_main_screen.MainScreenStrings.localizationsDelegates,
        ...feature_auth.AuthStrings.localizationsDelegates,
        ...feature_inbox.InboxStrings.localizationsDelegates,
        ...feature_notifications.NotificationsStrings.localizationsDelegates,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('pt'),
      ],
    );
  }
}
