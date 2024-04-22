import 'package:flutter/material.dart';
import 'package:log/log.dart';
import 'package:shake_gesture/shake_gesture.dart';

class EngineerScreenCaller extends StatefulWidget {
  final bool enableGesture;
  final bool enableShake;
  final VoidCallback? onIntercept;
  final Widget child;

  const EngineerScreenCaller({
    super.key,
    required this.enableGesture,
    required this.enableShake,
    this.onIntercept,
    required this.child,
  });

  @override
  State<EngineerScreenCaller> createState() => _EngineerScreenCallerState();
}

class _EngineerScreenCallerState extends State<EngineerScreenCaller> {
  static const tapInterval = Duration(milliseconds: 400);
  static DateTime get _veryOldStartTime => DateTime.now().subtract(tapInterval);

  DateTime _lastEvent = _veryOldStartTime;

  _onShakeEvent() {
    if (widget.onIntercept == null || !widget.enableShake) return;
    L.i("_onShakeEvent");
    widget.onIntercept!.call();
  }

  _onDoubleTapEvent() {
    if (widget.onIntercept == null || !widget.enableGesture) return;
    L.i("_onDoubleTapEvent");

    final now = DateTime.now();

    if (now.difference(_lastEvent) >= tapInterval) {
      _lastEvent = now;

      return;
    }

    _lastEvent = _veryOldStartTime;
    widget.onIntercept!.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enableGesture && !widget.enableShake) {
      return widget.child;
    }

    Widget result = widget.child;

    if (widget.enableGesture) {
      result = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: _onDoubleTapEvent,
        child: result,
      );
    }

    if (widget.enableShake) {
      result = ShakeGesture(
        onShake: _onShakeEvent,
        child: result,
      );
    }

    return result;
  }
}
