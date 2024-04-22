import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart';
import 'dart:io';

class FileLogOutput extends LogOutput {
  FileLogOutput({required this.rootPath});

  String rootPath;
  String get filePath => _file.path;
  late File _file;
  final lock = Lock();

  @override
  Future<void> init() async {
    super.init();
    final fileName = "$rootPath/${DateTime.now().toIso8601String()}.txt";
    _file = File(fileName);
  }

  @override
  void output(OutputEvent event) async {
    await lock.synchronized(() async {
      for (var line in event.lines) {
        await _file.writeAsString("$line\n", mode: FileMode.writeOnlyAppend);
      }
    });
  }
}
