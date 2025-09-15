import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late StreamFeedsClient saraClient;
late StreamFeedsClient adamClient;
late Feed feed;
late Feed timeline;

Future<void> followsAndUnfollows() async {
  // Follow a user
  final timeline = client.feed(group: 'timeline', id: 'john');
  await timeline.follow(targetFid: const FeedId(group: 'user', id: 'tom'));
  // Follow a stock
  await timeline.follow(targetFid: const FeedId(group: 'stock', id: 'apple'));
  // Follow with more fields
  await timeline.follow(
    targetFid: const FeedId(group: 'stock', id: 'apple'),
    custom: {'reason': 'investment'},
  );
}

Future<void> queryFollows() async {
  // Do I follow a list of feeds
  // My feed is timeline:john
  const followQuery = FollowsQuery(
    filter: Filter.and([
      Filter.equal(FollowsFilterField.sourceFeed, 'timeline:john'),
      Filter.in_(FollowsFilterField.targetFeed, ['user:sara', 'user:adam']),
    ]),
  );
  final followList = client.followList(followQuery);
  final page1 = await followList.get();
  final page2 = await followList.queryMoreFollows();
  final page1And2 = followList.state.follows;
  // Paginating through followers for a feed
  // My feed is timeline:john
  const followerQuery = FollowsQuery(
    filter: Filter.equal(FollowsFilterField.targetFeed, 'timeline:john'),
  );
  final followerList = client.followList(followerQuery);
  final followerPage1 = await followerList.get();
}

Future<void> followRequests() async {
  // Sara needs to configure the feed with visibility = followers for enabling follow requests
  const saraFeedQuery = FeedQuery(
    fid: FeedId(group: 'user', id: 'sara'),
    data: FeedInputData(visibility: FeedVisibility.followers),
  );
  final saraFeed = saraClient.feedFromQuery(saraFeedQuery);
  await saraFeed.getOrCreate();

  // Adam requesting to follow the feed
  final adamTimeline = adamClient.feed(group: 'timeline', id: 'adam');
  await adamTimeline.getOrCreate();
  final followRequest =
      await adamTimeline.follow(targetFid: saraFeed.fid); // user:sara
  print(followRequest.getOrNull()?.status); // .pending
  // Sara accepting
  await saraFeed.acceptFollow(
    sourceFid: adamTimeline.fid, // timeline:adam
    role: 'feed_member', // optional
  );
  // or rejecting the request
  await saraFeed.rejectFollow(sourceFid: adamTimeline.fid); // timeline:adam
}
