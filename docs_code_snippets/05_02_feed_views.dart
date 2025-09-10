// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feed/stream_feed.dart';

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
