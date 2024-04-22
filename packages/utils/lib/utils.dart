library utils;

export 'object.dart';
export 'flavor.dart';
export 'platform.dart';

import 'package:feature_flags/feature_flags.dart';
import 'package:flutter/cupertino.dart';
import "package:collection/collection.dart";

enum FeatureId {
  none,
  horizontalOrientation,
  gestureInterceptors,
  ;

  static List<Feature> get featuresList => values
      .whereNot((value) => value == FeatureId.none)
      .map((value) => Feature(value.name))
      .toList();
}

bool isFeatureEnabled(BuildContext? context, FeatureId featureId) =>
    Features.isFeatureEnabled(context, featureId.name);
