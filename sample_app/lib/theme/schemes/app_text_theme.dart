// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';

/// {@template app_text_theme}
/// Text theme for the Stream Feeds sample app.
///
/// Uses consistent typography tokens for size and weight.
/// {@endtemplate}
@immutable
class AppTextTheme {
  /// Creates an [AppTextTheme].
  const AppTextTheme({
    required this.title,
    required this.headline,
    required this.headlineBold,
    required this.body,
    required this.bodyBold,
    required this.footnote,
    required this.footnoteBold,
    required this.captionBold,
  });

  /// Creates a light text theme.
  factory AppTextTheme.light() {
    return AppTextTheme.fromBrightness(Brightness.light);
  }

  /// Creates a dark text theme.
  factory AppTextTheme.dark() {
    return AppTextTheme.fromBrightness(Brightness.dark);
  }

  /// Creates a text theme for the given [brightness].
  ///
  /// This is the recommended way to create text themes as it automatically
  /// selects the appropriate text colors based on brightness.
  factory AppTextTheme.fromBrightness(Brightness brightness) {
    final textColor = switch (brightness) {
      Brightness.light => AppColorTokens.black,
      Brightness.dark => AppColorTokens.white,
    };

    return AppTextTheme(
      title: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headline: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headlineBold: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      body: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyBold: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      footnote: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      footnoteBold: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      captionBold: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    );
  }

  /// Title text style.
  final TextStyle title;

  /// Headline text style.
  final TextStyle headline;

  /// Bold headline text style.
  final TextStyle headlineBold;

  /// Body text style.
  final TextStyle body;

  /// Bold body text style.
  final TextStyle bodyBold;

  /// Footnote text style.
  final TextStyle footnote;

  /// Bold footnote text style.
  final TextStyle footnoteBold;

  /// Bold caption text style.
  final TextStyle captionBold;

  /// Creates a copy with the given fields replaced by new values.
  AppTextTheme copyWith({
    TextStyle? title,
    TextStyle? headline,
    TextStyle? headlineBold,
    TextStyle? body,
    TextStyle? bodyBold,
    TextStyle? footnote,
    TextStyle? footnoteBold,
    TextStyle? captionBold,
  }) {
    return AppTextTheme(
      title: title ?? this.title,
      headline: headline ?? this.headline,
      headlineBold: headlineBold ?? this.headlineBold,
      body: body ?? this.body,
      bodyBold: bodyBold ?? this.bodyBold,
      footnote: footnote ?? this.footnote,
      footnoteBold: footnoteBold ?? this.footnoteBold,
      captionBold: captionBold ?? this.captionBold,
    );
  }

  /// Linearly interpolates between two [AppTextTheme] instances.
  static AppTextTheme lerp(AppTextTheme a, AppTextTheme b, double t) {
    return AppTextTheme(
      title: TextStyle.lerp(a.title, b.title, t)!,
      headline: TextStyle.lerp(a.headline, b.headline, t)!,
      headlineBold: TextStyle.lerp(a.headlineBold, b.headlineBold, t)!,
      body: TextStyle.lerp(a.body, b.body, t)!,
      bodyBold: TextStyle.lerp(a.bodyBold, b.bodyBold, t)!,
      footnote: TextStyle.lerp(a.footnote, b.footnote, t)!,
      footnoteBold: TextStyle.lerp(a.footnoteBold, b.footnoteBold, t)!,
      captionBold: TextStyle.lerp(a.captionBold, b.captionBold, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppTextTheme &&
        other.title == title &&
        other.headline == headline &&
        other.headlineBold == headlineBold &&
        other.body == body &&
        other.bodyBold == bodyBold &&
        other.footnote == footnote &&
        other.footnoteBold == footnoteBold &&
        other.captionBold == captionBold;
  }

  @override
  int get hashCode {
    return Object.hash(
      title,
      headline,
      headlineBold,
      body,
      bodyBold,
      footnote,
      footnoteBold,
      captionBold,
    );
  }
}
