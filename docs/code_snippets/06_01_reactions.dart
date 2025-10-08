import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> overview() async {
  // Add a reaction to an activity
  final reaction = await feed.addActivityReaction(
    activityId: 'activity_123',
    request: const AddReactionRequest(
      custom: {'emoji': '❤️'},
      type: 'like',
      // Optionally override existing reaction
      enforceUnique: true,
    ),
  );
  // Remove a reaction
  await feed.deleteActivityReaction(activityId: 'activity_123', type: 'like');
}

Future<void> overviewRead() async {
  final feedData = await feed.getOrCreate();
  // Last 15 reactions on the first activity
  print(feed.state.activities[0].latestReactions);
  // Count of reactions by type
  print(feed.state.activities[0].reactionGroups);
}
