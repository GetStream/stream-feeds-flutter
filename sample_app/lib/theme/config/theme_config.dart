import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme.dart';

/// Configuration for the Stream Feeds sample app themes.
///
/// Provides convenient methods to create complete [ThemeData] instances
/// with custom app theme extensions.
class ThemeConfig {
  const ThemeConfig._();

  /// Creates light [ThemeData] with app theme extension.
  static ThemeData get lightTheme => fromBrightness(Brightness.light);

  /// Creates dark [ThemeData] with app theme extension.
  static ThemeData get darkTheme => fromBrightness(Brightness.dark);

  /// Creates a [ThemeData] for the given [brightness].
  ///
  /// This method automatically configures both Flutter's built-in theming
  /// and the custom app theme extension based on the brightness.
  static ThemeData fromBrightness(Brightness brightness) {
    final appTheme = AppTheme.fromBrightness(brightness);

    final theme = ThemeData(
      brightness: brightness,
      useMaterial3: true,

      // Use app theme primary color for Flutter's built-in ColorScheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: appTheme.colorScheme.accentPrimary,
        brightness: brightness,
      ),

      // Custom app theme extension - this is what we'll use throughout the app
      extensions: [appTheme],
    );

    return theme.copyWith(
      // Apply Google Fonts across the entire app
      textTheme: GoogleFonts.openSansTextTheme(theme.textTheme),
    );
  }
}
