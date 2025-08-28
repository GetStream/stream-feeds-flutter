import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import '../../theme/theme.dart';
import '../../widgets/user_avatar.dart';
import 'widgets/activity_content.dart';
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

    return Scaffold(
      backgroundColor: context.appColors.appBg,
      appBar: UserFeedAppbar(
        leading: Center(
          child: UserAvatar.appBar(user: user),
        ),
        title: Text(
          'Stream Feeds',
          style: context.appTextStyles.headlineBold,
        ),
        actions: [
          IconButton(
            onPressed: authController.disconnect,
            icon: Icon(
              Icons.logout,
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
      body: UserFeedView(
        client: client,
        currentUser: user,
      ),
    );
  }
}
