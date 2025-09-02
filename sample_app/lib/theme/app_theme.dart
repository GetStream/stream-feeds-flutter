import 'package:flutter/material.dart';

import 'schemes/app_color_scheme.dart';
import 'schemes/app_effects.dart';
import 'schemes/app_text_theme.dart';

/// {@template app_theme}
/// Main theme extension for the Stream Feeds sample app.
///
/// Wraps [AppColorScheme], [AppTextTheme], and [AppEffects] in a single
/// extension following Flutter's ThemeData pattern.
/// {@endtemplate}
@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  /// Creates an [AppTheme].
  const AppTheme({
    required this.colorScheme,
    required this.textTheme,
    required this.effects,
  });

  /// Creates a light app theme.
  factory AppTheme.light() {
    return AppTheme.fromBrightness(Brightness.light);
  }

  /// Creates a dark app theme.
  factory AppTheme.dark() {
    return AppTheme.fromBrightness(Brightness.dark);
  }

  /// Creates an app theme for the given [brightness].
  ///
  /// This is the recommended way to create app themes as it automatically
  /// selects the appropriate colors, text styles, and effects based on brightness.
  ///
  /// Example:
  /// ```dart
  /// final lightTheme = AppTheme.fromBrightness(Brightness.light);
  /// final darkTheme = AppTheme.fromBrightness(Brightness.dark);
  /// ```
  factory AppTheme.fromBrightness(Brightness brightness) {
    return AppTheme(
      colorScheme: AppColorScheme.fromBrightness(brightness),
      textTheme: AppTextTheme.fromBrightness(brightness),
      effects: AppEffects.fromBrightness(brightness),
    );
  }

  /// The color scheme for this theme.
  final AppColorScheme colorScheme;

  /// The text theme for this theme.
  final AppTextTheme textTheme;

  /// The effects for this theme.
  final AppEffects effects;

  @override
  AppTheme copyWith({
    AppColorScheme? colorScheme,
    AppTextTheme? textTheme,
    AppEffects? effects,
  }) {
    return AppTheme(
      colorScheme: colorScheme ?? this.colorScheme,
      textTheme: textTheme ?? this.textTheme,
      effects: effects ?? this.effects,
    );
  }

  @override
  AppTheme lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      colorScheme: AppColorScheme.lerp(colorScheme, other.colorScheme, t),
      textTheme: AppTextTheme.lerp(textTheme, other.textTheme, t),
      effects: AppEffects.lerp(effects, other.effects, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppTheme &&
        other.colorScheme == colorScheme &&
        other.textTheme == textTheme &&
        other.effects == effects;
  }

  @override
  int get hashCode {
    return Object.hash(
      colorScheme,
      textTheme,
      effects,
    );
  }
}
