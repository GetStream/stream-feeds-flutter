import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme.dart';

/// App splash screen widget.
///
/// Displays only the app logo in a clean, minimal style while the app initializes.
/// Follows true minimalistic principles with perfect simplicity.
@RoutePage(name: 'AppSplashRoute')
class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.appBg,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/app_logo.svg',
          width: 64,
          height: 64,
          colorFilter: ColorFilter.mode(
            context.appColors.accentPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

/// [AppSplash] with an app shell of its own.
///
/// For the two moments the splash is shown above the app's own [MaterialApp] — before
/// initialisation finishes, and while an identity is being connected — where it would otherwise
/// find no theme and fall back.
class AppSplashScreen extends StatelessWidget {
  /// Creates an [AppSplashScreen].
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      home: const AppSplash(),
    );
  }
}
