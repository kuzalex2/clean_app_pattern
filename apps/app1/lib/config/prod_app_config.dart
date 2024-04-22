import 'package:utils/flavor.dart';

import 'app_config.dart';

const prodAppConfig = AppConfig(
  Flavor.prod,
  enableDebugView: false,
  enableQaLogging: false,
  analyticsEnabled: (String.fromEnvironment('AnalyticsEnabled') == "true") ? true : false,
  userAgreementUrl: 'https://www.termsfeed.com/blog/sample-user-agreement-template/',
);
