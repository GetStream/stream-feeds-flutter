import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import 'activity_comments_view.dart';
import 'activity_content.dart';

class UserFeedView extends StatefulWidget {
  const UserFeedView({
    super.key,
    required this.client,
    required this.currentUser,
  });

  final User currentUser;
  final StreamFeedsClient client;

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

        if (activities.isEmpty) return const EmptyActivities();

        return RefreshIndicator(
          onRefresh: () => feed.getOrCreate(),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
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
                        onRepostClick: (message) {},
                        onBookmarkClick: () {},
                        onDeleteClick: () {},
                        onEditSave: (text) {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
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
