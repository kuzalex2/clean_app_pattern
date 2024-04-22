/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $GraphicsGen {
  const $GraphicsGen();

  $GraphicsAvatarsGen get avatars => const $GraphicsAvatarsGen();
  $GraphicsIconsGen get icons => const $GraphicsIconsGen();
}

class $GraphicsAvatarsGen {
  const $GraphicsAvatarsGen();

  $GraphicsAvatarsBottomNavigationGen get bottomNavigation =>
      const $GraphicsAvatarsBottomNavigationGen();
}

class $GraphicsIconsGen {
  const $GraphicsIconsGen();

  $GraphicsIconsGeneralGen get general => const $GraphicsIconsGeneralGen();
  $GraphicsIconsMenuGen get menu => const $GraphicsIconsMenuGen();
}

class $GraphicsAvatarsBottomNavigationGen {
  const $GraphicsAvatarsBottomNavigationGen();

  /// File path: graphics/avatars/bottom_navigation/normal.svg
  SvgGenImage get normal =>
      const SvgGenImage('graphics/avatars/bottom_navigation/normal.svg');

  /// List of all assets
  List<SvgGenImage> get values => [normal];
}

class $GraphicsIconsGeneralGen {
  const $GraphicsIconsGeneralGen();

  $GraphicsIconsGeneralSGen get s => const $GraphicsIconsGeneralSGen();
  $GraphicsIconsGeneralXSGen get xs => const $GraphicsIconsGeneralXSGen();
}

class $GraphicsIconsMenuGen {
  const $GraphicsIconsMenuGen();

  $GraphicsIconsMenuMGen get m => const $GraphicsIconsMenuMGen();
}

class $GraphicsIconsGeneralSGen {
  const $GraphicsIconsGeneralSGen();

  $GraphicsIconsGeneralSChevronGen get chevron =>
      const $GraphicsIconsGeneralSChevronGen();
}

class $GraphicsIconsGeneralXSGen {
  const $GraphicsIconsGeneralXSGen();

  /// File path: graphics/icons/general/XS/close.svg
  SvgGenImage get close =>
      const SvgGenImage('graphics/icons/general/XS/close.svg');

  /// List of all assets
  List<SvgGenImage> get values => [close];
}

class $GraphicsIconsMenuMGen {
  const $GraphicsIconsMenuMGen();

  $GraphicsIconsMenuMInboxGen get inbox => const $GraphicsIconsMenuMInboxGen();

  /// File path: graphics/icons/menu/M/lost connection.svg
  SvgGenImage get lostConnection =>
      const SvgGenImage('graphics/icons/menu/M/lost connection.svg');

  $GraphicsIconsMenuMNotificationGen get notification =>
      const $GraphicsIconsMenuMNotificationGen();

  /// List of all assets
  List<SvgGenImage> get values => [lostConnection];
}

class $GraphicsIconsGeneralSChevronGen {
  const $GraphicsIconsGeneralSChevronGen();

  /// File path: graphics/icons/general/S/chevron/left.svg
  SvgGenImage get left =>
      const SvgGenImage('graphics/icons/general/S/chevron/left.svg');

  /// List of all assets
  List<SvgGenImage> get values => [left];
}

class $GraphicsIconsMenuMInboxGen {
  const $GraphicsIconsMenuMInboxGen();

  /// File path: graphics/icons/menu/M/inbox/normal.svg
  SvgGenImage get normal =>
      const SvgGenImage('graphics/icons/menu/M/inbox/normal.svg');

  /// List of all assets
  List<SvgGenImage> get values => [normal];
}

class $GraphicsIconsMenuMNotificationGen {
  const $GraphicsIconsMenuMNotificationGen();

  /// File path: graphics/icons/menu/M/notification/normal.svg
  SvgGenImage get normal =>
      const SvgGenImage('graphics/icons/menu/M/notification/normal.svg');

  /// List of all assets
  List<SvgGenImage> get values => [normal];
}

class Assets {
  Assets._();

  static const $GraphicsGen graphics = $GraphicsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'uikit',
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package = 'uikit',
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/uikit/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'uikit',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/uikit/$_assetName';
}
