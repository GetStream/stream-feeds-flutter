import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;

/// Stories are activities with an `expiresAt` timestamp posted to a `story`
/// feed and aggregated in a `stories` feed.
///
/// Convention:
/// - Each user has a personal story feed: `FeedId.story(userId)`
/// - A user's stories aggregation feed: `FeedId.stories(userId)`
/// - Posting a story = adding an activity with an `expiresAt` timestamp
/// - Stories expire automatically once `expiresAt` passes.
///
/// The feed group must have `Stories` config enabled in the Stream dashboard.

/// Publish a story to the current user's story feed.
Future<void> postStory() async {
  final userId = client.user.id;
  final storyFeed = client.feedFromId(FeedId.story(userId));
  await storyFeed.getOrCreate();

  // Stories expire after 24 hours.
  final expiresAt = DateTime.now().add(const Duration(hours: 24));

  await storyFeed.addActivity(
    request: FeedAddActivityRequest(
      type: 'story',
      text: 'My story',
      // expiresAt is an ISO 8601 string.
      expiresAt: expiresAt.toIso8601String(),
    ),
  );
}

/// Read the current user's stories aggregation feed.
///
/// The `stories` feed aggregates story activities from all users the current
/// user follows on their `story` feed.
Future<void> readStories() async {
  final userId = client.user.id;
  final storiesFeed = client.feedFromId(FeedId.stories(userId));
  await storiesFeed.getOrCreate();

  // aggregatedActivities groups story activities by author.
  for (final group in storiesFeed.state.aggregatedActivities) {
    print('Stories from ${group.activities.first.user.name}: '
        '${group.activities.length} stories');
  }
}

/// Read only story activities (activities that have an expiresAt) from a feed,
/// excluding regular non-expiring posts. Mirrors the Swift SDK pattern.
Future<void> filterStoriesFromFeed() async {
  final userId = client.user.id;

  // Stories-only feed view: activities that have an expiration date.
  final storiesOnlyFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.user(userId),
      activityFilter: Filter.exists(ActivitiesFilterField.expiresAt, exists: true),
    ),
  );

  // Regular posts feed view: activities without an expiration date.
  final postsOnlyFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.user(userId),
      activityFilter: Filter.exists(ActivitiesFilterField.expiresAt, exists: false),
    ),
  );

  await Future.wait([
    storiesOnlyFeed.getOrCreate(),
    postsOnlyFeed.getOrCreate(),
  ]);
}

/// Mark a story as watched.
///
/// Call this when the user has viewed a story. The backend tracks watched
/// status per-user and the `isWatched` flag on [ActivityData] reflects it.
Future<void> markStoryWatched(String activityId) async {
  final userId = client.user.id;
  final storiesFeed = client.feedFromId(FeedId.stories(userId));

  await storiesFeed.markActivity(
    request: MarkActivityRequest(markWatched: [activityId]),
  );
}

/// Follow another user's story feed so their stories appear in the current
/// user's `stories` aggregation feed.
Future<void> followStoryFeed(String otherUserId) async {
  final userId = client.user.id;
  final storiesFeed = client.feedFromId(FeedId.stories(userId));
  await storiesFeed.getOrCreate();

  // Follow the target user's `story` feed from the current user's `stories` feed.
  await storiesFeed.follow(targetFid: FeedId.story(otherUserId));
}
