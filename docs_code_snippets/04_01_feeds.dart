// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> creatingAFeed() async {
  // Feed with no extra fields, of feed group "user"
  final feed = client.feed(group: 'user', id: 'john');
  await feed.getOrCreate();

  // More options
  const query = FeedQuery(
    fid: FeedId(group: 'user', id: 'jack'),
    data: FeedInputData(
      description: 'My personal feed',
      name: 'jack',
      visibility: FeedVisibility.public,
    ),
  );

  final feed2 = client.feedFromQuery(query);
  await feed2.getOrCreate();
}

Future<void> readingAFeed() async {
  final feed = client.feed(group: 'user', id: 'john');
  await feed.getOrCreate();
  final feedData = feed.state.feed;
  final activities = feed.state.activities;
  final members = feed.state.members;

  // Note: Always dispose the feed when you are done with it
  feed.dispose();
}

Future<void> readingAFeedMoreOptions() async {
  const query = FeedQuery(
    fid: FeedId(group: 'user', id: 'john'),
    // filter activities with filter tag green
    activityFilter: Filter.in_(
      ActivitiesFilterField.filterTags,
      ['green'],
    ),
    activityLimit: 10,
    // additional data used for ranking
    externalRanking: {'user_score': 0.8},
    followerLimit: 10,
    followingLimit: 10,
    memberLimit: 10,
    // overwrite the default ranking or aggregation logic for this feed. good for split testing
    view: 'myview',
    // receive web-socket events with real-time updates
    watch: true,
  );

  final feed = client.feedFromQuery(query);
  await feed.getOrCreate();
  final activities = feed.state.activities;
  final feedData = feed.state.feed;

  // Note: Always dispose the feed when you are done with it
  feed.dispose();
}

Future<void> feedPagination() async {
  final feed = client.feedFromQuery(
    const FeedQuery(
      fid: FeedId(group: 'user', id: 'john'),
      activityLimit: 10,
    ),
  );

  // Page 1
  await feed.getOrCreate();
  final activities = feed.state.activities; // First 10 activities

  // Page 2
  final page2Activities = await feed.queryMoreActivities(limit: 10);

  final page1And2Activities = feed.state.activities;
}

Future<void> filteringExamples() async {
  // Add a few activities
  const feedId = FeedId(group: 'user', id: 'john');
  await client.upsertActivities(
    activities: [
      ActivityRequest(
        feeds: [feedId.rawValue],
        filterTags: const ['green', 'blue'],
        text: 'first',
        type: 'post',
      ),
      ActivityRequest(
        feeds: [feedId.rawValue],
        filterTags: const ['yellow', 'blue'],
        text: 'second',
        type: 'post',
      ),
      ActivityRequest(
        feeds: [feedId.rawValue],
        filterTags: const ['orange'],
        text: 'third',
        type: 'activity',
      ),
    ],
  );
  // Now read the feed, this will fetch activity 1 and 2
  const query = FeedQuery(
    fid: feedId,
    activityFilter: Filter.in_(ActivitiesFilterField.filterTags, ['blue']),
  );

  final feed = client.feedFromQuery(query);
  await feed.getOrCreate();
  // contains first and second
  final activities = feed.state.activities;
}

Future<void> moreComplexFilterExamples() async {
  // Get all the activities where filter tags contain both "green" and "orange"
  const query = FeedQuery(
    fid: FeedId(group: 'user', id: 'john'),
    activityFilter: Filter.and([
      Filter.in_(ActivitiesFilterField.filterTags, ['green']),
      Filter.in_(ActivitiesFilterField.filterTags, ['orange']),
    ]),
  );

  final feed = client.feedFromQuery(query);
  await feed.getOrCreate();
  final activities = feed.state.activities;
}

Future<void> feedMembers() async {
  // The following methods are available to edit the members of a feed
  final result = await feed.updateFeedMembers(
    request: const UpdateFeedMembersRequest(
      members: [
        FeedMemberRequest(
          custom: {'joined': '2024-01-01'},
          role: 'moderator',
          userId: 'john',
        ),
      ],
      operation: UpdateFeedMembersRequestOperation.upsert,
    ),
  );

  // Remove members
  await feed.updateFeedMembers(
    request: const UpdateFeedMembersRequest(
      members: [
        FeedMemberRequest(userId: 'john'),
        FeedMemberRequest(userId: 'jane'),
      ],
      operation: UpdateFeedMembersRequestOperation.remove,
    ),
  );

  // Set members (overwrites the list)
  await feed.updateFeedMembers(
    request: const UpdateFeedMembersRequest(
      members: [FeedMemberRequest(role: 'moderator', userId: 'john')],
      operation: UpdateFeedMembersRequestOperation.set,
    ),
  );
}

Future<void> memberInvites() async {
  // Request to become a member
  await feed.updateFeedMembers(
    request: const UpdateFeedMembersRequest(
      members: [
        FeedMemberRequest(
          custom: {'reason': 'community builder'},
          invite: true,
          role: 'moderator',
          userId: 'john',
        ),
      ],
      operation: UpdateFeedMembersRequestOperation.upsert,
    ),
  );

  // Accept and reject member requests
  await feed.acceptFeedMember();
  await feed.rejectFeedMember();
}

Future<void> queryMyFeeds() async {
  final query = FeedsQuery(
    filter: const Filter.equal(FeedsFilterField.createdById, 'john'),
    sort: [FeedsSort.desc(FeedsSortField.createdAt)],
    limit: 10,
    watch: true,
  );

  final feedList = client.feedList(query);

  // Page 1
  final page1 = await feedList.get();

  // Page 2
  final page2 = await feedList.queryMoreFeeds(limit: 10);

  final page1And2 = feedList.state.feeds;
}

Future<void> queryFeedsWhereIAmAMember() async {
  const query = FeedsQuery(
    filter: Filter.contains(FeedsFilterField.members, 'john'),
  );
  final feedList = client.feedList(query);
  final feeds = await feedList.get();
}

Future<void> queryFeedsByNameOrVisibility() async {
  const sportsQuery = FeedsQuery(
    filter: Filter.and([
      Filter.equal(FeedsFilterField.visibility, 'public'),
      Filter.query(FeedsFilterField.name, 'Sports'),
    ]),
  );

  final sportsFeedList = client.feedList(sportsQuery);
  final sportsFeeds = await sportsFeedList.get();

  const techQuery = FeedsQuery(
    filter: Filter.and([
      Filter.equal(FeedsFilterField.visibility, 'public'),
      Filter.autoComplete(FeedsFilterField.description, 'tech'),
    ]),
  );

  final techFeedList = client.feedList(techQuery);
  final techFeeds = await techFeedList.get();
}

Future<void> queryFeedsByCreatorName() async {
  const query = FeedsQuery(
    filter: Filter.and([
      Filter.equal(FeedsFilterField.visibility, 'public'),
      Filter.query(FeedsFilterField.createdByName, 'Thompson'),
    ]),
  );

  final feedList = client.feedList(query);
  final feeds = await feedList.get();
}
