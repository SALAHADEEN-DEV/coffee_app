/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_page1_1.jpeg
  AssetGenImage get imagePage11 =>
      const AssetGenImage('assets/images/image_page1_1.jpeg');

  /// File path: assets/images/image_page2_1.jpeg
  AssetGenImage get imagePage21 =>
      const AssetGenImage('assets/images/image_page2_1.jpeg');

  /// File path: assets/images/image_page2_2.jpeg
  AssetGenImage get imagePage22 =>
      const AssetGenImage('assets/images/image_page2_2.jpeg');

  /// File path: assets/images/image_page2_3.jpeg
  AssetGenImage get imagePage23 =>
      const AssetGenImage('assets/images/image_page2_3.jpeg');

  /// File path: assets/images/image_page2_4.jpeg
  AssetGenImage get imagePage24 =>
      const AssetGenImage('assets/images/image_page2_4.jpeg');

  /// File path: assets/images/image_page2_5.jpeg
  AssetGenImage get imagePage25 =>
      const AssetGenImage('assets/images/image_page2_5.jpeg');

  /// File path: assets/images/image_page3_1.jpeg
  AssetGenImage get imagePage31 =>
      const AssetGenImage('assets/images/image_page3_1.jpeg');

  /// File path: assets/images/image_page4_1.jpeg
  AssetGenImage get imagePage41 =>
      const AssetGenImage('assets/images/image_page4_1.jpeg');

  /// File path: assets/images/image_page5_1.jpeg
  AssetGenImage get imagePage51 =>
      const AssetGenImage('assets/images/image_page5_1.jpeg');

  /// File path: assets/images/image_page5_2.jpeg
  AssetGenImage get imagePage52 =>
      const AssetGenImage('assets/images/image_page5_2.jpeg');

  /// File path: assets/images/image_page5_3.jpeg
  AssetGenImage get imagePage53 =>
      const AssetGenImage('assets/images/image_page5_3.jpeg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    imagePage11,
    imagePage21,
    imagePage22,
    imagePage23,
    imagePage24,
    imagePage25,
    imagePage31,
    imagePage41,
    imagePage51,
    imagePage52,
    imagePage53,
    logo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
