import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;
late Feed ericFeed;
late Feed janeFeed;
late Feed notificationFeed;
late Activity janeActivity;
late Activity saraComment;

Future<void> creatingNotificationActivities() async {
  // Eric follows Jane
  await ericFeed.follow(
    targetFid: janeFeed.fid,
    createNotificationActivity: true, // When true Jane's notification feed will be updated with follow activity
  );
  // Eric comments on Jane's activity
  await ericFeed.addComment(
    request: ActivityAddCommentRequest(
      comment: 'Agree!',
      activityId: janeActivity.activityId,
      createNotificationActivity: true, // When true Jane's notification feed will be updated with comment activity
    ),
  );
  // Eric reacts to Jane's activity
  await ericFeed.addActivityReaction(
    activityId: janeActivity.activityId,
    request: const AddReactionRequest(
      type: 'like',
      createNotificationActivity: true, // When true Jane's notification feed will be updated with reaction activity
    ),
  );
  // Eric reacts to a comment posted to Jane's activity by Sara
  await ericFeed.addCommentReaction(
    commentId: saraComment.activityId,
    request: const AddCommentReactionRequest(
      type: 'like',
      createNotificationActivity:
          true, // When true Sara's notification feed will be updated with comment reaction activity
    ),
  );
}

Future<void> readingNotificationActivities() async {
  final notificationFeed = client.feed(group: 'notification', id: 'jane');
  final notifications = await notificationFeed.getOrCreate();
}

Future<void> markNotificationsAsSeen() async {
  await notificationFeed.markActivity(
    request: const MarkActivityRequest(
      // Mark all notifications as seen...
      markAllSeen: true,
      // ...or only selected ones
      markSeen: [
        /* group names to mark as seen */
      ],
    ),
  );
}

Future<void> markNotificationsAsRead() async {
  await notificationFeed.markActivity(
    request: const MarkActivityRequest(
      // Mark all notifications as seen...
      markAllRead: true,
      // ...or only selected ones
      markRead: [
        /* group names to mark as seen */
      ],
    ),
  );
}

Future<void> readPerActivityReadSeenState() async {
  // After getOrCreate(), the feed state exposes per-activity and per-group isRead/isSeen flags.
  // These are updated automatically when markActivity() is called (via the WS activity.marked event).
  final feedState = notificationFeed.state;

  // Check per-group read/seen status for aggregated notification feeds
  for (final group in feedState.aggregatedActivities) {
    final isRead = group.isRead ?? false;
    final isSeen = group.isSeen ?? false;
    print('Group ${group.group}: read=$isRead, seen=$isSeen');

    // Individual activities within the group also carry isRead/isSeen
    for (final activity in group.activities) {
      print('  Activity ${activity.id}: read=${activity.isRead}, seen=${activity.isSeen}');
    }
  }

  // For flat (non-aggregated) notification feeds, check individual activities
  for (final activity in feedState.activities) {
    final isRead = activity.isRead ?? false;
    final isSeen = activity.isSeen ?? false;
    print('Activity ${activity.id}: read=$isRead, seen=$isSeen');
  }
}

Future<void> markSpecificGroupAsRead() async {
  // Mark specific notification groups as read using their group IDs.
  // The feed state isRead/isSeen flags are updated automatically via the WS activity.marked event.
  final feedState = notificationFeed.state;
  final unreadGroups = feedState.aggregatedActivities.where((g) => g.isRead != true).map((g) => g.group).toList();

  if (unreadGroups.isNotEmpty) {
    await notificationFeed.markActivity(
      request: MarkActivityRequest(markRead: unreadGroups),
    );
  }
}

/// New notification types: `mention` and `comment_mention`.
///
/// These are created by the backend automatically when a user is mentioned in
/// an activity or a comment. They appear as notification activities alongside
/// the standard types (follow, reaction, comment).
Future<void> readMentionNotifications() async {
  final notificationFeed = client.feed(group: 'notification', id: 'jane');
  await notificationFeed.getOrCreate();

  for (final group in notificationFeed.state.aggregatedActivities) {
    for (final activity in group.activities) {
      switch (activity.type) {
        case 'mention':
          print('${activity.user.name ?? 'Someone'} mentioned you in an activity');
        case 'comment_mention':
          print('${activity.user.name ?? 'Someone'} mentioned you in a comment');
        default:
          print('Notification type: ${activity.type}');
      }
    }
  }
}

/// Delete a notification activity together with its source (activity, comment,
/// or reaction) by passing `deleteNotificationActivity: true`.
///
/// This removes both the original item and the notification it created, which
/// is useful when a user deletes content they no longer want to appear in
/// others' notification feeds.
Future<void> deleteWithNotification() async {
  // Delete an activity and its notification
  await feed.deleteActivity(
    id: 'activity_123',
    deleteNotificationActivity: true,
  );

  // Delete a comment and its notification
  await feed.deleteComment(
    commentId: 'comment_456',
    deleteNotificationActivity: true,
  );

  // Delete a reaction and its notification
  await feed.deleteActivityReaction(
    activityId: 'activity_123',
    type: 'like',
    deleteNotificationActivity: true,
  );

  // Delete a comment reaction and its notification
  await feed.deleteCommentReaction(
    commentId: 'comment_456',
    type: 'like',
    deleteNotificationActivity: true,
  );
}
