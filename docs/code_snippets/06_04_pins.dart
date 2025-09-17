import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> overview() async {
  final activity = client.activity(
    activityId: 'activity_123',
    fid: const FeedId(group: 'user', id: 'john'),
  );
  // Pin an activity
  await activity.pin();

  // Unpin an activity
  await activity.unpin();
}

Future<void> overviewRead() async {
  await feed.getOrCreate();
  print(feed.state.pinnedActivities);
}
