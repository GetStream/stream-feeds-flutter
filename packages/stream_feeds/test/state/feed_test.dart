// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  late StreamFeedsClientImpl client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClientImpl(
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

  group('Story events', () {
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

    test('Watch story should update isWatched', () async {
      const feedId = FeedId(group: 'stories', id: 'target');
      final activity1 = createDefaultActivityResponse().activity.copyWith(
            isWatched: false,
            id: 'storyActivityId1',
          );

      final activity2 = createDefaultActivityResponse().activity.copyWith(
            isWatched: false,
            id: 'storyActivityId2',
          );

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          createDefaultGetOrCreateFeedResponse(
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                activities: [activity1, activity2],
              ),
            ],
          ),
        ),
      );

      final feed = client.feedFromId(feedId);

      final result = await feed.getOrCreate();
      result.getOrThrow();

      expect(feed.state.aggregatedActivities.length, 1);
      expect(
        feed.state.aggregatedActivities.first.activities.first.isWatched,
        false,
      );
      expect(
        feed.state.aggregatedActivities.first.activities[1].isWatched,
        false,
      );

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());
            expect(
              event.aggregatedActivities.first.activities.first.isWatched,
              true,
            );
            expect(
              event.aggregatedActivities.first.activities[1].isWatched,
              false,
            );
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.now(),
            custom: const {},
            fid: feedId.toString(),
            markWatched: [activity1.id],
          ),
        ),
      );
    });

    test('Pagination should load more aggregated activities', () async {
      const feedId = FeedId(group: 'stories', id: 'target');
      const nextPagination = 'next';
      const prevPagination = 'prev';

      final activity1 = createDefaultActivityResponse()
          .activity
          .copyWith(id: 'storyActivityId1');

      final activity2 = createDefaultActivityResponse()
          .activity
          .copyWith(id: 'storyActivityId2');

      final activity3 = createDefaultActivityResponse()
          .activity
          .copyWith(id: 'storyActivityId3');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (invocation) async {
          final request =
              invocation.namedArguments[const Symbol('getOrCreateFeedRequest')]
                  as GetOrCreateFeedRequest;

          if (request.next == null) {
            return Result.success(
              createDefaultGetOrCreateFeedResponse(
                nextPagination: nextPagination,
                aggregatedActivities: [
                  createDefaultAggregatedActivityResponse(
                    group: 'group1',
                    activities: [activity1, activity2],
                  ),
                ],
              ),
            );
          }
          if (request.next == nextPagination) {
            return Result.success(
              createDefaultGetOrCreateFeedResponse(
                prevPagination: prevPagination,
                aggregatedActivities: [
                  createDefaultAggregatedActivityResponse(
                    group: 'group2',
                    activities: [activity3],
                  ),
                ],
              ),
            );
          }
          throw Exception('Unexpected request');
        },
      );

      final feed = client.feedFromId(feedId);

      final result = await feed.getOrCreate();
      result.getOrThrow();

      expect(feed.state.aggregatedActivities.length, 1);
      expect(feed.state.aggregatedActivities.first.activities.length, 2);

      await feed.queryMoreActivities();

      expect(feed.state.aggregatedActivities.length, 2);
      expect(feed.state.aggregatedActivities.last.activities.length, 1);
    });

    test('StoriesFeedUpdatedEvent should update aggregated activities',
        () async {
      const feedId = FeedId(group: 'stories', id: 'target');

      final activity1 = createDefaultActivityResponse()
          .activity
          .copyWith(id: 'storyActivityId1');

      final activity2 = createDefaultActivityResponse()
          .activity
          .copyWith(id: 'storyActivityId2');

      when(
        () => feedsApi.getOrCreateFeed(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          getOrCreateFeedRequest: any(named: 'getOrCreateFeedRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          createDefaultGetOrCreateFeedResponse(
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                group: 'group1',
                activities: [activity1],
              ),
            ],
          ),
        ),
      );

      final feed = client.feedFromId(feedId);

      final result = await feed.getOrCreate();
      result.getOrThrow();
      expect(feed.state.aggregatedActivities.length, 1);
      expect(feed.state.aggregatedActivities.first.activities.length, 1);

      feed.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<FeedState>());

            expect(event.aggregatedActivities.length, 1);
            expect(event.aggregatedActivities.first.activities.length, 2);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          StoriesFeedUpdatedEvent(
            type: EventTypes.storiesFeedUpdated,
            createdAt: DateTime.now(),
            custom: const {},
            fid: feedId.toString(),
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                group: 'group1',
                activities: [activity1, activity2],
              ),
            ],
          ),
        ),
      );
    });
  });
}
