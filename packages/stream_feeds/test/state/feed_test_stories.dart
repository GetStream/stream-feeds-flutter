

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