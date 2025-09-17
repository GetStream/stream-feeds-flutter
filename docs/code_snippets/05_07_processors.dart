import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;
late ActivityData activity;

Future<void> readingTopics() async {
  await feed.addActivity(
    request: const FeedAddActivityRequest(
      text: 'check out my 10 fitness tips for reducing lower back pain',
      type: 'post',
    ),
  );

  // Wait for feeds.activity.updated event
  print(activity.interestTags); // ["fitness", "health", "tips"]
}
