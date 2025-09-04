import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/user_avatar.dart';
import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import 'widgets/activity_comments_view.dart';
import 'widgets/activity_content.dart';
import 'widgets/create_activity_bottom_sheet.dart';
import 'widgets/user_feed_appbar.dart';
import 'widgets/user_profile_view.dart';

@RoutePage()
class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();

  late final feed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId(group: 'user', id: client.user.id),
      data: FeedInputData(
        visibility: FeedVisibility.public,
        members: [FeedMemberRequestData(userId: client.user.id)],
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    feed.getOrCreate();
  }

  @override
  void dispose() {
    feed.dispose();
    super.dispose();
  }

  Future<void> _onLogout() {
    final authController = locator<AuthController>();
    return authController.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = client.user;

    final wideScreen = MediaQuery.sizeOf(context).width > 600;

    return StateNotifierBuilder(
      stateNotifier: feed.notifier,
      builder: (context, state, child) {
        final activities = state.activities;
        final canLoadMore = state.canLoadMoreActivities;

        final feedWidget = activities.isEmpty
            ? const EmptyActivities()
            : RefreshIndicator(
                onRefresh: () => feed.getOrCreate(),
                child: ListView.separated(
                  itemCount: activities.length + 1,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: context.appColors.borders,
                  ),
                  itemBuilder: (context, index) {
                    if (index == activities.length) {
                      return canLoadMore
                          ? TextButton(
                              onPressed: () => feed.queryMoreActivities(),
                              child: const Text('Load more...'),
                            )
                          : const Text('End of feed');
                    }

                    final activity = activities[index];
                    final parentActivity = activity.parent;
                    final baseActivity = activity.parent ?? activity;

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          if (parentActivity != null) ...[
                            ActivityRepostIndicator(
                              user: activity.user,
                              data: parentActivity,
                            ),
                            const SizedBox(height: 8),
                          ],
                          ActivityContent(
                            user: baseActivity.user,
                            text: baseActivity.text ?? '',
                            attachments: baseActivity.attachments,
                            data: activity,
                            currentUserId: currentUser.id,
                            onCommentClick: () =>
                                _onCommentClick(context, activity),
                            onHeartClick: (isAdding) =>
                                _onHeartClick(activity, isAdding),
                            onRepostClick: (message) =>
                                _onRepostClick(context, activity, message),
                            onBookmarkClick: () =>
                                _onBookmarkClick(context, activity),
                            onDeleteClick: () {},
                            onEditSave: (text) {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );

        if (!wideScreen) {
          return _buildScaffold(
            context,
            feedWidget,
            onLogout: _onLogout,
            onProfileTap: () {
              _showProfileBottomSheet(context, client, feed);
            },
          );
        }

        return _buildScaffold(
          context,
          Row(
            children: [
              SizedBox(
                width: 250,
                child: UserProfileView(feedsClient: client, feed: feed),
              ),
              const SizedBox(width: 16),
              Expanded(child: feedWidget),
            ],
          ),
          onLogout: _onLogout,
        );
      },
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    Widget body, {
    VoidCallback? onLogout,
    VoidCallback? onProfileTap,
  }) {
    return Scaffold(
      appBar: UserFeedAppbar(
        leading: GestureDetector(
          onTap: onProfileTap,
          child: Center(
            child: UserAvatar.appBar(user: client.user),
          ),
        ),
        title: Text(
          'Stream Feeds',
          style: context.appTextStyles.headlineBold,
        ),
        actions: [
          IconButton(
            onPressed: onLogout,
            icon: Icon(
              Icons.logout,
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: _showCreateActivityBottomSheet,
        backgroundColor: context.appColors.accentPrimary,
        foregroundColor: context.appColors.appBg,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showProfileBottomSheet(
    BuildContext context,
    StreamFeedsClient client,
    Feed feed,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => UserProfileView(feedsClient: client, feed: feed),
    );
  }

  void _onCommentClick(BuildContext context, ActivityData activity) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => ActivityCommentsView(
        activityId: activity.id,
        feed: feed,
        client: client,
      ),
    );
  }

  void _onHeartClick(ActivityData activity, bool isAdding) {
    if (isAdding) {
      feed.addReaction(
        activityId: activity.id,
        request: const AddReactionRequest(type: 'heart'),
      );
    } else {
      feed.deleteReaction(
        activityId: activity.id,
        type: 'heart',
      );
    }
  }

  void _onRepostClick(
      BuildContext context, ActivityData activity, String? message) {
    feed.repost(activityId: activity.id, text: message);
  }

  void _onBookmarkClick(BuildContext context, ActivityData activity) {
    if (activity.ownBookmarks.isNotEmpty) {
      feed.deleteBookmark(activityId: activity.id);
    } else {
      feed.addBookmark(activityId: activity.id);
    }
  }

  Future<void> _showCreateActivityBottomSheet() async {
    final request = await showModalBottomSheet<FeedAddActivityRequest>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CreateActivityBottomSheet(
        currentUser: client.user,
        feedId: feed.query.fid,
      ),
    );

    if (request == null) return;
    final result = await feed.addActivity(request: request);

    switch (result) {
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

class ActivityRepostIndicator extends StatelessWidget {
  const ActivityRepostIndicator({
    super.key,
    required this.user,
    required this.data,
  });

  final UserData user;
  final ActivityData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.repeat,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text('${user.name} reposted'),
      ],
    );
  }
}

class EmptyActivities extends StatelessWidget {
  const EmptyActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No activities yet. Start by creating a post!'),
    );
  }
}
