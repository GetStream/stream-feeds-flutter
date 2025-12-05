import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../core/di/di_initializer.dart';
import '../../../theme/theme.dart';
import '../comment/user_comments.dart';
import '../reaction_icon.dart';
import 'stories_bar.dart';
import 'user_feed_item.dart';

class UserFeed extends StatelessWidget {
  const UserFeed({
    super.key,
    required this.timelineFeed,
    required this.userFeed,
    required this.storiesFeed,
    this.scrollController,
  });

  // Timeline feed shows what the user is following
  final Feed timelineFeed;

  // User feed is to post new activities to the user's feed
  final Feed userFeed;

  /// Stories feed showing stories from followed users
  final Feed storiesFeed;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final client = locator<StreamFeedsClient>();

    return StateNotifierBuilder(
      stateNotifier: timelineFeed.notifier,
      builder: (context, state, child) {
        final activities = state.activities;
        final canLoadMore = state.canLoadMoreActivities;

        return RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              timelineFeed.getOrCreate(),
              storiesFeed.getOrCreate(),
            ]);
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(child: StoriesBar(storiesFeed)),
              _TimelineFeedItemList(
                activities: activities,
                timelineFeed: timelineFeed,
                currentUserId: client.user.id,
                onCommentClick: (activity) {
                  _onCommentClick(context, activity);
                },
                onReactionClick: _onReactionClick,
                onRepostClick: _onRepostClick,
                onBookmarkClick: _onBookmarkClick,
                onDeleteClick: (activity) {},
                onEditSave: (data) {},
              ),
              if (activities.isNotEmpty || canLoadMore)
                SliverToBoxAdapter(
                  child: switch (canLoadMore) {
                    true => TextButton(
                        onPressed: timelineFeed.queryMoreActivities,
                        child: const Text('Load more...'),
                      ),
                    false => const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text('End of feed'),
                        ),
                      )
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onCommentClick(
    BuildContext context,
    ActivityData activity,
  ) {
    return showModalBottomSheet<void>(
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
            feed: timelineFeed,
            activityId: activity.id,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  Future<void> _onReactionClick(
    ActivityData activity,
    ReactionIcon reaction,
  ) {
    final ownReactions = [...activity.ownReactions];
    final shouldDelete = ownReactions.any((it) => it.type == reaction.type);

    if (shouldDelete) {
      return timelineFeed.deleteActivityReaction(
        type: reaction.type,
        activityId: activity.id,
      );
    }

    return timelineFeed.addActivityReaction(
      activityId: activity.id,
      request: AddReactionRequest(
        type: reaction.type,
        enforceUnique: true,
        createNotificationActivity: true,
        custom: {
          // Add emoji code only if available
          if (reaction.emojiCode case final code?) 'emoji_code': code,
        },
      ),
    );
  }

  Future<void> _onRepostClick(
    ActivityData activity, {
    String? message,
  }) {
    return userFeed.repost(
      activityId: activity.id,
      text: message,
    );
  }

  Future<void> _onBookmarkClick(ActivityData activity) {
    final shouldDelete = activity.ownBookmarks.isNotEmpty;

    if (shouldDelete) {
      return timelineFeed.deleteBookmark(activityId: activity.id);
    }

    return timelineFeed.addBookmark(activityId: activity.id);
  }
}

class _TimelineFeedItemList extends StatelessWidget {
  const _TimelineFeedItemList({
    required this.activities,
    required this.timelineFeed,
    required this.currentUserId,
    required this.onCommentClick,
    required this.onReactionClick,
    required this.onRepostClick,
    required this.onBookmarkClick,
    required this.onDeleteClick,
    required this.onEditSave,
  });

  final List<ActivityData> activities;
  final Feed timelineFeed;
  final String currentUserId;
  final ValueSetter<ActivityData>? onCommentClick;
  final void Function(ActivityData, ReactionIcon)? onReactionClick;
  final ValueSetter<ActivityData>? onRepostClick;
  final ValueSetter<ActivityData>? onBookmarkClick;
  final ValueSetter<ActivityData>? onDeleteClick;
  final ValueSetter<({ActivityData activity, String text})>? onEditSave;

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return const SliverFillRemaining(
        child: EmptyActivities(),
      );
    }

    return SliverList.separated(
      itemCount: activities.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: context.appColors.borders,
      ),
      itemBuilder: (context, index) {
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
                feed: timelineFeed,
                data: activity,
                user: baseActivity.user,
                text: baseActivity.text ?? '',
                attachments: baseActivity.attachments,
                currentUserId: currentUserId,
                onCommentClick: () => onCommentClick?.call(activity),
                onReactionClick: (it) => onReactionClick?.call(activity, it),
                onRepostClick: () => onRepostClick?.call(activity),
                onBookmarkClick: () => onBookmarkClick?.call(activity),
                onDeleteClick: () => onDeleteClick?.call(activity),
                onEditSave: (text) => onEditSave?.call(
                  (activity: activity, text: text),
                ),
              ),
            ],
          ),
        );
      },
    );
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
