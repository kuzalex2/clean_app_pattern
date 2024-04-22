import 'dart:async';

import 'package:flutter/widgets.dart';

import 'debug_view.dart';
import 'inherited_features.dart';
import 'flags_store.dart';

class Features extends StatefulWidget {
  const Features({
    Key? key,
    required this.child,
    required this.store,
  }) : super(key: key);

  final Widget child;
  final FlagsStore store;

  /// Allows to enable or disable the feature with the given [id].
  ///
  /// Its new [isEnabled] status is saved into local preferences and so it
  /// is persisted between app sessions.
  static void setFeature(
    BuildContext context,
    String id,
    bool isEnabled,
  ) async {
    final state = context.findAncestorStateOfType<_FeaturesState>();
    await state!.setFeature(id, isEnabled);
  }

  /// Indicates whether the feature with the given [id] is currently enabled.
  ///
  /// The feature can be enabled :
  ///  * from the [Features] 's constructor by passing [id] as [flags] parameter.
  ///  * by calling [setFeature] with [id]
  ///  * by showing the debug view with [showDebugView] with a declared [Feature].
  static bool isFeatureEnabled(BuildContext? context, String id) {
    if (context == null) {
      return FlagsStore.getInstance().isFeatureEnabled(id);
    }

    final state = InheritedModel.inheritFrom<InheritedFeatures>(
      context,
      aspect: id,
    );
    return state!.flags.contains(id);
  }

  /// Shows a debug view that allows to activate or deactive the given [availableFeatures].
  ///
  /// The [title] can be customized.
  static Future<void> showDebugView(
    BuildContext context, {
    required List<Feature> availableFeatures,
    String title = 'Feature flags',
  }) =>
      DebugFeatures.show(
        context,
        availableFeatures: availableFeatures,
        title: title,
      );

  static void reset(BuildContext context) {
    final state = context.findAncestorStateOfType<_FeaturesState>();
    state!.reset();
  }

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  StreamSubscription? _subs;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget.store.load();
      _subs = widget.store.stream.listen((event) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> setFeature(String id, bool isEnabled) async {
    widget.store.setFlag(id, isEnabled);
  }

  Future<void> reset() async {
    await widget.store.reset();
  }

  @override
  void dispose() {
    _subs?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedFeatures(
      flags: [
        ...widget.store.stream.value,
      ],
      child: widget.child,
    );
  }
}
