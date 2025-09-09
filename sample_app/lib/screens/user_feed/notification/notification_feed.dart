import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import 'notification_item.dart';

class NotificationFeed extends StatelessWidget {
  const NotificationFeed({
    super.key,
    required this.notificationFeed,
    this.scrollController,
  });

  final Feed notificationFeed;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: notificationFeed.notifier,
      builder: (context, state, child) {
        final activities = state.aggregatedActivities;
        final canLoadMore = state.canLoadMoreActivities;
        final notificationStatus = state.notificationStatus;

        if (notificationStatus?.unseen case final unseen? when unseen > 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) _onMarkAllSeen();
          });
        }

        return Column(
          children: [
            _buildHeader(
              context,
              activities,
              notificationStatus,
            ),
            Expanded(
              child: _buildNotificationContent(
                context,
                activities,
                canLoadMore,
                notificationStatus,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    List<AggregatedActivityData> activities,
    NotificationStatusResponse? notificationStatus,
  ) {
    final hasUnreadNotifications = _hasUnreadNotifications(
      activities,
      notificationStatus,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.appColors.borders,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notifications',
            style: context.appTextStyles.headlineBold,
          ),
          if (hasUnreadNotifications)
            OutlinedButton.icon(
              onPressed: _onMarkAllRead,
              icon: const Icon(Icons.done_all),
              label: const Text('Mark read'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                iconColor: context.appColors.accentPrimary,
                foregroundColor: context.appColors.accentPrimary,
                side: BorderSide(color: context.appColors.accentPrimary),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: context.appTextStyles.footnoteBold,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationContent(
    BuildContext context,
    List<AggregatedActivityData> activities,
    bool canLoadMore,
    NotificationStatusResponse? notificationStatus,
  ) {
    if (activities.isEmpty) return const EmptyNotifications();

    return RefreshIndicator(
      onRefresh: notificationFeed.getOrCreate,
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
                  onPressed: notificationFeed.queryMoreActivities,
                  child: const Text('Load more...'),
                ),
              false => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text('End of notifications'),
                  ),
                ),
            };
          }

          final activity = activities[index];
          final read = notificationStatus?.readActivities;
          final isUnread = read?.contains(activity.group) != true;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: NotificationItem(
              activity: activity,
              isUnread: isUnread,
              onTap: () => _onNotificationTap(activity),
            ),
          );
        },
      ),
    );
  }

  bool _hasUnreadNotifications(
    List<AggregatedActivityData> activities,
    NotificationStatusResponse? notificationStatus,
  ) {
    if (activities.isEmpty) return false;

    final read = notificationStatus?.readActivities ?? [];
    return activities.any((activity) => !read.contains(activity.group));
  }

  Future<void> _onMarkAllRead() async {
    await notificationFeed.markActivity(
      request: const MarkActivityRequest(markAllRead: true),
    );
  }

  Future<void> _onMarkAllSeen() async {
    await notificationFeed.markActivity(
      request: const MarkActivityRequest(markAllSeen: true),
    );
  }

  Future<void> _onNotificationTap(AggregatedActivityData activity) async {
    await notificationFeed.markActivity(
      request: MarkActivityRequest(markRead: [activity.group]),
    );
  }
}

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 64,
            color: context.appColors.textLowEmphasis,
          ),
          const SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: context.appTextStyles.headline.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "When you get notifications, they'll appear here",
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
