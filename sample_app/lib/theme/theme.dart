/// Stream Feeds sample app theme system.
///
/// A comprehensive design system with organized directory structure,
/// color tokens, semantic themes, and Flutter ThemeExtension integration.
///
/// ## Directory Structure
///
/// ```
/// theme/
/// ├── tokens/          # Design tokens (raw values)
/// ├── schemes/         # Semantic theme definitions
/// ├── config/          # Theme configuration
/// ├── extensions/      # Convenience utilities
/// └── app_theme.dart   # Main theme extension
/// ```
///
/// ## Architecture
///
/// The theme system follows a **Design Token → Semantic → Component** approach:
/// 1. **Color Tokens** (`tokens/`): Raw color palette
/// 2. **Semantic Schemes** (`schemes/`): Token-based themes
/// 3. **Theme Config** (`config/`): Complete ThemeData setup
/// 4. **Extensions** (`extensions/`): Convenient access methods
///
/// ## Usage
///
/// ### Basic Setup
/// ```dart
/// MaterialApp(
///   theme: ThemeConfig.lightTheme,
///   darkTheme: ThemeConfig.darkTheme,
///   themeMode: ThemeMode.system,
/// );
/// ```
///
/// ### Advanced Setup (Recommended)
/// ```dart
/// MaterialApp(
///   theme: ThemeConfig.fromBrightness(Brightness.light),
///   darkTheme: ThemeConfig.fromBrightness(Brightness.dark),
/// );
/// ```
///
/// ### Using App Theme Throughout (Recommended)
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     backgroundColor: context.appColors.appBg,
///     appBar: AppBar(
///       backgroundColor: context.appColors.barsBg,
///       title: Text(
///         'My App',
///         style: context.appTextStyles.title.copyWith(
///           color: context.appColors.textHighEmphasis,
///         ),
///       ),
///     ),
///     body: Container(
///       decoration: BoxDecoration(
///         gradient: context.appColors.bgGradient,
///       ),
///       child: Text(
///         'Content',
///         style: context.appTextStyles.body.copyWith(
///           color: context.appColors.textHighEmphasis,
///         ),
///       ),
///     ),
///   );
/// }
/// ```
///
/// This approach ensures you always know exactly what colors and text styles
/// you're using throughout your app, providing full control and consistency.
///
/// ### Using Color Tokens Directly
/// ```dart
/// Container(
///   color: AppColorTokens.blue500,
///   child: Text('Direct token usage'),
/// );
/// ```
library;

export 'app_theme.dart';
export 'config/theme_config.dart';
export 'extensions/theme_extensions.dart';
export 'schemes/app_color_scheme.dart';
export 'schemes/app_effects.dart';
export 'schemes/app_text_theme.dart';
export 'tokens/color_tokens.dart';
