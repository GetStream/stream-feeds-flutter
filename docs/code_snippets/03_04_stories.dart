import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;

// Stories are activities with an `expiresAt` timestamp posted to a `story`
// feed and aggregated in a `stories` feed.
//
// Convention:
// - Each user has a personal story feed: `FeedId.story(userId)`
// - A user's stories aggregation feed: `FeedId.stories(userId)`
// - Posting a story = adding an activity with an `expiresAt` timestamp
// - Stories expire automatically once `expiresAt` passes.
//
// The feed group must have `Stories` config enabled in the Stream dashboard.

/// Publish a story to the current user's story feed.
Future<void> postStory() async {
  final userId = client.user.id;
  final storyFeed = client.feedFromId(FeedId.story(userId));
  await storyFeed.getOrCreate();

  final expiresAt = DateTime.now().add(const Duration(hours: 24));

  await storyFeed.addActivity(
    request: FeedAddActivityRequest(
      type: 'story',
      text: 'My story',
      expiresAt: expiresAt,
      attachments: const [
        Attachment(
          imageUrl: 'https://example.com/photo.jpg',
          type: 'image',
          custom: {'width': 1080, 'height': 1920},
        ),
      ],
    ),
  );
}

/// Read the current user's stories aggregation feed.
///
/// The `stories` feed aggregates story activities from all users the current
/// user follows on their `story` feed. `getOrCreate()` performs the initial
/// fetch, so [Feed.state] is populated immediately after it returns.
Future<void> readStories() async {
  final userId = client.user.id;
  final storiesFeed = client.feedFromId(FeedId.stories(userId));
  await storiesFeed.getOrCreate();

  // aggregatedActivities groups story activities by author.
  for (final group in storiesFeed.state.aggregatedActivities) {
    final isWatched = group.activities.every((a) => a.isWatched ?? false);
    print(
      'Stories from ${group.activities.first.user.name}: '
      '${group.activities.length} stories '
      '(${isWatched ? 'watched' : 'unwatched'})',
    );
  }
}

/// Filter story activities (have expiresAt) vs regular posts (no expiresAt)
/// from the same user feed.
Future<void> filterStoriesFromFeed() async {
  final userId = client.user.id;

  // Stories-only view: activities that have an expiration date.
  final storiesOnlyFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.user(userId),
      activityFilter: Filter.exists(ActivitiesFilterField.expiresAt, exists: true),
    ),
  );

  // Regular posts view: activities without an expiration date.
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

  final stories = storiesOnlyFeed.state.activities;
  final posts = postsOnlyFeed.state.activities;

  print('${stories.length} stories, ${posts.length} regular posts');
}

/// Mark a story as watched.
///
/// Call this when the user has viewed a story. The backend tracks watched
/// status per-user and the `isWatched` flag on [ActivityData] reflects it.
Future<void> markStoryWatched(String activityId) async {
  final userId = client.user.id;
  final storiesFeed = client.feedFromId(FeedId.stories(userId));
  await storiesFeed.getOrCreate();

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

  await storiesFeed.follow(targetFid: FeedId.story(otherUserId));
}

/// Read expired stories from the current user's story feed.
///
/// Useful for showing an archive of past stories.
Future<void> readExpiredStories() async {
  final userId = client.user.id;
  final now = DateTime.timestamp();

  final expiredFeed = client.feedFromQuery(
    FeedQuery(
      fid: FeedId.story(userId),
      activityFilter: Filter.lessOrEqual(
        ActivitiesFilterField.expiresAt,
        now.toIso8601String(),
      ),
    ),
  );

  await expiredFeed.getOrCreate();

  for (final activity in expiredFeed.state.activities) {
    print('Expired story: ${activity.text} (expired at ${activity.expiresAt})');
  }
}
