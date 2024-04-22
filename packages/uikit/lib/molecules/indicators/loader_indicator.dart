import 'package:flutter/material.dart';

import 'package:uikit/atoms/kit_colors.dart';

class KitLoaderIndicator extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;

  const KitLoaderIndicator({
    super.key,
    required this.width,
    required this.height,
    this.color = KitColors.iconBrand,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
          valueColor: AlwaysStoppedAnimation(color),
          strokeWidth: strokeWidth,
          strokeCap: StrokeCap.butt,
        ),
      ),
    );
  }
}
