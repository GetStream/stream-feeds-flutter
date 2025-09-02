import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../schemes/app_color_scheme.dart';
import '../schemes/app_effects.dart';
import '../schemes/app_text_theme.dart';

/// Extension on [BuildContext] for convenient theme access.
extension BuildContextAppTheme on BuildContext {
  /// Gets the [AppTheme] from the current context.
  ///
  /// Returns a fallback theme based on the current brightness if [AppTheme]
  /// is not found in the theme extensions. This ensures the app never crashes
  /// due to missing theme configuration.
  AppTheme get appTheme {
    final theme = Theme.of(this).extension<AppTheme>();
    if (theme != null) return theme;

    // Fallback: create theme based on current brightness
    final brightness = Theme.of(this).brightness;

    // Debug warning in debug mode
    assert(() {
      debugPrint(
        'WARNING: AppTheme extension not found in ThemeData. '
        'Using fallback theme with brightness: $brightness. '
        'Make sure to add AppTheme to your ThemeData.extensions.',
      );
      return true;
    }());

    return AppTheme.fromBrightness(brightness);
  }

  /// Gets the [AppColorScheme] from the current context.
  ///
  /// Convenience method for accessing `appTheme.colorScheme`.
  /// Always returns a valid color scheme, even if the app theme isn't configured.
  AppColorScheme get appColors => appTheme.colorScheme;

  /// Gets the [AppTextTheme] from the current context.
  ///
  /// Convenience method for accessing `appTheme.textTheme`.
  /// Always returns a valid text theme, even if the app theme isn't configured.
  AppTextTheme get appTextStyles => appTheme.textTheme;

  /// Gets the [AppEffects] from the current context.
  ///
  /// Convenience method for accessing `appTheme.effects`.
  /// Always returns valid effects, even if the app theme isn't configured.
  AppEffects get appEffects => appTheme.effects;
}
