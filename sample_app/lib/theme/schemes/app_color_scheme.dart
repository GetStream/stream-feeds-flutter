import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';

/// {@template app_color_scheme}
/// Color scheme for the Stream Feeds sample app.
///
/// Uses [AppColorTokens] for consistent color values across themes.
/// {@endtemplate}
@immutable
class AppColorScheme {
  /// Creates an [AppColorScheme].
  const AppColorScheme({
    required this.textHighEmphasis,
    required this.textLowEmphasis,
    required this.disabled,
    required this.borders,
    required this.inputBg,
    required this.appBg,
    required this.barsBg,
    required this.linkBg,
    required this.accentPrimary,
    required this.accentError,
    required this.accentInfo,
    required this.highlight,
    required this.overlay,
    required this.overlayDark,
    required this.bgGradient,
  });

  /// Creates a light color scheme using design tokens.
  factory AppColorScheme.light() {
    return const AppColorScheme(
      textHighEmphasis: AppColorTokens.black,
      textLowEmphasis: AppColorTokens.gray500,
      disabled: AppColorTokens.gray200,
      borders: AppColorTokens.gray100,
      inputBg: AppColorTokens.gray300,
      appBg: AppColorTokens.gray50,
      barsBg: AppColorTokens.white,
      linkBg: AppColorTokens.blue50,
      accentPrimary: AppColorTokens.blue500,
      accentError: AppColorTokens.red500,
      accentInfo: AppColorTokens.green500,
      highlight: AppColorTokens.yellow100,
      overlay: AppColorTokens.blackAlpha20,
      overlayDark: AppColorTokens.blackAlpha60,
      bgGradient: AppColorTokens.lightGradient,
    );
  }

  /// Creates a dark color scheme using design tokens.
  factory AppColorScheme.dark() {
    return const AppColorScheme(
      textHighEmphasis: AppColorTokens.white,
      textLowEmphasis: AppColorTokens.gray500,
      disabled: AppColorTokens.gray700,
      borders: AppColorTokens.gray800,
      inputBg: AppColorTokens.gray900,
      appBg: AppColorTokens.black,
      barsBg: AppColorTokens.gray850,
      linkBg: AppColorTokens.blue900,
      accentPrimary: AppColorTokens.blue600,
      accentError: AppColorTokens.red600,
      accentInfo: AppColorTokens.green500,
      highlight: AppColorTokens.yellow800,
      overlay: AppColorTokens.blackAlpha40,
      overlayDark: AppColorTokens.whiteAlpha60,
      bgGradient: AppColorTokens.darkGradient,
    );
  }

  /// Creates a color scheme for the given [brightness] using design tokens.
  ///
  /// This is the recommended way to create color schemes as it automatically
  /// selects the appropriate light or dark variant based on brightness.
  factory AppColorScheme.fromBrightness(Brightness brightness) {
    return switch (brightness) {
      Brightness.light => AppColorScheme.light(),
      Brightness.dark => AppColorScheme.dark(),
    };
  }

  /// High emphasis text color.
  final Color textHighEmphasis;

  /// Low emphasis text color.
  final Color textLowEmphasis;

  /// Disabled element color.
  final Color disabled;

  /// Border color.
  final Color borders;

  /// Input background color.
  final Color inputBg;

  /// App background color.
  final Color appBg;

  /// Bars background color.
  final Color barsBg;

  /// Link background color.
  final Color linkBg;

  /// Primary accent color.
  final Color accentPrimary;

  /// Error accent color.
  final Color accentError;

  /// Info accent color.
  final Color accentInfo;

  /// Highlight color.
  final Color highlight;

  /// Overlay color.
  final Color overlay;

  /// Dark overlay color.
  final Color overlayDark;

  /// Background gradient.
  final Gradient bgGradient;

  /// Creates a copy with the given fields replaced by new values.
  AppColorScheme copyWith({
    Color? textHighEmphasis,
    Color? textLowEmphasis,
    Color? disabled,
    Color? borders,
    Color? inputBg,
    Color? appBg,
    Color? barsBg,
    Color? linkBg,
    Color? accentPrimary,
    Color? accentError,
    Color? accentInfo,
    Color? highlight,
    Color? overlay,
    Color? overlayDark,
    Gradient? bgGradient,
  }) {
    return AppColorScheme(
      textHighEmphasis: textHighEmphasis ?? this.textHighEmphasis,
      textLowEmphasis: textLowEmphasis ?? this.textLowEmphasis,
      disabled: disabled ?? this.disabled,
      borders: borders ?? this.borders,
      inputBg: inputBg ?? this.inputBg,
      appBg: appBg ?? this.appBg,
      barsBg: barsBg ?? this.barsBg,
      linkBg: linkBg ?? this.linkBg,
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentError: accentError ?? this.accentError,
      accentInfo: accentInfo ?? this.accentInfo,
      highlight: highlight ?? this.highlight,
      overlay: overlay ?? this.overlay,
      overlayDark: overlayDark ?? this.overlayDark,
      bgGradient: bgGradient ?? this.bgGradient,
    );
  }

  /// Linearly interpolates between two [AppColorScheme] instances.
  static AppColorScheme lerp(AppColorScheme a, AppColorScheme b, double t) {
    return AppColorScheme(
      textHighEmphasis: Color.lerp(a.textHighEmphasis, b.textHighEmphasis, t)!,
      textLowEmphasis: Color.lerp(a.textLowEmphasis, b.textLowEmphasis, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      borders: Color.lerp(a.borders, b.borders, t)!,
      inputBg: Color.lerp(a.inputBg, b.inputBg, t)!,
      appBg: Color.lerp(a.appBg, b.appBg, t)!,
      barsBg: Color.lerp(a.barsBg, b.barsBg, t)!,
      linkBg: Color.lerp(a.linkBg, b.linkBg, t)!,
      accentPrimary: Color.lerp(a.accentPrimary, b.accentPrimary, t)!,
      accentError: Color.lerp(a.accentError, b.accentError, t)!,
      accentInfo: Color.lerp(a.accentInfo, b.accentInfo, t)!,
      highlight: Color.lerp(a.highlight, b.highlight, t)!,
      overlay: Color.lerp(a.overlay, b.overlay, t)!,
      overlayDark: Color.lerp(a.overlayDark, b.overlayDark, t)!,
      bgGradient: Gradient.lerp(a.bgGradient, b.bgGradient, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppColorScheme &&
        other.textHighEmphasis == textHighEmphasis &&
        other.textLowEmphasis == textLowEmphasis &&
        other.disabled == disabled &&
        other.borders == borders &&
        other.inputBg == inputBg &&
        other.appBg == appBg &&
        other.barsBg == barsBg &&
        other.linkBg == linkBg &&
        other.accentPrimary == accentPrimary &&
        other.accentError == accentError &&
        other.accentInfo == accentInfo &&
        other.highlight == highlight &&
        other.overlay == overlay &&
        other.overlayDark == overlayDark &&
        other.bgGradient == bgGradient;
  }

  @override
  int get hashCode {
    return Object.hash(
      textHighEmphasis,
      textLowEmphasis,
      disabled,
      borders,
      inputBg,
      appBg,
      barsBg,
      linkBg,
      accentPrimary,
      accentError,
      accentInfo,
      highlight,
      overlay,
      overlayDark,
      bgGradient,
    );
  }
}
