import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import '../../theme/theme.dart';
import '../../widgets/user_avatar.dart';
import '../profile/profile_widget.dart';
import 'widgets/user_feed_appbar.dart';
import 'widgets/user_feed_view.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = locator<AuthController>();
    final state = authController.value;
    final (user, client) = switch (state) {
      Authenticated(:final user, :final client) => (user, client),
      _ => throw Exception('User not authenticated'),
    };

    final wideScreen = MediaQuery.sizeOf(context).width > 600;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: UserFeedView(
        client: client,
        currentUser: user,
        wideScreen: wideScreen,
        onLogout: authController.disconnect,
      ),
    );
  }
}
