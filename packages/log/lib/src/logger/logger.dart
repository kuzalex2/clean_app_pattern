import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'logger_strategy_impl.dart';

typedef L = LoggerContext;

class LoggerContext {
  static late final LoggerStrategy _loggerStrategy;

  static Future<void> init({required bool qaLogging}) => kIsWeb
      ? initDevelopmentMode()
      : (qaLogging
          ? initInQaMode()
          : kDebugMode
              ? initDevelopmentMode()
              : initInProductionMode());

  static Future<void> _init(LoggerStrategy loggerStrategy) async {
    _loggerStrategy = loggerStrategy;
    await _loggerStrategy.initLogger();
  }

  static Future<void> initInProductionMode() => _init(ProductionLoggerStrategy());
  static Future<void> initInQaMode() => _init(QaLoggerStrategy());
  static Future<void> initDevelopmentMode() => _init(DevelopmentLoggerStrategy());

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _loggerStrategy.d(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _loggerStrategy.e(message, error, stackTrace);
  }

  static void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _loggerStrategy.t(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _loggerStrategy.w(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _loggerStrategy.i(message, error, stackTrace);
  }

  static Future<void> shareLogFiles(BuildContext context) async {
    final filePath = await FilesystemPicker.open(
        title: 'Pick log file',
        // ignore: use_build_context_synchronously
        context: context,
        rootDirectory: await getApplicationDocumentsDirectory(),
        allowedExtensions: ['.txt', '.log'],
        fsType: FilesystemType.file,
        fileTileSelectMode: FileTileSelectMode.wholeTile);
    if (filePath != null) {
      // ignore_for_file: deprecated_member_use
      Share.shareFiles([filePath], text: 'Log file');
    }
  }
}

abstract class LoggerStrategy {
  Future<void> initLogger();

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void t(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]);
}
