import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import '../../theme/extensions/theme_extensions.dart';
import '../../widgets/breakpoint.dart';
import '../../widgets/user_avatar.dart';
import 'feed/user_feed.dart';
import 'notification/notification_feed.dart';
import 'profile/user_profile.dart';
import 'widgets/create_activity_bottom_sheet.dart';

@RoutePage()
class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();

  late final notificationFeed = client.feed(
    group: 'notification',
    id: client.user.id,
  );

  late final userFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.user(client.user.id),
      data: FeedInputData(
        visibility: FeedVisibility.public,
        members: [FeedMemberRequestData(userId: client.user.id)],
      ),
      activityLimit: 0,
    ),
  );

  late final timelineFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.timeline(client.user.id),
      data: FeedInputData(
        visibility: FeedVisibility.public,
        members: [FeedMemberRequestData(userId: client.user.id)],
      ),
      followerLimit: 10,
      followingLimit: 10,
      memberLimit: 10,
    ),
  );

  @override
  void initState() {
    super.initState();
    userFeed.getOrCreate();
    timelineFeed.getOrCreate().then((value) {
      _followSelfIfNeeded(timelineFeed);
    });
    notificationFeed.getOrCreate();
  }

  @override
  void dispose() {
    userFeed.dispose();
    timelineFeed.dispose();
    notificationFeed.dispose();
    super.dispose();
  }

  void _followSelfIfNeeded(Feed feed) {
    if (feed.state.followers.isEmpty) {
      feed.follow(
        targetFid: FeedId.user(client.user.id),
        createNotificationActivity: false,
      );
    }
  }

  Future<void> _onLogout() {
    final authController = locator<AuthController>();
    return authController.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final breakpoint = Breakpoint.fromContext(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stream Feeds',
          style: context.appTextStyles.headlineBold,
        ),
        leading: switch (breakpoint) {
          Breakpoint.compact => GestureDetector(
              onTap: () => _showUserProfile(context),
              child: Center(
                child: UserAvatar.appBar(user: client.user),
              ),
            ),
          _ => null,
        },
        actions: [
          StateNotifierBuilder(
            stateNotifier: notificationFeed.notifier,
            builder: (context, notificationState, _) {
              final status = notificationState.notificationStatus;
              return IconButton(
                onPressed: _showNotificationFeed,
                icon: Badge(
                  isLabelVisible: (status?.unseen ?? 0) > 0,
                  backgroundColor: context.appColors.accentError,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: context.appColors.textLowEmphasis,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: _onLogout,
            icon: Icon(
              Icons.logout,
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget?>[
          ...?switch (breakpoint) {
            Breakpoint.compact => null,
            Breakpoint.medium => [
                Flexible(
                  child: UserProfile(
                    userFeed: userFeed,
                    timelineFeed: timelineFeed,
                  ),
                ),
                VerticalDivider(
                  width: 8,
                  color: context.appColors.borders,
                ),
              ],
            _ => [
                SizedBox(
                  width: 420,
                  child: UserProfile(
                    userFeed: userFeed,
                    timelineFeed: timelineFeed,
                  ),
                ),
                VerticalDivider(
                  width: 8,
                  color: context.appColors.borders,
                ),
              ],
          },
          Flexible(
            child: UserFeed(timelineFeed: timelineFeed, userFeed: userFeed),
          ),
        ].nonNulls.toList(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: _showCreateActivityBottomSheet,
        backgroundColor: context.appColors.accentPrimary,
        foregroundColor: context.appColors.appBg,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showUserProfile(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: context.appColors.appBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        snap: true,
        expand: false,
        snapSizes: const [0.5, 1],
        builder: (context, scrollController) {
          return UserProfile(
            userFeed: userFeed,
            timelineFeed: timelineFeed,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  Future<void> _showNotificationFeed() {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: context.appColors.appBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        snap: true,
        expand: false,
        snapSizes: const [0.5, 1],
        builder: (context, scrollController) {
          return NotificationFeed(
            notificationFeed: notificationFeed,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  Future<void> _showCreateActivityBottomSheet() async {
    final request = await showModalBottomSheet<Object>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: context.appColors.appBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => CreateActivityBottomSheet(
        currentUser: client.user,
        feedId: userFeed.query.fid,
      ),
    );

    if (request == null) return;

    late Result<ActivityData> activityResult;
    if (request is FeedAddActivityRequest) {
      activityResult = await userFeed.addActivity(request: request);
    } else if (request is CreatePollRequest) {
      activityResult =
          await userFeed.createPoll(request: request, activityType: 'poll');
    } else {
      return;
    }

    switch (activityResult) {
      case Success():
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Activity created successfully!'),
              backgroundColor: context.appColors.accentPrimary,
            ),
          );
        }
      case Failure(error: final error):
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create activity: $error'),
              backgroundColor: context.appColors.accentError,
            ),
          );
        }
    }
  }
}
