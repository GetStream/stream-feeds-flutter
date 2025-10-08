import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../core/di/di_initializer.dart';
import '../../../theme/theme.dart';
import '../comment/user_comments.dart';
import 'user_feed_item.dart';

class UserFeed extends StatelessWidget {
  const UserFeed({
    super.key,
    required this.userFeed,
    this.scrollController,
  });

  final Feed userFeed;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final client = locator<StreamFeedsClient>();

    return StateNotifierBuilder(
      stateNotifier: userFeed.notifier,
      builder: (context, state, child) {
        final activities = state.activities;
        final canLoadMore = state.canLoadMoreActivities;

        if (activities.isEmpty) return const EmptyActivities();

        return RefreshIndicator(
          onRefresh: userFeed.getOrCreate,
          child: ListView.separated(
            controller: scrollController,
            itemCount: activities.length + 1,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: context.appColors.borders,
            ),
            itemBuilder: (context, index) {
              if (index == activities.length) {
                return switch (canLoadMore) {
                  true => TextButton(
                      onPressed: userFeed.queryMoreActivities,
                      child: const Text('Load more...'),
                    ),
                  false => const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text('End of feed'),
                      ),
                    )
                };
              }

              final activity = activities[index];
              final parentActivity = activity.parent;
              final baseActivity = activity.parent ?? activity;

              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  spacing: 8,
                  children: [
                    if (parentActivity != null) ...[
                      ActivityRepostIndicator(
                        user: activity.user,
                        data: parentActivity,
                      ),
                    ],
                    UserFeedItem(
                      feed: userFeed,
                      data: activity,
                      user: baseActivity.user,
                      text: baseActivity.text ?? '',
                      attachments: baseActivity.attachments,
                      currentUserId: client.user.id,
                      onCommentClick: () {
                        _onCommentClick(context, activity);
                      },
                      onHeartClick: (isAdding) {
                        _onHeartClick(activity, isAdding);
                      },
                      onRepostClick: (message) {
                        _onRepostClick(context, activity, message);
                      },
                      onBookmarkClick: () {
                        _onBookmarkClick(context, activity);
                      },
                      onDeleteClick: () {},
                      onEditSave: (text) {},
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _onCommentClick(BuildContext context, ActivityData activity) {
    showModalBottomSheet<void>(
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
          return UserComments(
            feed: userFeed,
            activityId: activity.id,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  void _onHeartClick(ActivityData activity, bool isAdding) {
    if (isAdding) {
      userFeed.addActivityReaction(
        activityId: activity.id,
        request: const AddReactionRequest(
          type: 'heart',
          createNotificationActivity: true,
        ),
      );
    } else {
      userFeed.deleteActivityReaction(
        activityId: activity.id,
        type: 'heart',
      );
    }
  }

  void _onRepostClick(
    BuildContext context,
    ActivityData activity,
    String? message,
  ) {
    userFeed.repost(activityId: activity.id, text: message);
  }

  void _onBookmarkClick(BuildContext context, ActivityData activity) {
    if (activity.ownBookmarks.isNotEmpty) {
      userFeed.deleteBookmark(activityId: activity.id);
    } else {
      userFeed.addBookmark(activityId: activity.id);
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.dynamic_feed_rounded,
            size: 64,
            color: context.appColors.textLowEmphasis,
          ),
          const SizedBox(height: 16),
          Text(
            'No activities yet',
            style: context.appTextStyles.headline.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your feed is empty. Start by creating a post!',
            style: context.appTextStyles.body.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
