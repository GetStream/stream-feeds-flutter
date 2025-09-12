// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feed/stream_feed.dart';

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
