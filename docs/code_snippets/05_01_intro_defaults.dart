import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late Feed feed;
late Feed notificationFeed;

Future<void> notificationFeedExample() async {
  final notificationFeed = client.feed(group: 'notification', id: 'john');
  await notificationFeed.getOrCreate();
}

Future<void> markNotificationsAsRead() async {
  await notificationFeed.markActivity(
    request: const MarkActivityRequest(
      // Mark all notifications as read...
      markAllRead: true,
      // ...or only selected ones
      markRead: [
        // group names to mark as read
      ],
    ),
  );
}
