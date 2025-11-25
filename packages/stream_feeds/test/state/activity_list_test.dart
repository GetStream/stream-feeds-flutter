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

  group('Local filtering with real-time events', () {
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

      // Setup default mock response for queryActivities
      when(
        () => feedsApi.queryActivities(
          queryActivitiesRequest: any(named: 'queryActivitiesRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryActivitiesResponse(
            duration: DateTime.now().toIso8601String(),
            activities: [
              createDefaultActivityResponse(id: 'activity-1'),
              createDefaultActivityResponse(id: 'activity-2'),
              createDefaultActivityResponse(id: 'activity-3'),
            ],
          ),
        ),
      );
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    test(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send ActivityUpdatedEvent with type that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityUpdatedEvent(
              type: 'feeds.activity.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-1',
                // Doesn't match 'post' filter
              ).copyWith(type: 'comment'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test(
      'ActivityReactionAddedEvent - should remove activity when reaction causes filter mismatch',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send ActivityReactionAddedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityReactionAddedEvent(
              type: 'feeds.activity.reaction.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-2',
                // Doesn't match 'post' filter
              ).copyWith(type: 'comment'),
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

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test(
      'ActivityReactionDeletedEvent - should remove activity when reaction deletion causes filter mismatch',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send ActivityReactionDeletedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            ActivityReactionDeletedEvent(
              type: 'feeds.activity.reaction.deleted',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-3',
              ).copyWith(type: 'share'),
              reaction: FeedsReactionResponse(
                activityId: 'activity-3',
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

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test(
      'BookmarkAddedEvent - should remove activity when bookmark causes filter mismatch',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send BookmarkAddedEvent with activity that doesn't match filter
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
                  // Doesn't match 'post' filter
                ).copyWith(type: 'comment'),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test(
      'BookmarkDeletedEvent - should remove activity when bookmark deletion causes filter mismatch',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send BookmarkDeletedEvent with activity that doesn't match filter
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
                  // Doesn't match 'post' filter
                ).copyWith(type: 'share'),
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test(
      'CommentAddedEvent - should remove activity when comment causes filter mismatch',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.equal(ActivitiesFilterField.type, 'post'),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send CommentAddedEvent with activity that doesn't match filter
        wsStreamController.add(
          jsonEncode(
            CommentAddedEvent(
              type: 'feeds.comment.added',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-3',
                // Doesn't match 'post' filter
              ).copyWith(type: 'comment'),
              comment: createDefaultCommentResponse(
                objectId: 'activity-3',
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(activityList.state.activities, hasLength(2));
      },
    );

    test('Complex filter with AND - should filter correctly', () async {
      final activityList = client.activityList(
        ActivitiesQuery(
          filter: Filter.and([
            Filter.equal(ActivitiesFilterField.type, 'post'),
            Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      );

      await activityList.get();
      expect(activityList.state.activities, hasLength(3));

      // Send ActivityUpdatedEvent that matches only one condition
      wsStreamController.add(
        jsonEncode(
          ActivityUpdatedEvent(
            type: 'feeds.activity.updated',
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
            ).copyWith(
              type: 'post', // Matches first condition
              filterTags: ['general'], // Doesn't match second condition
            ), // Doesn't match any condition
          ),
        ),
      );

      // Wait for the event to be processed
      await Future<Object?>.delayed(Duration.zero);

      expect(activityList.state.activities, hasLength(2));
    });

    test(
      'Complex filter with OR - should only keep activities matching any condition',
      () async {
        final activityList = client.activityList(
          ActivitiesQuery(
            filter: Filter.or([
              Filter.equal(ActivitiesFilterField.type, 'post'),
              Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
            ]),
          ),
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send ActivityUpdatedEvent that matches only one condition
        wsStreamController.add(
          jsonEncode(
            ActivityUpdatedEvent(
              type: 'feeds.activity.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-1',
              ).copyWith(
                type: 'post', // Matches first condition
                filterTags: ['general'], // Doesn't match second condition
              ), // Doesn't match any condition
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(activityList.state.activities, hasLength(3));

        final updatedActivity = activityList.state.activities.firstWhere(
          (activity) => activity.id == 'activity-1',
        );

        expect(updatedActivity.filterTags, ['general']);
      },
    );

    test(
      'No filter - filtering is disabled when no filter specified',
      () async {
        final activityList = client.activityList(
          const ActivitiesQuery(), // No filter
        );

        await activityList.get();
        expect(activityList.state.activities, hasLength(3));

        // Send ActivityUpdatedEvent with any type
        wsStreamController.add(
          jsonEncode(
            ActivityUpdatedEvent(
              type: 'feeds.activity.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              activity: createDefaultActivityResponse(
                id: 'activity-1',
              ).copyWith(type: 'share'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(activityList.state.activities, hasLength(3));
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Feedback
  // ============================================================

  group('Activity feedback', () {
    const activityId = 'activity-1';

    activityListTest(
      'marks activity hidden on ActivityFeedbackEvent',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        tester.expect((al) => al.state.activities, hasLength(1));
        tester.expect((al) => al.state.activities.first.hidden, false);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'true',
            ),
          ),
        );

        tester.expect((al) => al.state.activities, hasLength(1));
        tester.expect((al) => al.state.activities.first.hidden, true);
      },
    );

    activityListTest(
      'marks activity unhidden on ActivityFeedbackEvent',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId, hidden: true),
          ],
        ),
      ),
      body: (tester) async {
        tester.expect((al) => al.state.activities, hasLength(1));
        tester.expect((al) => al.state.activities.first.hidden, true);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'false',
            ),
          ),
        );

        tester.expect((al) => al.state.activities, hasLength(1));
        tester.expect((al) => al.state.activities.first.hidden, false);
      },
    );
  });
}
