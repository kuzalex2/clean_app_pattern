import 'package:utils/flavor.dart';

import 'app_config.dart';

const devAppConfig = AppConfig(
  Flavor.dev,
  enableDebugView: true,
  enableQaLogging: true,
  analyticsEnabled: (String.fromEnvironment('AnalyticsEnabled') == "true") ? true : false,
  userAgreementUrl: 'https://www.termsfeed.com/blog/sample-user-agreement-template/',
);
