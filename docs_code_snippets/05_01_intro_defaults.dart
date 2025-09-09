// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

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
