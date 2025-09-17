import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> whenToUseFeedViews() async {
  const query = FeedQuery(
    fid: FeedId(group: 'user', id: 'john'),
    view: '<id of a feed view>', // Override the default view id
  );
  final feed = client.feedFromQuery(query);
  await feed.getOrCreate();
}
