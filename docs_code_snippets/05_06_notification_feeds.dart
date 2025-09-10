// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

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
    createNotificationActivity:
        true, // When true Jane's notification feed will be updated with follow activity
  );
  // Eric comments on Jane's activity
  await ericFeed.addComment(
    request: ActivityAddCommentRequest(
      comment: 'Agree!',
      activityId: janeActivity.activityId,
      createNotificationActivity:
          true, // When true Jane's notification feed will be updated with comment activity
    ),
  );
  // Eric reacts to Jane's activity
  await ericFeed.addReaction(
    activityId: janeActivity.activityId,
    request: const AddReactionRequest(
      type: 'like',
      createNotificationActivity:
          true, // When true Jane's notification feed will be updated with reaction activity
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
