import 'dart:io' as io_platform;

import 'package:flutter/foundation.dart';

final class Platform {
  static bool get isAndroid => !kIsWeb && io_platform.Platform.isAndroid;
  static bool get isIOS => !kIsWeb && io_platform.Platform.isIOS;
  static bool get isMacOS => !kIsWeb && io_platform.Platform.isMacOS;
  static bool get isWeb => kIsWeb;
}
