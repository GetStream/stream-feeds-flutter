// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> overview() async {
  // Add a reaction to an activity
  final reaction = await feed.addReaction(
    activityId: 'activity_123',
    request: const AddReactionRequest(custom: {'emoji': '❤️'}, type: 'like'),
  );
  // Remove a reaction
  await feed.deleteReaction(activityId: 'activity_123', type: 'like');
}

Future<void> overviewRead() async {
  final feedData = await feed.getOrCreate();
// Last 15 reactions on the first activity
  print(feed.state.activities[0].latestReactions);
// Count of reactions by type
  print(feed.state.activities[0].reactionGroups);
}
