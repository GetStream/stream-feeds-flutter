import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/user_avatar.dart';
import '../../profile/profile_widget.dart';
import 'activity_comments_view.dart';
import 'activity_content.dart';
import 'user_feed_appbar.dart';

class UserFeedView extends StatefulWidget {
  const UserFeedView({
    super.key,
    required this.client,
    required this.currentUser,
    required this.wideScreen,
    required this.onLogout,
  });

  final User currentUser;
  final StreamFeedsClient client;
  final bool wideScreen;
  final VoidCallback onLogout;

  @override
  State<UserFeedView> createState() => _UserFeedViewState();
}

class _UserFeedViewState extends State<UserFeedView> {
  late final feed = widget.client.feedFromQuery(
    FeedQuery(
      fid: FeedId(group: 'user', id: widget.currentUser.id),
      data: FeedInputData(
        visibility: FeedVisibility.public,
        members: [FeedMemberRequestData(userId: widget.currentUser.id)],
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

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: feed.state,
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
                            currentUserId: widget.client.user.id,
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

        if (!widget.wideScreen) {
          return _buildScaffold(
            context,
            feedWidget,
            onProfileTap: () {
              _showProfileBottomSheet(context, widget.client, feed);
            },
          );
        }
        return _buildScaffold(
          context,
          Row(
            children: [
              SizedBox(
                width: 250,
                child: ProfileWidget(feedsClient: widget.client, feed: feed),
              ),
              const SizedBox(width: 16),
              Expanded(child: feedWidget),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    Widget body, {
    VoidCallback? onProfileTap,
  }) {
    return Scaffold(
      appBar: UserFeedAppbar(
        leading: GestureDetector(
          onTap: onProfileTap,
          child: Center(
            child: UserAvatar.appBar(user: widget.currentUser),
          ),
        ),
        title: Text(
          'Stream Feeds',
          style: context.appTextStyles.headlineBold,
        ),
        actions: [
          IconButton(
            onPressed: widget.onLogout,
            icon: Icon(
              Icons.logout,
              color: context.appColors.textLowEmphasis,
            ),
          ),
        ],
      ),
      body: body,
    );
  }

  void _showProfileBottomSheet(
    BuildContext context,
    StreamFeedsClient client,
    Feed feed,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => ProfileWidget(feedsClient: client, feed: feed),
    );
  }

  void _onCommentClick(BuildContext context, ActivityData activity) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => ActivityCommentsView(
        activityId: activity.id,
        feed: feed,
        client: widget.client,
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
}

class _FeedWidget extends StatelessWidget {
  const _FeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
