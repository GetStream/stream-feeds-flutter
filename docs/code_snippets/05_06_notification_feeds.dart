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
