// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';

/// {@template app_effects}
/// Effects theme for the Stream Feeds sample app.
///
/// Contains shadow and border effects using design tokens for consistency.
/// {@endtemplate}
@immutable
class AppEffects {
  /// Creates an [AppEffects].
  const AppEffects({
    required this.borderTop,
    required this.borderBottom,
    required this.shadowIconButton,
    required this.modalShadow,
  });

  /// Creates light effects.
  factory AppEffects.light() {
    return AppEffects.fromBrightness(Brightness.light);
  }

  /// Creates dark effects.
  factory AppEffects.dark() {
    return AppEffects.fromBrightness(Brightness.dark);
  }

  /// Creates effects for the given [brightness].
  ///
  /// This is the recommended way to create effects as it automatically
  /// selects the appropriate colors based on brightness.
  factory AppEffects.fromBrightness(Brightness brightness) {
    final borderColor = switch (brightness) {
      Brightness.light => AppColorTokens.blackAlpha80,
      Brightness.dark => AppColorTokens.blue950,
    };

    return AppEffects(
      borderTop: BoxShadow(
        offset: const Offset(0, -1),
        color: borderColor,
        blurRadius: 0,
      ),
      borderBottom: BoxShadow(
        offset: const Offset(0, 1),
        color: borderColor,
        blurRadius: 0,
      ),
      shadowIconButton: const BoxShadow(
        offset: Offset(0, 2),
        color: AppColorTokens.whiteAlpha50,
        blurRadius: 4,
      ),
      modalShadow: const BoxShadow(
        offset: Offset.zero,
        color: AppColorTokens.blackAlpha100,
        blurRadius: 8,
      ),
    );
  }

  /// Top border shadow effect.
  final BoxShadow borderTop;

  /// Bottom border shadow effect.
  final BoxShadow borderBottom;

  /// Icon button shadow effect.
  final BoxShadow shadowIconButton;

  /// Modal shadow effect.
  final BoxShadow modalShadow;

  /// Creates a copy with the given fields replaced by new values.
  AppEffects copyWith({
    BoxShadow? borderTop,
    BoxShadow? borderBottom,
    BoxShadow? shadowIconButton,
    BoxShadow? modalShadow,
  }) {
    return AppEffects(
      borderTop: borderTop ?? this.borderTop,
      borderBottom: borderBottom ?? this.borderBottom,
      shadowIconButton: shadowIconButton ?? this.shadowIconButton,
      modalShadow: modalShadow ?? this.modalShadow,
    );
  }

  /// Linearly interpolates between two [AppEffects] instances.
  static AppEffects lerp(AppEffects a, AppEffects b, double t) {
    return AppEffects(
      borderTop: BoxShadow.lerp(a.borderTop, b.borderTop, t)!,
      borderBottom: BoxShadow.lerp(a.borderBottom, b.borderBottom, t)!,
      shadowIconButton:
          BoxShadow.lerp(a.shadowIconButton, b.shadowIconButton, t)!,
      modalShadow: BoxShadow.lerp(a.modalShadow, b.modalShadow, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppEffects &&
        other.borderTop == borderTop &&
        other.borderBottom == borderBottom &&
        other.shadowIconButton == shadowIconButton &&
        other.modalShadow == modalShadow;
  }

  @override
  int get hashCode {
    return Object.hash(
      borderTop,
      borderBottom,
      shadowIconButton,
      modalShadow,
    );
  }
}
