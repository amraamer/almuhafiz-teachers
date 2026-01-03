// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/fire.json
  LottieGenImage get fire =>
      const LottieGenImage('assets/animations/fire.json');

  /// File path: assets/animations/loading.json
  LottieGenImage get loading =>
      const LottieGenImage('assets/animations/loading.json');

  /// List of all assets
  List<LottieGenImage> get values => [fire, loading];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/DecoType Thuluth Regular.ttf
  String get decoTypeThuluthRegular =>
      'assets/fonts/DecoType Thuluth Regular.ttf';

  /// List of all assets
  List<String> get values => [decoTypeThuluthRegular];
}

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/alert.png
  AssetGenImage get alert => const AssetGenImage('assets/pngs/alert.png');

  /// File path: assets/pngs/auth-image.png
  AssetGenImage get authImage =>
      const AssetGenImage('assets/pngs/auth-image.png');

  /// File path: assets/pngs/delete.png
  AssetGenImage get delete => const AssetGenImage('assets/pngs/delete.png');

  /// File path: assets/pngs/error-circle.png
  AssetGenImage get errorCircle =>
      const AssetGenImage('assets/pngs/error-circle.png');

  /// File path: assets/pngs/error-square.png
  AssetGenImage get errorSquare =>
      const AssetGenImage('assets/pngs/error-square.png');

  /// File path: assets/pngs/female_profile.png
  AssetGenImage get femaleProfile =>
      const AssetGenImage('assets/pngs/female_profile.png');

  /// File path: assets/pngs/fire-rank.png
  AssetGenImage get fireRank =>
      const AssetGenImage('assets/pngs/fire-rank.png');

  /// File path: assets/pngs/loading-image.png
  AssetGenImage get loadingImage =>
      const AssetGenImage('assets/pngs/loading-image.png');

  /// File path: assets/pngs/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/pngs/lock.png');

  /// File path: assets/pngs/logo-name.png
  AssetGenImage get logoName =>
      const AssetGenImage('assets/pngs/logo-name.png');

  /// File path: assets/pngs/male-profile.png
  AssetGenImage get maleProfile =>
      const AssetGenImage('assets/pngs/male-profile.png');

  /// File path: assets/pngs/renewal.png
  AssetGenImage get renewal => const AssetGenImage('assets/pngs/renewal.png');

  /// File path: assets/pngs/rug-image.png
  AssetGenImage get rugImage =>
      const AssetGenImage('assets/pngs/rug-image.png');

  /// File path: assets/pngs/success.png
  AssetGenImage get success => const AssetGenImage('assets/pngs/success.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    alert,
    authImage,
    delete,
    errorCircle,
    errorSquare,
    femaleProfile,
    fireRank,
    loadingImage,
    lock,
    logoName,
    maleProfile,
    renewal,
    rugImage,
    success,
  ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/apple.svg
  String get apple => 'assets/svgs/apple.svg';

  /// File path: assets/svgs/book-nav.svg
  String get bookNav => 'assets/svgs/book-nav.svg';

  /// File path: assets/svgs/google.svg
  String get google => 'assets/svgs/google.svg';

  /// File path: assets/svgs/guest.svg
  String get guest => 'assets/svgs/guest.svg';

  /// File path: assets/svgs/home-nav.svg
  String get homeNav => 'assets/svgs/home-nav.svg';

  /// File path: assets/svgs/logo-name.svg
  String get logoName => 'assets/svgs/logo-name.svg';

  /// File path: assets/svgs/man.svg
  String get man => 'assets/svgs/man.svg';

  /// File path: assets/svgs/moon-nav.svg
  String get moonNav => 'assets/svgs/moon-nav.svg';

  /// File path: assets/svgs/round-arrow-down.svg
  String get roundArrowDown => 'assets/svgs/round-arrow-down.svg';

  /// File path: assets/svgs/round-arrow-up.svg
  String get roundArrowUp => 'assets/svgs/round-arrow-up.svg';

  /// File path: assets/svgs/search.svg
  String get search => 'assets/svgs/search.svg';

  /// File path: assets/svgs/star.svg
  String get star => 'assets/svgs/star.svg';

  /// File path: assets/svgs/user-nav.svg
  String get userNav => 'assets/svgs/user-nav.svg';

  /// File path: assets/svgs/video-circle-nav.svg
  String get videoCircleNav => 'assets/svgs/video-circle-nav.svg';

  /// File path: assets/svgs/woman.svg
  String get woman => 'assets/svgs/woman.svg';

  /// List of all assets
  List<String> get values => [
    apple,
    bookNav,
    google,
    guest,
    homeNav,
    logoName,
    man,
    moonNav,
    roundArrowDown,
    roundArrowUp,
    search,
    star,
    userNav,
    videoCircleNav,
    woman,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngsGen pngs = $AssetsPngsGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
