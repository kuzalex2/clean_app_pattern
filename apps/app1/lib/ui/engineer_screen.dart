import 'package:engineer_menu/engineer_menu.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:log/log.dart';
import 'package:utils/utils.dart';
import 'package:uikit/uikit.dart';
import 'package:feature_flags/feature_flags.dart';

import '../config/app_config.dart';

class EngineerScreen extends StatelessWidget {
  final AuthRepository authRepository;
  const EngineerScreen(this.authRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KitAppBar(
        middle: Text("Debug info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("On iOS shake the device or press control + ⌘ + z in the simulator."
                "On Android shake the device or press hardware menu button (available on older >devices and in most of the emulators,"
                "e.g. in genymotion you can press ⌘ + m to >simulate hardware menu button click)\n"),
            _ShortFullInfo("Application Config", "${GetIt.I<AppConfig>().dump()}\n"),
            Text("App info: ${DebugInfo.instance.appInfo}\n"),
            Text("Device info: ${DebugInfo.instance.deviceInfoShort}\n"),
            _ShortFullInfo("Device info full", DebugInfo.instance.deviceInfoFull),
            const Text("\n"),
            Text("Screen info:\n${context.screenInfo}\n"),
            TextButton(
              onPressed: () => _showMediaInfoDialog(context),
              child: const Text("MediaQuery"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () =>
                  DebugFeatures.show(context, availableFeatures: FeatureId.featuresList),
              child: const Text("Feature flags"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => L.shareLogFiles(context),
              child: const Text("Log files"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const StorybookWidget()),
                );
              },
              child: const Text("UIKit Storybook"),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
                stream: authRepository.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return Wrap(children: [
                      const Text("User: "),
                      SelectableText(user.id),
                      SelectableText(user.email),
                    ]);
                    //;${user.id} ${user.email}");
                  } else {
                    return const Text("User: null");
                  }
                }),
          ]),
        ),
      ),
    );
  }

  static show(BuildContext? context) {
    if (context != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => EngineerScreen(GetIt.instance.get())),
      );
    }
  }

  void _showMediaInfoDialog(BuildContext context) => showDialog(
        context: context,
        builder: (_) => Dialog(
          insetPadding: const EdgeInsets.all(8),
          child: Text(MediaQuery.of(context).toString()),
        ),
      );
}

class _ShortFullInfo extends StatefulWidget {
  final String name;
  final String value;
  const _ShortFullInfo([this.name = "", this.value = ""]);

  @override
  State<_ShortFullInfo> createState() => _ShortFullInfoState();
}

class _ShortFullInfoState extends State<_ShortFullInfo> {
  bool _showFull = false;
  static const _maxLength = 30;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showFull = !_showFull),
      child: Text(widget.value.length > _maxLength
          ? "${widget.name}: ${_showFull ? widget.value : "${widget.value.substring(0, _maxLength)}..."}"
          : "${widget.name}: ${widget.value}"),
    );
  }
}

extension on BuildContext {
  String get screenInfo {
    final mediaQuery = MediaQuery.of(this);
    return "width=${mediaQuery.size.width.toStringAsFixed(2)} height=${mediaQuery.size.height.toStringAsFixed(2)}\n"
        "paddings top=${mediaQuery.padding.top.toStringAsFixed(2)} bottom=${mediaQuery.padding.bottom.toStringAsFixed(2)}\n"
        "devicePixelRatio=${mediaQuery.devicePixelRatio}";
  }
}
