// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  late StreamFeedsClient client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClient(
      apiKey: 'apiKey',
      user: const User(id: 'luke_skywalker'),
      tokenProvider: TokenProvider.static(UserToken(testToken)),
      feedsRestApi: feedsApi,
      wsProvider: (options) => webSocketChannel,
    );
  });

  tearDown(() {
    client.disconnect();
  });

  group('Get a Feed', () {
    test('get feed', () async {
      const feedId = FeedId(group: 'group', id: 'id');
      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(createDefaultGetOrCreateFeedResponse()),
      );

      final feed = client.feed(group: feedId.group, id: feedId.id);
      final result = await feed.getOrCreate();

      expect(result, isA<Result<FeedData>>());
      final feedData = result.getOrThrow();

      expect(feedData, isA<FeedData>());
      expect(feedData.id, 'id');
      expect(feedData.name, 'name');
      expect(feedData.description, 'description');
    });
  });

  group('Follow events', () {
    late StreamController<Object> wsStreamController;
    late MockWebSocketSink webSocketSink;

    setUp(() async {
      wsStreamController = StreamController<Object>();
      webSocketSink = MockWebSocketSink();
      WsTestConnection(
        wsStreamController: wsStreamController,
        webSocketSink: webSocketSink,
        webSocketChannel: webSocketChannel,
      ).setUp();

      await client.connect();
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    test('follow target feed should update follower count', () async {
      const targetFeedId = FeedId(group: 'group', id: 'target');
      const sourceFeedId = FeedId(group: 'group', id: 'source');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: targetFeedId.group,
          feedId: targetFeedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(createDefaultGetOrCreateFeedResponse()),
      );

      final feed = client.feedFromId(targetFeedId);

      final result = await feed.getOrCreate();
      final feedData = result.getOrThrow();

      expect(feedData.followerCount, 0);
      expect(feedData.followingCount, 0);

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());
            expect(event.feed?.followerCount, 1);
            expect(event.feed?.followingCount, 0);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.now(),
            custom: const {},
            fid: targetFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.now(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.now(),
              requestRejectedAt: DateTime.now(),
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
                followingCount: 1,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 1,
              ),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      );
    });

    test('follow source feed should update following count', () async {
      const targetFeedId = FeedId(group: 'group', id: 'target');
      const sourceFeedId = FeedId(group: 'group', id: 'source');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: sourceFeedId.group,
          feedId: sourceFeedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(createDefaultGetOrCreateFeedResponse()),
      );

      final feed = client.feedFromId(sourceFeedId);

      final result = await feed.getOrCreate();
      final feedData = result.getOrThrow();

      expect(feedData.followerCount, 0);
      expect(feedData.followingCount, 0);

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());
            expect(event.feed?.followerCount, 0);
            expect(event.feed?.followingCount, 1);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.now(),
            custom: const {},
            fid: sourceFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.now(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.now(),
              requestRejectedAt: DateTime.now(),
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
                followingCount: 1,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 1,
              ),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      );
    });

    test('follow deleted target feed should update follower count', () async {
      const targetFeedId = FeedId(group: 'group', id: 'target');
      const sourceFeedId = FeedId(group: 'group', id: 'source');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: targetFeedId.group,
          feedId: targetFeedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          createDefaultGetOrCreateFeedResponse(
            followerCount: 1,
            followingCount: 1,
          ),
        ),
      );

      final feed = client.feedFromId(targetFeedId);

      final result = await feed.getOrCreate();
      final feedData = result.getOrThrow();

      expect(feedData.followerCount, 1);
      expect(feedData.followingCount, 1);

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());
            expect(event.feed?.followerCount, 0);
            expect(event.feed?.followingCount, 1);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          FollowDeletedEvent(
            type: EventTypes.followDeleted,
            createdAt: DateTime.now(),
            custom: const {},
            fid: targetFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.now(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.now(),
              requestRejectedAt: DateTime.now(),
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
                followingCount: 0,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 0,
              ),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      );
    });

    test('follow deleted source feed should update following count', () async {
      const targetFeedId = FeedId(group: 'group', id: 'target');
      const sourceFeedId = FeedId(group: 'group', id: 'source');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: sourceFeedId.group,
          feedId: sourceFeedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          createDefaultGetOrCreateFeedResponse(
            followingCount: 1,
            followerCount: 1,
          ),
        ),
      );

      final feed = client.feedFromId(sourceFeedId);

      final result = await feed.getOrCreate();
      final feedData = result.getOrThrow();

      expect(feedData.followerCount, 1);
      expect(feedData.followingCount, 1);

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());
            expect(event.feed?.followerCount, 1);
            expect(event.feed?.followingCount, 0);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          FollowDeletedEvent(
            type: EventTypes.followDeleted,
            createdAt: DateTime.now(),
            custom: const {},
            fid: sourceFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.now(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.now(),
              requestRejectedAt: DateTime.now(),
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
                followingCount: 0,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 0,
              ),
              updatedAt: DateTime.now(),
            ),
          ),
        ),
      );
    });
  });

  group('Local filtering with real-time events', () {
    late StreamController<Object> wsStreamController;
    late MockWebSocketSink webSocketSink;

    const feedId = FeedId(group: 'user', id: 'test');

    setUp(() async {
      wsStreamController = StreamController<Object>();
      webSocketSink = MockWebSocketSink();
      WsTestConnection(
        wsStreamController: wsStreamController,
        webSocketSink: webSocketSink,
        webSocketChannel: webSocketChannel,
      ).setUp();

      await client.connect();

      final initialActivities = [
        createDefaultActivityResponse(id: 'activity-1').activity,
        createDefaultActivityResponse(id: 'activity-2').activity,
        createDefaultActivityResponse(id: 'activity-3').activity,
      ];

      final initialPinnedActivities = [
        ActivityPinResponse(
          feed: feedId.rawValue,
          activity: initialActivities.first,
          createdAt: DateTime(2022, 1, 1),
          updatedAt: DateTime(2022, 1, 1),
          user: createDefaultUserResponse(id: 'user-1'),
        ),
      ];

      // Setup default mock response
      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          createDefaultGetOrCreateFeedResponse().copyWith(
            activities: initialActivities,
            pinnedActivities: initialPinnedActivities,
          ),
        ),
      );
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    test(
      'ActivityAddedEvent - should not add activity that does not match filter',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send ActivityAddedEvent with type 'comment' (doesn't match filter)
        wsStreamController.add(
          jsonEncode(
            ActivityAddedEvent(
              type: 'feeds.activity.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-4',
                // Doesn't match 'post' filter
              ).activity.copyWith(type: 'comment'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(3));
      },
    );

    test(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send ActivityUpdatedEvent with type that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityUpdatedEvent(
              type: 'feeds.activity.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-1',
                // Doesn't match 'post' filter
              ).activity.copyWith(type: 'comment'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test(
      'ActivityReactionAddedEvent - should remove activity when reaction causes filter mismatch',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send ActivityReactionAddedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityReactionAddedEvent(
              type: 'feeds.activity.reaction.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-1',
                // Doesn't match 'post' filter
              ).activity.copyWith(type: 'comment'),
              reaction: FeedsReactionResponse(
                activityId: 'activity-1',
                type: 'like',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                user: createDefaultUserResponse(),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test(
      'CommentAddedEvent - should remove activity when comment causes filter mismatch',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.in_(
              ActivitiesFilterField.filterTags,
              ['important'],
            ),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send CommentAddedEvent with activity that doesn't have 'important' tag
        wsStreamController.add(
          jsonEncode(
            CommentAddedEvent(
              type: 'feeds.comment.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-1',
              ).activity.copyWith(
                filterTags: ['general'], // Doesn't have 'important' tag
              ),
              comment: createDefaultCommentResponse(
                objectId: 'activity-1',
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test(
      'ActivityReactionDeletedEvent - should remove activity when reaction deletion causes filter mismatch',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send ActivityReactionDeletedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityReactionDeletedEvent(
              type: 'feeds.activity.reaction.deleted',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-2',
                // Doesn't match 'post' filter
              ).activity.copyWith(type: 'comment'),
              reaction: FeedsReactionResponse(
                activityId: 'activity-2',
                type: 'like',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                user: createDefaultUserResponse(),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test(
      'ActivityPinnedEvent - should remove activity when pinned activity does not match filter',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));
        expect(feed.state.pinnedActivities, hasLength(1));

        // Send ActivityPinnedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityPinnedEvent(
              type: 'feeds.activity.pinned',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              pinnedActivity: createDefaultPinActivityResponse(
                activityId: 'activity-1',
                type: 'comment', // Doesn't match 'post' filter
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
        expect(feed.state.pinnedActivities, isEmpty);
      },
    );

    test(
      'ActivityUnpinnedEvent - should remove activity when unpinned activity does not match filter',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));
        expect(feed.state.pinnedActivities, hasLength(1));

        // Send ActivityUnpinnedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityUnpinnedEvent(
              type: 'feeds.activity.unpinned',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              pinnedActivity: createDefaultPinActivityResponse(
                activityId: 'activity-1',
                type: 'comment', // Doesn't match 'post' filter
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
        expect(feed.state.pinnedActivities, isEmpty);
      },
    );

    test(
      'BookmarkAddedEvent - should remove activity when bookmark causes filter mismatch',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.in_(
              ActivitiesFilterField.filterTags,
              ['important'],
            ),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send BookmarkAddedEvent with activity that doesn't have 'important' tag
        wsStreamController.add(
          jsonEncode(
            BookmarkAddedEvent(
              type: 'feeds.bookmark.added',
              createdAt: DateTime.now(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                activityId: 'activity-1',
              ).copyWith(
                activity: createDefaultActivityResponse(
                  id: 'activity-1',
                ).activity.copyWith(
                  feeds: [feedId.rawValue], // Activity belongs to this feed
                  filterTags: ['general'], // Doesn't have 'important' tag
                ),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test(
      'BookmarkDeletedEvent - should remove activity when bookmark deletion causes filter mismatch',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.in_(
              ActivitiesFilterField.filterTags,
              ['important'],
            ),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send BookmarkDeletedEvent with activity that doesn't have 'important' tag
        wsStreamController.add(
          jsonEncode(
            BookmarkDeletedEvent(
              type: 'feeds.bookmark.deleted',
              createdAt: DateTime.now(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                activityId: 'activity-2',
              ).copyWith(
                activity: createDefaultActivityResponse(
                  id: 'activity-2',
                  feeds: [feedId.rawValue], // Activity belongs to this feed
                ).activity.copyWith(
                  filterTags: ['general'], // Doesn't have 'important' tag
                ),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(2));
      },
    );

    test('Complex filter with AND - should filter correctly', () async {
      final feed = client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.and([
            Filter.equal(ActivitiesFilterField.type, 'post'),
            Filter.in_(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      );

      await feed.getOrCreate();
      expect(feed.state.activities, hasLength(3));

      // Send ActivityAddedEvent that matches only one condition
      wsStreamController.add(
        jsonEncode(
          ActivityAddedEvent(
            type: 'feeds.activity.added',
            createdAt: DateTime.now(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
            ).activity.copyWith(
              type: 'post', // Matches first condition
              filterTags: ['general'], // Doesn't match second condition
            ),
          ),
        ),
      );

      // Wait for the event to be processed
      await Future<Object?>.delayed(Duration.zero);

      expect(feed.state.activities, hasLength(3));
    });

    test(
      'Complex filter with OR - should add activities matching any condition',
      () async {
        final feed = client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.or([
              Filter.equal(ActivitiesFilterField.type, 'post'),
              Filter.in_(ActivitiesFilterField.filterTags, ['featured']),
            ]),
          ),
        );

        await feed.getOrCreate();
        expect(feed.state.activities, hasLength(3));

        // Send ActivityAddedEvent that matches only one condition
        wsStreamController.add(
          jsonEncode(
            ActivityAddedEvent(
              type: 'feeds.activity.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-4',
              ).activity.copyWith(
                type: 'post', // Matches first condition
                filterTags: ['general'], // Doesn't match second condition
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        // Activity should be added because it matches first condition
        expect(feed.state.activities, hasLength(4));
      },
    );

    test(
      'No filter - filtering is disabled when no filter specified',
      () async {
        final feed = client.feedFromQuery(
          const FeedQuery(
            fid: feedId,
            // No activityFilter - all activities should be accepted
          ),
        );

        await feed.getOrCreate();

        // Verify the feed has no filter
        expect(feed.query.activityFilter, isNull);
        expect(feed.state.activities, hasLength(3));

        // Send ActivityAddedEvent that matches only one condition
        wsStreamController.add(
          jsonEncode(
            ActivityAddedEvent(
              type: 'feeds.activity.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-4',
                // Doesn't match 'post' activity type
              ).activity.copyWith(type: 'post'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(feed.state.activities, hasLength(4));
      },
    );
  });
}
