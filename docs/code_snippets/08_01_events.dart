import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed notificationFeed;

Future<void> listenToClientEvents() async {
  // Listen to all WebSocket events from the client
  client.events.listen((event) {
    print('Received event: ${event.runtimeType}');
  });
}

Future<void> listenToFeedEvents() async {
  // The feed state stream emits whenever the feed state changes (activities,
  // aggregated groups, notification status, etc.)
  notificationFeed.stream.listen((state) {
    final unread = state.notificationStatus?.unread ?? 0;
    final unseen = state.notificationStatus?.unseen ?? 0;
    print('Unread: $unread, Unseen: $unseen');

    // Per-activity isRead/isSeen are updated automatically when the
    // activity.marked WebSocket event arrives after markActivity() calls.
    for (final group in state.aggregatedActivities) {
      print('Group ${group.group}: read=${group.isRead}, seen=${group.isSeen}');
    }
  });
}

Future<void> listenForActivityMarkedEvents() async {
  // The activity.marked WS event fires when activities are marked read/seen.
  // The SDK automatically updates the feed state's isRead/isSeen flags.
  // Observe changes via the feed state stream:
  notificationFeed.stream.listen((state) {
    final unreadCount = state.notificationStatus?.unread ?? 0;
    print('Unread count updated: $unreadCount');

    // All aggregated groups with their current read state
    final unreadGroups = state.aggregatedActivities.where((g) => g.isRead != true);
    print('Unread groups: ${unreadGroups.length}');
  });
}
