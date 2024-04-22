import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../log.dart';
import 'file_log_output.dart';

class ProductionLoggerStrategy extends _BasePluginLoggerStrategy {
  @override
  Future<void> initLogger() async {
    _logger = null;
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
}

class QaLoggerStrategy extends _BasePluginLoggerStrategy {
  @override
  Future<void> initLogger() async {
    final fileLogRootPath = (await getApplicationDocumentsDirectory()).path;
    final fileLogOutput = FileLogOutput(rootPath: fileLogRootPath);
    _logger = Logger(
      filter: ProductionFilter(),
      printer: SimplePrinter(colors: false),
      output: MultiOutput([ConsoleOutput(), fileLogOutput]),
    );
    debugPrint = (String? message, {int? wrapWidth}) {
      _logger?.d(message);
    };
    _logger?.d("Write log to file ${fileLogOutput.filePath}");
  }
}

class DevelopmentLoggerStrategy extends _BasePluginLoggerStrategy {
  @override
  Future<void> initLogger() async {
    _logger = Logger(
      filter: DevelopmentFilter(),
      printer: SimplePrinter(),
      output: ConsoleOutput(),
    );
  }
}

abstract class _BasePluginLoggerStrategy extends LoggerStrategy {
  late final Logger? _logger;

  @override
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.d(message, error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e(message, error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  @override
  void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.t(message, error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.w(message, error: error, stackTrace: stackTrace, time: DateTime.now());
  }

  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(message, error: error, stackTrace: stackTrace, time: DateTime.now());
  }
}
