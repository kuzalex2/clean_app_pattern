import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:utils/utils.dart';

class DebugInfo {
  static DebugInfo? _instance;
  static DebugInfo get instance => _instance == null ? _instance = DebugInfo._() : _instance!;

  String? _deviceInfoShort;
  String? _deviceInfoFull;

  String? _appInfo;
  String? _appVersion;
  String? _brand;

  String get deviceInfoShort => _deviceInfoShort ?? "";
  String get deviceInfoFull => _deviceInfoFull ?? "";

  String get appInfo => _appInfo ?? "";

  String get appVersion => _appVersion ?? "";

  String? get brand => _brand;

  DebugInfo._();

  static Future<void> init() => instance._init();

  Future<void> _init() async {
    final info = await getDeviceInfo();
    _deviceInfoShort = info.$1;
    _deviceInfoFull = info.$2;
    _appInfo = await getAppInfo();
  }

  Future<(String, String)> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final manufacturer = androidInfo.manufacturer;
      final model = androidInfo.model;
      _brand = androidInfo.brand;
      return ("$manufacturer $model", "$androidInfo");
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _brand = "apple";

      return (
        '$_brand ${iosInfo.utsname.machine} ${iosInfo.systemName} ${iosInfo.systemVersion}',
        "$iosInfo"
      );
    }
    return ("", "");
  }

  Future<String> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    _appVersion = version;
    String buildNumber = packageInfo.buildNumber;
    return "$packageName:$version($buildNumber)";
  }
}
