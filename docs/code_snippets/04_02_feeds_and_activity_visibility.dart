import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> feedVisibilityLevels() async {
  // More options
  const query = FeedQuery(
    fid: FeedId(group: 'user', id: 'jack'),
    data: FeedInputData(
      visibility: FeedVisibility.public,
    ),
  );
  final feed = client.feedFromQuery(query);
  await feed.getOrCreate();
}

Future<void> activityVisibilityLevels() async {
  // Premium users can see full activity, others a preview
  final privateActivity = await feed.addActivity(
    request: const FeedAddActivityRequest(
      text: 'Premium content',
      type: 'post',
      visibility: AddActivityRequestVisibility.tag,
      visibilityTag: 'premium',
    ),
  );
}
