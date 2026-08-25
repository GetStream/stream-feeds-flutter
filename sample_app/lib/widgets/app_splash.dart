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
