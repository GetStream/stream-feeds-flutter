import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/di/di_initializer.dart';
import '../../core/models/user_credentials.dart';
import '../../navigation/app_router.dart';
import '../../theme/theme.dart';
import 'auth_controller.dart';

class StreamFeedsSampleAppContent extends StatefulWidget {
  const StreamFeedsSampleAppContent({super.key, this.credentials});

  final UserCredentials? credentials;

  @override
  State<StreamFeedsSampleAppContent> createState() =>
      _StreamFeedsSampleAppContentState();
}

class _StreamFeedsSampleAppContentState
    extends State<StreamFeedsSampleAppContent> {
  late final _appRouter = locator<AppRouter>();
  late final _authController = locator<AuthController>();

  @override
  void initState() {
    super.initState();
    // If credentials are provided, connect the user automatically.
    if (widget.credentials case final credentials?) {
      _authController.connect(credentials).ignore();
    }
  }

  @override
  void dispose() {
    _authController.disconnect().ignore();
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.fromBrightness(Brightness.light),
      darkTheme: ThemeConfig.fromBrightness(Brightness.dark),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.invertedStylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.mouse,
          // The VoiceAccess sends pointer events with unknown type when scrolling
          // scrollables.
          PointerDeviceKind.unknown,
        },
      ),
      routerConfig: _appRouter.config(
        reevaluateListenable: _authController,
      ),
    );
  }
}
