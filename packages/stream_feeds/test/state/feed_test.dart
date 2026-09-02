// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:io';

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ==========================================================================
  // Feed - Feed Operations
  // ==========================================================================

  group('Feed - Feed Operations', () {
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'getOrCreate() - should fetch or create feed',
      build: (client) => client.feed(group: 'group', id: 'id'),
      body: (tester) async {
        final result = await tester.getOrCreate();

        expect(result, isA<Result<FeedData>>());
        final feedData = result.getOrThrow();

        expect(feedData, isA<FeedData>());
        expect(feedData.id, 'id');
        expect(feedData.groupId, 'group');
      },
    );

    feedTest(
      'getOrCreate() sends enrichmentOptions from FeedQuery to the API',
      build: (client) => client.feedFromQuery(
        const FeedQuery(
          fid: feedId,
          enrichmentOptions: EnrichmentOptions(enrichOwnFollowings: true),
        ),
      ),
      body: (tester) async {
        final result = await tester.getOrCreate();
        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.getOrCreateFeed(
          feedId: feedId.id,
          feedGroupId: feedId.group,
          getOrCreateFeedRequest: const GetOrCreateFeedRequest(
            watch: true,
            enrichmentOptions: EnrichmentOptions(enrichOwnFollowings: true),
          ),
        ),
      ),
    );

    feedTest(
      'stopWatching() - should stop watching feed',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.stopWatchingFeed(feedGroupId: 'user', feedId: 'john'),
          result: const DurationResponse(duration: '0ms'),
        );

        final result = await tester.feed.stopWatching();

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.stopWatchingFeed(feedGroupId: 'user', feedId: 'john'),
      ),
    );

    feedTest(
      'updateFeed() - should update feed data',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.updateFeed(
            feedGroupId: 'user',
            feedId: 'john',
            updateFeedRequest: const UpdateFeedRequest(custom: {'updated': true}),
          ),
          result: UpdateFeedResponse(
            duration: '0ms',
            feed: createDefaultFeedResponse(
              id: 'john',
              groupId: 'user',
              name: 'updated-name',
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FeedUpdated>()),
        );

        final result = await tester.feed.updateFeed(
          request: const UpdateFeedRequest(custom: {'updated': true}),
        );

        expect(result.isSuccess, isTrue);
        final feedData = result.getOrThrow();
        expect(feedData.name, 'updated-name');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateFeed(
          feedGroupId: 'user',
          feedId: 'john',
          updateFeedRequest: const UpdateFeedRequest(custom: {'updated': true}),
        ),
      ),
    );

    feedTest(
      'deleteFeed() - should delete feed',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteFeed(
            feedGroupId: 'user',
            feedId: 'john',
            hardDelete: false,
          ),
          result: const DeleteFeedResponse(taskId: 'task-1', duration: '0ms'),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FeedDeleted>()),
        );

        final result = await tester.feed.deleteFeed();

        expect(result.isSuccess, isTrue);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteFeed(
          feedGroupId: 'user',
          feedId: 'john',
          hardDelete: false,
        ),
      ),
    );

    feedTest(
      'FeedUpdatedEvent - should update feed data',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.feed, isNotNull);
        expect(tester.feedState.feed!.name, 'name');

        await tester.emitEvent(
          FeedUpdatedEvent(
            type: EventTypes.feedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            feed: createDefaultFeedResponse(
              id: 'john',
              groupId: 'user',
              name: 'updated-name',
            ),
          ),
        );

        expect(tester.feedState.feed, isNotNull);
        expect(tester.feedState.feed!.name, 'updated-name');
      },
    );

    feedTest(
      'FeedDeletedEvent - should clear feed data',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.feed, isNotNull);

        await tester.emitEvent(
          FeedDeletedEvent(
            type: EventTypes.feedDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
          ),
        );

        expect(tester.feedState.feed, isNull);
      },
    );
  });

  // ==========================================================================
  // Feed - Activities
  // ==========================================================================

  group('Feed - Activities', () {
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'addActivity() - should add activity to feed',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(type: 'post', feeds: []),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityAdded>()),
        );

        final result = await tester.feed.addActivity(
          request: const FeedAddActivityRequest(type: 'post'),
        );

        expect(result.isSuccess, isTrue);
        final activity = result.getOrThrow();
        expect(activity.id, 'activity-1');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(type: 'post', feeds: []),
        ),
      ),
    );

    feedTest(
      'updateActivity() - should update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.updateActivity(
            id: 'activity-1',
            updateActivityRequest: const UpdateActivityRequest(custom: {'updated': true}),
          ),
          result: UpdateActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ).copyWith(custom: {'updated': true}),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityUpdated>()),
        );

        final result = await tester.feed.updateActivity(
          id: 'activity-1',
          request: const UpdateActivityRequest(custom: {'updated': true}),
        );

        expect(result.isSuccess, isTrue);
        final activity = result.getOrThrow();
        expect(activity.custom?['updated'], true);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateActivity(
          id: 'activity-1',
          updateActivityRequest: const UpdateActivityRequest(custom: {'updated': true}),
        ),
      ),
    );

    feedTest(
      'updateActivityPartial() - should partially update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.updateActivityPartial(
            id: 'activity-1',
            updateActivityPartialRequest: const UpdateActivityPartialRequest(set: {'text': 'Updated text'}),
          ),
          result: UpdateActivityPartialResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ).copyWith(text: 'Updated text'),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityUpdated>()),
        );

        final result = await tester.feed.updateActivityPartial(
          id: 'activity-1',
          request: const UpdateActivityPartialRequest(
            set: {'text': 'Updated text'},
          ),
        );

        expect(result.isSuccess, isTrue);
        final activity = result.getOrThrow();
        expect(activity.text, 'Updated text');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateActivityPartial(
          id: 'activity-1',
          updateActivityPartialRequest: const UpdateActivityPartialRequest(set: {'text': 'Updated text'}),
        ),
      ),
    );

    feedTest(
      'deleteActivity() - should delete activity from feed',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteActivity(
            id: 'activity-1',
            hardDelete: false,
          ),
          result: const DeleteActivityResponse(duration: '0ms'),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityDeleted>()),
        );

        final result = await tester.feed.deleteActivity(id: 'activity-1');

        expect(result.isSuccess, isTrue);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteActivity(
          id: 'activity-1',
          hardDelete: false,
        ),
      ),
    );

    feedTest(
      'deleteActivity() - should pass deleteNotificationActivity to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteActivity(
            id: 'activity-1',
            hardDelete: false,
            deleteNotificationActivity: true,
          ),
          result: const DeleteActivityResponse(duration: '0ms'),
        );

        final result = await tester.feed.deleteActivity(
          id: 'activity-1',
          deleteNotificationActivity: true,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteActivity(
          id: 'activity-1',
          hardDelete: false,
          deleteNotificationActivity: true,
        ),
      ),
    );

    feedTest(
      'activityFeedback() - should submit feedback via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.activityFeedback(
            activityId: 'activity-1',
            activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
          ),
          result: createDefaultActivityFeedbackResponse(
            activityId: 'activity-1',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityHidden>()),
        );

        final result = await tester.feed.activityFeedback(
          activityId: 'activity-1',
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        );

        expect(result.isSuccess, isTrue);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.activityFeedback(
          activityId: 'activity-1',
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        ),
      ),
    );

    feedTest(
      'markActivity() - should mark activity as read',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.markActivity(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            markActivityRequest: const MarkActivityRequest(markRead: ['activity-1']),
          ),
          result: const DurationResponse(duration: '0ms'),
        );

        final result = await tester.feed.markActivity(
          request: const MarkActivityRequest(markRead: ['activity-1']),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.markActivity(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          markActivityRequest: const MarkActivityRequest(markRead: ['activity-1']),
        ),
      ),
    );

    feedTest(
      'queryMoreActivities() - should load more activities',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          next: 'next-cursor',
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.canLoadMoreActivities, isTrue);

        tester.mockApi(
          (api) => api.getOrCreateFeed(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            getOrCreateFeedRequest: const GetOrCreateFeedRequest(next: 'next-cursor', watch: true),
          ),
          result: createDefaultGetOrCreateFeedResponse(
            prevPagination: 'prev-cursor',
            activities: [
              createDefaultActivityResponse(
                id: 'activity-2',
                feeds: [feedId.rawValue],
              ),
            ],
          ),
        );

        final result = await tester.feed.queryMoreActivities();

        expect(result.isSuccess, isTrue);
        final activities = result.getOrThrow();
        expect(activities, hasLength(1));
        expect(activities.first.id, 'activity-2');
        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'repost() - should repost activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'post',
              feeds: ['user:john'],
              text: 'Check this out!',
              parentId: 'activity-1',
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'repost-1',
              feeds: [feedId.rawValue],
              type: 'repost',
            ),
          ),
        );

        final result = await tester.feed.repost(
          activityId: 'activity-1',
          text: 'Check this out!',
        );

        expect(result.isSuccess, isTrue);
        final activity = result.getOrThrow();
        expect(activity.type, 'repost');
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(
            type: 'post',
            feeds: ['user:john'],
            text: 'Check this out!',
            parentId: 'activity-1',
          ),
        ),
      ),
    );

    // Activity Events

    feedTest(
      'ActivityFeedbackEvent - should mark activity hidden',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: 'activity-1', hidden: false),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.hidden, false);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: 'activity-1',
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'true',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.hidden, true);
      },
    );

    feedTest(
      'ActivityFeedbackEvent - should mark activity unhidden',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: 'activity-1', hidden: true),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.hidden, true);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: 'activity-1',
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'false',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.hidden, false);
      },
    );

    // The activity below names a feed this client has not cached, which is what
    // sends the handler to fetch its capabilities.
    OwnBatchRequest capabilitiesFor(String feed) => OwnBatchRequest(feeds: [feed]);

    // The wait `CapabilitiesRepository` allows itself before its one retry.
    const retryBackoff = Duration(milliseconds: 500);

    ActivityAddedEvent activityInUncachedFeed() => ActivityAddedEvent(
      type: EventTypes.activityAdded,
      createdAt: DateTime.timestamp(),
      custom: const {},
      fid: feedId.rawValue,
      activity: createDefaultActivityResponse(
        id: 'new-activity',
        userId: 'user-1',
        currentFeed: createDefaultFeedResponse(id: 'other', groupId: 'user'),
      ),
    );

    feedTest(
      'ActivityAddedEvent - retries a capabilities fetch that failed on the network',
      user: const User(id: 'user-1'),
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        registerFallbackValue(const OwnBatchRequest(feeds: []));

        tester.mockApiFailure(
          (api) => api.ownBatch(ownBatchRequest: capabilitiesFor('other')),
          error: const StreamNetworkException(message: 'Connection failed'),
        );

        await tester.emitEvent(activityInUncachedFeed());

        // A blip is worth asking again for; the loop allows exactly one retry.
        await Future<void>.delayed(retryBackoff + const Duration(milliseconds: 200));
        tester.verifyApiCalled(
          (api) => api.ownBatch(ownBatchRequest: capabilitiesFor('other')),
          times: 2,
        );
      },
    );

    feedTest(
      'ActivityAddedEvent - should add activity to feed',
      user: const User(id: 'user-1'),
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: 'activity-1', userId: 'user-1'),
            createDefaultActivityResponse(id: 'activity-2', userId: 'user-1'),
            createDefaultActivityResponse(id: 'activity-3', userId: 'user-1'),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'new-activity',
              userId: 'user-1',
            ),
          ),
        );

        final activities = tester.feedState.activities;

        expect(activities, hasLength(4));
        expect(activities.any((a) => a.id == 'new-activity'), isTrue);
      },
    );

    feedTest(
      'ActivityUpdatedEvent - should update existing activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: 'activity-1', type: 'post'),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.type, 'post');

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              type: 'share',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(1));
        expect(tester.feedState.activities.first.type, 'share');
      },
    );

    feedTest(
      'ActivityDeletedEvent - should remove activity from feed',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [createDefaultActivityResponse(id: 'activity-1')],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));

        await tester.emitEvent(
          ActivityDeletedEvent(
            type: EventTypes.activityDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        expect(tester.feedState.activities, isEmpty);
      },
    );

    feedTest(
      'ActivityPinnedEvent - should add pinned activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.pinnedActivities, isEmpty);

        await tester.emitEvent(
          ActivityPinnedEvent(
            type: EventTypes.activityPinned,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pinnedActivity: createDefaultPinActivityResponse(
              activityId: 'activity-1',
            ),
          ),
        );

        final pinnedActivities = tester.feedState.pinnedActivities;
        expect(pinnedActivities, hasLength(1));
        expect(pinnedActivities.first.activity.id, 'activity-1');
      },
    );

    feedTest(
      'ActivityUnpinnedEvent - should remove pinned activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          pinnedActivities: [
            createDefaultActivityPinResponse(activityId: 'activity-1'),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.pinnedActivities, hasLength(1));

        await tester.emitEvent(
          ActivityUnpinnedEvent(
            type: EventTypes.activityUnpinned,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pinnedActivity: createDefaultPinActivityResponse(
              activityId: 'activity-1',
            ),
          ),
        );

        expect(tester.feedState.pinnedActivities, isEmpty);
      },
    );

    feedTest(
      'ActivityRemovedFromFeedEvent - should remove activity from feed',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [createDefaultActivityResponse(id: 'activity-1')],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(1));

        await tester.emitEvent(
          ActivityRemovedFromFeedEvent(
            type: EventTypes.activityRemovedFromFeed,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        expect(tester.feedState.activities, isEmpty);
      },
    );

    // Local filtering tests

    group('ActivityListEventHandler - Local filtering', () {
      const feedId = FeedId(group: 'user', id: 'test');

      final initialActivities = [
        createDefaultActivityResponse(id: 'activity-1'),
        createDefaultActivityResponse(id: 'activity-2'),
        createDefaultActivityResponse(id: 'activity-3'),
      ];

      final initialPinnedActivities = [
        ActivityPinResponse(
          feed: feedId.rawValue,
          activity: createDefaultActivityResponse(id: 'activity-1'),
          createdAt: DateTime(2022, 1, 1),
          updatedAt: DateTime(2022, 1, 1),
          user: createDefaultUserResponse(id: 'user-1'),
        ),
      ];

      feedTest(
        'ActivityAddedEvent - should not add activity that does not match filter',
        build: (client) => client.feedFromQuery(
          FeedQuery(
            fid: const FeedId(group: 'user', id: 'test'),
            activityFilter: Filter.equal(
              ActivitiesFilterField.activityType,
              'post',
            ),
          ),
        ),
        setUp: (tester) => tester.getOrCreate(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(id: 'activity-1', type: 'post'),
            ],
          ),
        ),
        body: (tester) async {
          expect(tester.feedState.activities, hasLength(1));

          // Send ActivityAddedEvent with type 'comment' (doesn't match filter)
          await tester.emitEvent(
            ActivityAddedEvent(
              type: EventTypes.activityAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:test',
              activity: createDefaultActivityResponse(
                id: 'activity-2',
                type: 'comment',
              ),
            ),
          );

          // Activity should not be added because it doesn't match filter
          expect(tester.feedState.activities, hasLength(1));
        },
      );

      feedTest(
        'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
        build: (client) => client.feedFromQuery(
          FeedQuery(
            fid: const FeedId(group: 'user', id: 'test'),
            activityFilter: Filter.equal(
              ActivitiesFilterField.activityType,
              'post',
            ),
          ),
        ),
        setUp: (tester) => tester.getOrCreate(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(id: 'activity-1', type: 'post'),
            ],
          ),
        ),
        body: (tester) async {
          expect(tester.feedState.activities, hasLength(1));

          // Send ActivityUpdatedEvent with type 'comment' (doesn't match filter)
          await tester.emitEvent(
            ActivityUpdatedEvent(
              type: EventTypes.activityUpdated,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:test',
              activity: createDefaultActivityResponse(
                id: 'activity-1',
                type: 'comment',
              ),
            ),
          );

          // Activity should be removed because it no longer matches filter
          expect(tester.feedState.activities, isEmpty);
        },
      );

      feedTest(
        'Complex filter with AND - should filter correctly',
        build: (client) => client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.and([
              Filter.equal(ActivitiesFilterField.activityType, 'post'),
              Filter.in_(ActivitiesFilterField.filterTags, ['featured']),
            ]),
          ),
        ),
        setUp: (tester) => tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: initialActivities,
            pinnedActivities: initialPinnedActivities,
          ),
        ),
        body: (tester) async {
          expect(tester.feedState.activities, hasLength(3));

          await tester.emitEvent(
            ActivityAddedEvent(
              type: EventTypes.activityAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(id: 'activity-4').copyWith(
                type: 'post', // Matches first condition
                filterTags: ['general'], // Doesn't match second condition
              ),
            ),
          );

          expect(tester.feedState.activities, hasLength(3));
        },
      );

      feedTest(
        'Complex filter with OR - should add activities matching any condition',
        build: (client) => client.feedFromQuery(
          FeedQuery(
            fid: feedId,
            activityFilter: Filter.or([
              Filter.equal(ActivitiesFilterField.activityType, 'post'),
              Filter.in_(ActivitiesFilterField.filterTags, ['featured']),
            ]),
          ),
        ),
        setUp: (tester) => tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: initialActivities,
            pinnedActivities: initialPinnedActivities,
          ),
        ),
        body: (tester) async {
          expect(tester.feedState.activities, hasLength(3));

          await tester.emitEvent(
            ActivityAddedEvent(
              type: EventTypes.activityAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              activity:
                  createDefaultActivityResponse(
                    id: 'activity-4',
                    userId: 'luke_skywalker',
                  ).copyWith(
                    type: 'post', // Matches first condition
                    filterTags: ['general'], // Doesn't match second condition
                  ),
            ),
          );

          expect(tester.feedState.activities, hasLength(4));
        },
      );

      feedTest(
        'No filter - filtering is disabled when no filter specified',
        build: (client) => client.feedFromQuery(
          const FeedQuery(
            fid: feedId,
            // No activityFilter - all activities should be accepted
          ),
        ),
        setUp: (tester) => tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: initialActivities,
            pinnedActivities: initialPinnedActivities,
          ),
        ),
        body: (tester) async {
          // Verify the feed has no filter
          expect(tester.feed.query.activityFilter, isNull);
          expect(tester.feedState.activities, hasLength(3));

          // Send ActivityAddedEvent that matches only one condition
          await tester.emitEvent(
            ActivityAddedEvent(
              type: EventTypes.activityAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              activity: createDefaultActivityResponse(
                id: 'activity-4',
                userId: 'luke_skywalker',
                // Doesn't match 'post' activity type
              ).copyWith(type: 'post'),
            ),
          );

          expect(tester.feedState.activities, hasLength(4));
        },
      );
    });
  });

  // ==========================================================================
  // Feed - Bookmarks
  // ==========================================================================

  group('Feed - Bookmarks', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const userId = 'luke_skywalker';

    feedTest(
      'addBookmark() - should add bookmark to activity via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addBookmark(
            activityId: 'activity-1',
            addBookmarkRequest: const AddBookmarkRequest(),
          ),
          result: createDefaultAddBookmarkResponse(
            userId: userId,
            activityId: 'activity-1',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<BookmarkAdded>()),
        );

        // Add bookmark
        final result = await tester.feed.addBookmark(activityId: 'activity-1');

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, 'activity-1');
        expect(bookmark.user.id, userId);

        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addBookmark(
          activityId: 'activity-1',
          addBookmarkRequest: const AddBookmarkRequest(),
        ),
      ),
    );

    feedTest(
      'updateBookmark() - should update bookmark via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: 'activity-1',
                  folderId: 'folder-id',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.updateBookmark(
            activityId: 'activity-1',
            updateBookmarkRequest: const UpdateBookmarkRequest(folderId: 'new-folder-id'),
          ),
          result: createDefaultUpdateBookmarkResponse(
            userId: userId,
            activityId: 'activity-1',
            folderId: 'new-folder-id',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<BookmarkUpdated>()),
        );

        final result = await tester.feed.updateBookmark(
          activityId: 'activity-1',
          request: const UpdateBookmarkRequest(folderId: 'new-folder-id'),
        );

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, 'activity-1');
        expect(bookmark.folder?.id, 'new-folder-id');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateBookmark(
          activityId: 'activity-1',
          updateBookmarkRequest: const UpdateBookmarkRequest(folderId: 'new-folder-id'),
        ),
      ),
    );

    feedTest(
      'deleteBookmark() - should delete bookmark via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteBookmark(
            activityId: 'activity-1',
            folderId: null,
          ),
          result: createDefaultDeleteBookmarkResponse(
            userId: userId,
            activityId: 'activity-1',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<BookmarkDeleted>()),
        );

        // Delete bookmark
        final result = await tester.feed.deleteBookmark(
          activityId: 'activity-1',
        );

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, 'activity-1');
        expect(bookmark.user.id, userId);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteBookmark(
          activityId: 'activity-1',
          folderId: null,
        ),
      ),
    );

    // Bookmark Events

    feedTest(
      'BookmarkAddedEvent - should add bookmark and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no bookmarks
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownBookmarks, isEmpty);

        // Emit BookmarkAddedEvent
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
        expect(updatedActivity.ownBookmarks.first.user.id, userId);
        expect(updatedActivity.ownBookmarks.first.activity.id, 'activity-1');
      },
    );

    feedTest(
      'BookmarkAddedEvent - should not update activity if activity ID does not match',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no bookmarks
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownBookmarks, isEmpty);

        // Emit BookmarkAddedEvent for different activity
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: 'different-activity-id',
            ),
          ),
        );

        // Verify state was not updated
        final activity = tester.feedState.activities.first;
        expect(activity.ownBookmarks, isEmpty);
      },
    );

    feedTest(
      'BookmarkUpdatedEvent - should update bookmark and activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: 'activity-1',
                  folderId: 'folder-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark in folder-1
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownBookmarks, hasLength(1));
        expect(initialActivity.ownBookmarks.first.folder?.id, 'folder-1');
        expect(initialActivity.ownBookmarks.first.custom, isEmpty);

        // Emit BookmarkUpdatedEvent with updated folder
        await tester.emitEvent(
          BookmarkUpdatedEvent(
            type: EventTypes.bookmarkUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: 'activity-1',
              folderId: 'folder-2',
            ).copyWith(custom: const {'updated': true}),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
        expect(updatedActivity.ownBookmarks.first.folder?.id, 'folder-2');
        expect(updatedActivity.ownBookmarks.first.custom, isNotEmpty);
        expect(updatedActivity.ownBookmarks.first.custom?['updated'], true);
      },
    );

    feedTest(
      'BookmarkDeletedEvent - should delete bookmark and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownBookmarks, hasLength(1));

        // Emit BookmarkDeletedEvent
        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, isEmpty);
      },
    );
  });

  // ==========================================================================
  // Feed - Comments
  // ==========================================================================

  group('Feed - Comments', () {
    const currentUser = User(id: 'test_user');
    const feedId = FeedId(group: 'user', id: 'john');
    const commentId = 'comment-1';

    feedTest(
      'getComment() - should fetch comment by ID',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.getComment(id: commentId),
          result: GetCommentResponse(
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<CommentUpdated>()),
        );

        final result = await tester.feed.getComment(commentId: commentId);

        expect(result.isSuccess, isTrue);
        final comment = result.getOrThrow();
        expect(comment.id, commentId);
        expect(comment.objectId, 'activity-1');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi((api) => api.getComment(id: commentId)),
    );

    feedTest(
      'addComment() - should add comment to activity',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addComment(
            addCommentRequest: const AddCommentRequest(
              comment: 'Test comment',
              objectId: 'activity-1',
              objectType: 'activity',
            ),
          ),
          result: AddCommentResponse(
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              userId: currentUser.id,
            ),
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<CommentAdded>()),
        );

        final result = await tester.feed.addComment(
          request: const ActivityAddCommentRequest(
            activityId: 'activity-1',
            activityType: 'activity',
            comment: 'Test comment',
          ),
        );

        expect(result.isSuccess, isTrue);
        final comment = result.getOrThrow();
        expect(comment.id, commentId);
        expect(comment.objectId, 'activity-1');
        expect(comment.user.id, currentUser.id);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addComment(
          addCommentRequest: const AddCommentRequest(
            comment: 'Test comment',
            objectId: 'activity-1',
            objectType: 'activity',
          ),
        ),
      ),
    );

    feedTest(
      'updateComment() - should update comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        const updatedText = 'Updated comment text';

        tester.mockApi(
          (api) => api.updateComment(
            id: commentId,
            updateCommentRequest: const UpdateCommentRequest(comment: 'Updated comment text'),
          ),
          result: UpdateCommentResponse(
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              text: updatedText,
            ),
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<CommentUpdated>()),
        );

        final result = await tester.feed.updateComment(
          commentId: commentId,
          request: const UpdateCommentRequest(comment: updatedText),
        );

        expect(result.isSuccess, isTrue);
        final comment = result.getOrThrow();
        expect(comment.id, commentId);
        expect(comment.text, updatedText);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateComment(
          id: commentId,
          updateCommentRequest: const UpdateCommentRequest(comment: 'Updated comment text'),
        ),
      ),
    );

    feedTest(
      'deleteComment() - should delete comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteComment(
            id: commentId,
            hardDelete: null,
          ),
          result: DeleteCommentResponse(
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
            duration: '0ms',
          ),
        );

        final expectEventsEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emitsInOrder([isA<CommentDeleted>(), isA<ActivityUpdated>()]),
        );

        final result = await tester.feed.deleteComment(commentId: commentId);

        expect(result.isSuccess, isTrue);

        // Verify the event is emitted
        await expectEventsEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteComment(
          id: commentId,
          hardDelete: null,
        ),
      ),
    );

    feedTest(
      'deleteComment() - should pass deleteNotificationActivity to API',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteComment(
            id: commentId,
            hardDelete: null,
            deleteNotificationActivity: true,
          ),
          result: DeleteCommentResponse(
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
            duration: '0ms',
          ),
        );

        final result = await tester.feed.deleteComment(
          commentId: commentId,
          deleteNotificationActivity: true,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteComment(
          id: commentId,
          hardDelete: null,
          deleteNotificationActivity: true,
        ),
      ),
    );

    feedTest(
      'addCommentReaction() - should add reaction to comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addCommentReaction(
            id: commentId,
            addCommentReactionRequest: const AddCommentReactionRequest(type: 'like'),
          ),
          result: createDefaultAddCommentReactionResponse(
            commentId: commentId,
            objectId: 'activity-1',
            userId: currentUser.id,
            reactionType: 'like',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<CommentReactionUpserted>()),
        );

        final result = await tester.feed.addCommentReaction(
          commentId: commentId,
          request: const AddCommentReactionRequest(type: 'like'),
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.type, 'like');
        expect(reaction.user.id, currentUser.id);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addCommentReaction(
          id: commentId,
          addCommentReactionRequest: const AddCommentReactionRequest(type: 'like'),
        ),
      ),
    );

    feedTest(
      'deleteCommentReaction() - should delete reaction from comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteCommentReaction(id: commentId, type: 'like'),
          result: createDefaultDeleteCommentReactionResponse(
            commentId: commentId,
            objectId: 'activity-1',
            userId: currentUser.id,
            reactionType: 'like',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<CommentReactionDeleted>()),
        );

        final result = await tester.feed.deleteCommentReaction(
          commentId: commentId,
          type: 'like',
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.type, 'like');
        expect(reaction.user.id, currentUser.id);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteCommentReaction(id: commentId, type: 'like'),
      ),
    );

    feedTest(
      'deleteCommentReaction() - should pass deleteNotificationActivity to API',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteCommentReaction(
            id: commentId,
            type: 'like',
            deleteNotificationActivity: true,
          ),
          result: createDefaultDeleteCommentReactionResponse(
            commentId: commentId,
            objectId: 'activity-1',
            userId: currentUser.id,
            reactionType: 'like',
          ),
        );

        final result = await tester.feed.deleteCommentReaction(
          commentId: commentId,
          type: 'like',
          deleteNotificationActivity: true,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteCommentReaction(
          id: commentId,
          type: 'like',
          deleteNotificationActivity: true,
        ),
      ),
    );

    feedTest(
      'CommentAddedEvent - should add comment to activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no comments
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, isEmpty);

        // Emit CommentAddedEvent
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              text: 'Test comment',
            ),
          ),
        );

        // Verify comment was added
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.id, commentId);
        expect(updatedActivity.comments.first.text, 'Test comment');
      },
    );

    feedTest(
      'CommentUpdatedEvent - should update comment in activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              comments: [
                createDefaultCommentResponse(
                  id: commentId,
                  objectId: 'activity-1',
                  text: 'Original comment',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.text, 'Original comment');

        // Emit CommentUpdatedEvent
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              text: 'Updated comment',
            ),
          ),
        );

        // Verify comment was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.id, commentId);
        expect(updatedActivity.comments.first.text, 'Updated comment');
      },
    );

    feedTest(
      'CommentDeletedEvent - should remove comment from activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              comments: [
                createDefaultCommentResponse(
                  id: commentId,
                  objectId: 'activity-1',
                  text: 'Test comment',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, hasLength(1));

        // Emit CommentDeletedEvent
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
          ),
        );

        // Verify comment was removed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, isEmpty);
      },
    );

    feedTest(
      'CommentReactionAddedEvent - should add reaction to comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              comments: [
                createDefaultCommentResponse(
                  id: commentId,
                  objectId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has no reactions
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, isEmpty);

        // Emit CommentReactionAddedEvent
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: currentUser.id,
              commentId: commentId,
            ),
          ),
        );

        // Verify reaction was added
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions.first.type, 'love');
      },
    );

    feedTest(
      'CommentReactionUpdatedEvent - should replace user reaction on comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              comments: [
                createDefaultCommentResponse(
                  id: commentId,
                  objectId: 'activity-1',
                  ownReactions: [
                    createDefaultReactionResponse(
                      reactionType: 'wow',
                      userId: currentUser.id,
                      commentId: commentId,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has 'wow' reaction
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, hasLength(1));
        expect(initialActivity.comments.first.ownReactions.first.type, 'wow');

        // Emit CommentReactionUpdatedEvent - replaces 'wow' with 'fire'
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'fire',
                  userId: currentUser.id,
                  commentId: commentId,
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'fire',
              userId: currentUser.id,
              commentId: commentId,
            ),
          ),
        );

        // Verify 'wow' was replaced with 'fire'
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions.first.type, 'fire');
      },
    );

    feedTest(
      'CommentReactionDeletedEvent - should remove reaction from comment',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              comments: [
                createDefaultCommentResponse(
                  id: commentId,
                  objectId: 'activity-1',
                  ownReactions: [
                    createDefaultReactionResponse(
                      reactionType: 'love',
                      userId: currentUser.id,
                      commentId: commentId,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has 'love' reaction
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, hasLength(1));
        expect(initialActivity.comments.first.ownReactions.first.type, 'love');

        // Emit CommentReactionDeletedEvent
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: currentUser.id,
              commentId: commentId,
            ),
          ),
        );

        // Verify reaction was removed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions, isEmpty);
      },
    );
  });

  // ==========================================================================
  // Feed - Members
  // ==========================================================================

  group('Feed - Members', () {
    const currentUser = User(id: 'test_user');
    const feedId = FeedId(group: 'team', id: 'developers');

    feedTest(
      'queryFeedMembers() - should query initial members',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.queryFeedMembers(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            queryFeedMembersRequest: const QueryFeedMembersRequest(),
          ),
          result: createDefaultQueryFeedMembersResponse(
            members: [createDefaultFeedMemberResponse(id: currentUser.id)],
          ),
        );

        final result = await tester.feed.queryFeedMembers();

        expect(result.isSuccess, isTrue);
        final members = result.getOrThrow();
        expect(members, hasLength(1));
        expect(members.first.id, currentUser.id);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.queryFeedMembers(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          queryFeedMembersRequest: const QueryFeedMembersRequest(),
        ),
      ),
    );

    feedTest(
      'queryMoreFeedMembers() - should load more members',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        // Mock initial query
        tester.mockApi(
          (api) => api.queryFeedMembers(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            queryFeedMembersRequest: const QueryFeedMembersRequest(),
          ),
          result: createDefaultQueryFeedMembersResponse(
            next: 'next-cursor',
            members: [createDefaultFeedMemberResponse(id: currentUser.id)],
          ),
        );

        // Load initial members
        await tester.feed.queryFeedMembers();

        // Initial state - has comment
        expect(tester.feedState.members, hasLength(1));
        expect(tester.feedState.canLoadMoreMembers, isTrue);

        // Mock queryMore
        tester.mockApi(
          (api) => api.queryFeedMembers(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            queryFeedMembersRequest: const QueryFeedMembersRequest(next: 'next-cursor'),
          ),
          result: createDefaultQueryFeedMembersResponse(
            prev: 'prev-cursor',
            members: [createDefaultFeedMemberResponse(id: 'user-2')],
          ),
        );

        final result = await tester.feed.queryMoreFeedMembers();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, hasLength(1));

        // Verify state was updated
        expect(tester.feedState.members, hasLength(2));
        expect(tester.feedState.canLoadMoreMembers, isFalse);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.queryFeedMembers(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          queryFeedMembersRequest: const QueryFeedMembersRequest(next: 'next-cursor'),
        ),
      ),
    );

    feedTest(
      'updateFeedMembers() - should update feed members',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.updateFeedMembers(
            feedGroupId: feedId.group,
            feedId: feedId.id,
            updateFeedMembersRequest: const UpdateFeedMembersRequest(
              operation: UpdateFeedMembersRequestOperation.upsert,
              members: [FeedMemberRequest(userId: 'user-new', role: 'member')],
            ),
          ),
          result: UpdateFeedMembersResponse(
            added: [createDefaultFeedMemberResponse(id: 'user-new')],
            updated: const [],
            removedIds: const [],
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FeedMemberBatchUpdate>()),
        );

        final result = await tester.feed.updateFeedMembers(
          request: const UpdateFeedMembersRequest(
            operation: UpdateFeedMembersRequestOperation.upsert,
            members: [FeedMemberRequest(userId: 'user-new', role: 'member')],
          ),
        );

        expect(result.isSuccess, isTrue);
        final updates = result.getOrThrow();
        expect(updates.added, hasLength(1));
        expect(updates.added.first.user.id, 'user-new');

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateFeedMembers(
          feedGroupId: feedId.group,
          feedId: feedId.id,
          updateFeedMembersRequest: const UpdateFeedMembersRequest(
            operation: UpdateFeedMembersRequestOperation.upsert,
            members: [FeedMemberRequest(userId: 'user-new', role: 'member')],
          ),
        ),
      ),
    );

    feedTest(
      'acceptFeedMember() - should accept member invitation',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.acceptFeedMemberInvite(
            feedGroupId: feedId.group,
            feedId: feedId.id,
          ),
          result: AcceptFeedMemberInviteResponse(
            member: createDefaultFeedMemberResponse(
              id: currentUser.id,
              status: FeedMemberResponseStatus.member,
            ),
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FeedMemberUpdated>()),
        );

        final result = await tester.feed.acceptFeedMember();

        expect(result.isSuccess, isTrue);
        final member = result.getOrThrow();
        expect(member.user.id, currentUser.id);
        expect(member.status, FeedMemberStatus.member);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.acceptFeedMemberInvite(
          feedGroupId: feedId.group,
          feedId: feedId.id,
        ),
      ),
    );

    feedTest(
      'rejectFeedMember() - should reject member invitation',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.rejectFeedMemberInvite(
            feedGroupId: feedId.group,
            feedId: feedId.id,
          ),
          result: RejectFeedMemberInviteResponse(
            member: createDefaultFeedMemberResponse(
              id: currentUser.id,
              status: FeedMemberResponseStatus.rejected,
            ),
            duration: '0ms',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FeedMemberUpdated>()),
        );

        final result = await tester.feed.rejectFeedMember();

        expect(result.isSuccess, isTrue);
        final member = result.getOrThrow();
        expect(member.user.id, currentUser.id);
        expect(member.status, FeedMemberStatus.rejected);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.rejectFeedMemberInvite(
          feedGroupId: feedId.group,
          feedId: feedId.id,
        ),
      ),
    );
  });

  // ==========================================================================
  // Feed - Follows
  // ==========================================================================

  group('Feed - Follows', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const targetFeedId = FeedId(group: 'group', id: 'target');

    feedTest(
      'queryFollowSuggestions() - should return list of FeedSuggestionData',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        tester.mockApi(
          (api) => api.getFollowSuggestions(
            feedGroupId: feedId.group,
            limit: 10,
          ),
          result: createDefaultGetFollowSuggestionsResponse(
            suggestions: [
              createDefaultFeedSuggestionResponse(
                id: 'suggestion-1',
                reason: 'Based on your interests',
                recommendationScore: 0.95,
                algorithmScores: {'relevance': 0.9, 'popularity': 0.85},
              ),
              createDefaultFeedSuggestionResponse(
                id: 'suggestion-2',
                reason: 'Popular in your network',
                recommendationScore: 0.88,
              ),
            ],
          ),
        );

        final result = await tester.feed.queryFollowSuggestions(limit: 10);

        expect(result, isA<Result<List<FeedSuggestionData>>>());

        final suggestions = result.getOrThrow();
        expect(suggestions.length, 2);

        final firstSuggestion = suggestions[0];
        expect(firstSuggestion.feed.id, 'suggestion-1');
        expect(firstSuggestion.reason, 'Based on your interests');
        expect(firstSuggestion.recommendationScore, 0.95);
        expect(firstSuggestion.algorithmScores, isNotNull);
        expect(firstSuggestion.algorithmScores!['relevance'], 0.9);
        expect(firstSuggestion.algorithmScores!['popularity'], 0.85);

        final secondSuggestion = suggestions[1];
        expect(secondSuggestion.feed.id, 'suggestion-2');
        expect(secondSuggestion.reason, 'Popular in your network');
        expect(secondSuggestion.recommendationScore, 0.88);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.getFollowSuggestions(
          feedGroupId: feedId.group,
          limit: 10,
        ),
      ),
    );

    feedTest(
      'follow() - should create follow relationship',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        tester.mockApi(
          (api) => api.follow(
            followRequest: const FollowRequest(source: 'user:john', target: 'group:target'),
          ),
          result: SingleFollowResponse(
            duration: '0ms',
            follow: FollowResponse(
              createdAt: DateTime(2021, 1, 1),
              custom: const {},
              followerRole: 'follower',
              pushPreference: FollowResponsePushPreference.all,
              sourceFeed: createDefaultFeedResponse(
                id: feedId.id,
                groupId: feedId.group,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
              ),
              updatedAt: DateTime(2021, 1, 1),
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowAdded>()),
        );

        final result = await tester.feed.follow(targetFid: targetFeedId);

        expect(result, isA<Result<FollowData>>());

        final followData = result.getOrThrow();
        expect(followData.sourceFeed.fid.rawValue, feedId.rawValue);
        expect(followData.targetFeed.fid.rawValue, targetFeedId.rawValue);
        expect(followData.status, FollowStatus.accepted);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.follow(
          followRequest: const FollowRequest(source: 'user:john', target: 'group:target'),
        ),
      ),
    );

    feedTest(
      'unfollow() - should remove follow relationship',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        tester.mockApi(
          (api) => api.unfollow(
            source: 'user:john',
            target: 'group:target',
          ),
          result: UnfollowResponse(
            duration: '0ms',
            follow: FollowResponse(
              createdAt: DateTime(2021, 1, 1),
              custom: const {},
              followerRole: 'follower',
              pushPreference: FollowResponsePushPreference.all,
              sourceFeed: createDefaultFeedResponse(
                id: feedId.id,
                groupId: feedId.group,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
              ),
              updatedAt: DateTime(2021, 1, 1),
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowDeleted>()),
        );

        final result = await tester.feed.unfollow(targetFid: targetFeedId);

        expect(result, isA<Result<void>>());
        expect(result.isSuccess, isTrue);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.unfollow(
          source: 'user:john',
          target: 'group:target',
        ),
      ),
    );

    feedTest(
      'acceptFollow() - should accept follow request',
      build: (client) => client.feedFromId(targetFeedId),
      body: (tester) async {
        const sourceFeedId = FeedId(group: 'user', id: 'source');
        tester.mockApi(
          (api) => api.acceptFollow(
            acceptFollowRequest: const AcceptFollowRequest(
              source: 'user:source',
              target: 'group:target',
            ),
          ),
          result: AcceptFollowResponse(
            duration: '0ms',
            follow: FollowResponse(
              createdAt: DateTime(2021, 1, 1),
              custom: const {},
              followerRole: 'follower',
              pushPreference: FollowResponsePushPreference.all,
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
              ),
              updatedAt: DateTime(2021, 1, 1),
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowAdded>()),
        );

        final result = await tester.feed.acceptFollow(sourceFid: sourceFeedId);

        expect(result, isA<Result<FollowData>>());

        final followData = result.getOrThrow();
        expect(followData.sourceFeed.fid.rawValue, sourceFeedId.rawValue);
        expect(followData.targetFeed.fid.rawValue, targetFeedId.rawValue);
        expect(followData.status, FollowStatus.accepted);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.acceptFollow(
          acceptFollowRequest: const AcceptFollowRequest(
            source: 'user:source',
            target: 'group:target',
          ),
        ),
      ),
    );

    feedTest(
      'rejectFollow() - should reject follow request',
      build: (client) => client.feedFromId(targetFeedId),
      body: (tester) async {
        const sourceFeedId = FeedId(group: 'user', id: 'source');
        tester.mockApi(
          (api) => api.rejectFollow(
            rejectFollowRequest: const RejectFollowRequest(
              source: 'user:source',
              target: 'group:target',
            ),
          ),
          result: RejectFollowResponse(
            duration: '0ms',
            follow: FollowResponse(
              createdAt: DateTime(2021, 1, 1),
              custom: const {},
              followerRole: 'follower',
              pushPreference: FollowResponsePushPreference.all,
              sourceFeed: createDefaultFeedResponse(
                id: sourceFeedId.id,
                groupId: sourceFeedId.group,
              ),
              status: FollowResponseStatus.rejected,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
              ),
              updatedAt: DateTime(2021, 1, 1),
            ),
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowDeleted>()),
        );

        final result = await tester.feed.rejectFollow(sourceFid: sourceFeedId);

        expect(result, isA<Result<FollowData>>());

        final followData = result.getOrThrow();
        expect(followData.sourceFeed.fid.rawValue, sourceFeedId.rawValue);
        expect(followData.targetFeed.fid.rawValue, targetFeedId.rawValue);
        expect(followData.status, FollowStatus.rejected);

        // Verify the event is emitted
        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.rejectFollow(
          rejectFollowRequest: const RejectFollowRequest(
            source: 'user:source',
            target: 'group:target',
          ),
        ),
      ),
    );

    // Follow Events

    feedTest(
      'FollowCreatedEvent - follow target feed should update follower count',
      build: (client) => client.feedFromId(targetFeedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 0);

        await tester.emitEvent(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: targetFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
              sourceFeed: createDefaultFeedResponse(
                id: 'john',
                groupId: 'user',
                followingCount: 1,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 1,
              ),
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 0);
      },
    );

    feedTest(
      'FollowCreatedEvent - follow source feed should update following count',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 0);

        await tester.emitEvent(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
              sourceFeed: createDefaultFeedResponse(
                id: 'john',
                groupId: 'user',
                followingCount: 1,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 1,
              ),
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 1);
      },
    );

    feedTest(
      'FollowDeletedEvent - follow deleted target feed should update follower count',
      build: (client) => client.feedFromId(targetFeedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          feed: createDefaultFeedResponse(
            id: targetFeedId.id,
            groupId: targetFeedId.group,
            followerCount: 1,
            followingCount: 1,
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 1);

        await tester.emitEvent(
          FollowDeletedEvent(
            type: EventTypes.followDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: targetFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
              sourceFeed: createDefaultFeedResponse(
                id: 'john',
                groupId: 'user',
                followingCount: 0,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 0,
              ),
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 1);
      },
    );

    feedTest(
      'FollowDeletedEvent - follow deleted source feed should update following count',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          feed: createDefaultFeedResponse(
            id: 'john',
            groupId: 'user',
            followerCount: 1,
            followingCount: 1,
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 1);

        await tester.emitEvent(
          FollowDeletedEvent(
            type: EventTypes.followDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
              sourceFeed: createDefaultFeedResponse(
                id: 'john',
                groupId: 'user',
                followingCount: 0,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: targetFeedId.id,
                groupId: targetFeedId.group,
                followerCount: 0,
              ),
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 0);
      },
    );

    feedTest(
      'FollowUpdatedEvent - should update follow relationship',
      build: (client) => client.feedFromQuery(const FeedQuery(fid: feedId, followerLimit: 10)),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          feed: createDefaultFeedResponse(
            id: feedId.id,
            groupId: feedId.group,
            followerCount: 1,
            followingCount: 0,
          ),
          followers: [
            createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: feedId.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.followers, hasLength(1));
        final initialFollow = tester.feedState.followers.first;
        expect(initialFollow.custom, isEmpty);

        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            follow: FollowResponse(
              createdAt: initialFollow.createdAt,
              custom: const {'updated': true},
              followerRole: initialFollow.followerRole,
              pushPreference: FollowResponsePushPreference.fromJson(
                initialFollow.pushPreference,
              ),
              requestAcceptedAt: initialFollow.requestAcceptedAt,
              requestRejectedAt: initialFollow.requestRejectedAt,
              sourceFeed: createDefaultFeedResponse(
                id: initialFollow.sourceFeed.id,
                groupId: initialFollow.sourceFeed.groupId,
              ),
              status: FollowResponseStatus.accepted,
              targetFeed: createDefaultFeedResponse(
                id: initialFollow.targetFeed.id,
                groupId: initialFollow.targetFeed.groupId,
              ),
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.followers, hasLength(1));
        final updatedFollow = tester.feedState.followers.first;
        expect(updatedFollow.custom, isNotEmpty);
        expect(updatedFollow.custom?['updated'], true);
      },
    );
  });

  // ==========================================================================
  // Feed - Reactions
  // ==========================================================================

  group('Feed - Reactions', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const userId = 'luke_skywalker';

    feedTest(
      'addActivityReaction() - should add reaction to activity via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addActivityReaction(
            activityId: 'activity-1',
            addReactionRequest: const AddReactionRequest(type: 'heart'),
          ),
          result: createDefaultAddReactionResponse(
            activityId: 'activity-1',
            userId: userId,
            reactionType: 'heart',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityReactionUpserted>()),
        );

        // Add reaction
        final result = await tester.feed.addActivityReaction(
          activityId: 'activity-1',
          request: const AddReactionRequest(type: 'heart'),
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.activityId, 'activity-1');
        expect(reaction.type, 'heart');
        expect(reaction.user.id, userId);

        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivityReaction(
          activityId: 'activity-1',
          addReactionRequest: const AddReactionRequest(type: 'heart'),
        ),
      ),
    );

    feedTest(
      'ActivityReactionAddedEvent - should handle event and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no reactions
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, isEmpty);

        // Emit ActivityReactionAddedEvent
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'heart',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownReactions, hasLength(1));
        expect(updatedActivity.ownReactions.first.type, 'heart');
        expect(updatedActivity.ownReactions.first.user.id, userId);
        expect(updatedActivity.reactionGroups['heart']?.count ?? 0, 1);
      },
    );

    feedTest(
      'ActivityReactionUpdatedEvent - should replace user reaction',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one heart reaction
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, hasLength(1));
        expect(initialActivity.ownReactions.first.type, 'heart');
        expect(initialActivity.reactionCount, 1);

        // Emit ActivityReactionUpdatedEvent - replaces existing 'heart' with 'fire'
        await tester.emitEvent(
          ActivityReactionUpdatedEvent(
            type: EventTypes.activityReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'fire',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'fire',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        // "Own" data: user now has 'fire' reaction instead of 'heart'
        expect(updatedActivity.ownReactions, hasLength(1));
        expect(updatedActivity.ownReactions.first.type, 'fire');
        // Aggregate counts: still 1 reaction total (replaced, not added)
        expect(updatedActivity.reactionCount, 1);
        expect(updatedActivity.reactionGroups['fire']?.count ?? 0, 1);
        expect(updatedActivity.reactionGroups['heart']?.count ?? 0, 0);
      },
    );

    feedTest(
      'deleteActivityReaction() - should delete reaction via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteActivityReaction(
            activityId: 'activity-1',
            type: 'heart',
          ),
          result: createDefaultDeleteReactionResponse(
            activityId: 'activity-1',
            userId: userId,
            reactionType: 'heart',
          ),
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<ActivityReactionDeleted>()),
        );

        // Delete reaction
        final result = await tester.feed.deleteActivityReaction(
          activityId: 'activity-1',
          type: 'heart',
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.activityId, 'activity-1');
        expect(reaction.type, 'heart');
        expect(reaction.user.id, userId);

        await expectEventEmitted;
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteActivityReaction(activityId: 'activity-1', type: 'heart'),
      ),
    );

    feedTest(
      'deleteActivityReaction() - should pass deleteNotificationActivity to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.deleteActivityReaction(
            activityId: 'activity-1',
            type: 'heart',
            deleteNotificationActivity: true,
          ),
          result: createDefaultDeleteReactionResponse(
            activityId: 'activity-1',
            userId: userId,
            reactionType: 'heart',
          ),
        );

        final result = await tester.feed.deleteActivityReaction(
          activityId: 'activity-1',
          type: 'heart',
          deleteNotificationActivity: true,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteActivityReaction(
          activityId: 'activity-1',
          type: 'heart',
          deleteNotificationActivity: true,
        ),
      ),
    );

    feedTest(
      'ActivityReactionDeletedEvent - should handle event and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, hasLength(1));

        // Emit ActivityReactionDeletedEvent
        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
            ).copyWith(reactionGroups: const {}),
            reaction: createDefaultReactionResponse(
              reactionType: 'heart',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownReactions, isEmpty);
      },
    );

    feedTest(
      'should handle multiple reaction types (heart and fire) on same activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no reactions
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, isEmpty);
        expect(initialActivity.reactionGroups, isEmpty);

        // Add heart reaction via event
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'heart',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        final activityAfterHeart = tester.feedState.activities.first;
        expect(
          activityAfterHeart.ownReactions.any((r) => r.type == 'heart'),
          isTrue,
        );
        expect(activityAfterHeart.reactionGroups['heart']?.count ?? 0, 1);

        // Add fire reaction via event (should coexist with heart)
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1').copyWith(
              reactionGroups: {
                'heart': FeedsReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
                'fire': FeedsReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'fire',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        final activityAfterFire = tester.feedState.activities.first;
        expect(
          activityAfterFire.ownReactions.any((r) => r.type == 'heart'),
          isTrue,
        );
        expect(
          activityAfterFire.ownReactions.any((r) => r.type == 'fire'),
          isTrue,
        );
        expect(activityAfterFire.reactionGroups['heart']?.count ?? 0, 1);
        expect(activityAfterFire.reactionGroups['fire']?.count ?? 0, 1);
      },
    );

    feedTest(
      'should handle removing one reaction type while keeping another',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'heart',
                  userId: userId,
                  activityId: 'activity-1',
                ),
                createDefaultReactionResponse(
                  reactionType: 'fire',
                  userId: userId,
                  activityId: 'activity-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has both reactions
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions.length, 2);
        expect(initialActivity.reactionGroups['heart']?.count ?? 0, 1);
        expect(initialActivity.reactionGroups['fire']?.count ?? 0, 1);

        // Delete heart reaction via event
        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: 'activity-1').copyWith(
              reactionGroups: {
                'fire': FeedsReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'heart',
              userId: userId,
              activityId: 'activity-1',
            ),
          ),
        );

        final activityAfterDelete = tester.feedState.activities.first;
        expect(activityAfterDelete.ownReactions.length, 1);
        expect(activityAfterDelete.ownReactions.first.type, 'fire');
        expect(activityAfterDelete.reactionGroups['heart']?.count ?? 0, 0);
        expect(activityAfterDelete.reactionGroups['fire']?.count ?? 0, 1);
      },
    );
  });

  // ==========================================================================
  // Feed - Polls
  // ==========================================================================

  group('Feed - Polls', () {
    const pollId = 'poll-1';
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'createPoll() - should create poll and add activity',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        tester.mockApi(
          (api) => api.createPoll(
            createPollRequest: const CreatePollRequest(name: 'Test Poll'),
          ),
          result: PollResponse(
            duration: '0ms',
            poll: createDefaultPollResponse(id: pollId),
          ),
        );

        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'poll',
              feeds: ['user:john'],
              pollId: 'poll-1',
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              poll: createDefaultPollResponse(id: pollId),
            ),
          ),
        );

        final result = await tester.feed.createPoll(
          activityType: 'poll',
          request: const CreatePollRequest(name: 'Test Poll'),
        );

        expect(result, isA<Result<ActivityData>>());
        final activity = result.getOrThrow();

        expect(activity.id, 'activity-1');
        expect(activity.poll, isNotNull);
      },
      verify: (tester) {
        tester.verifyApi(
          (api) => api.createPoll(
            createPollRequest: const CreatePollRequest(name: 'Test Poll'),
          ),
        );
        tester.verifyApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'poll',
              feeds: ['user:john'],
              pollId: 'poll-1',
            ),
          ),
        );
      },
    );

    feedTest(
      'PollDeletedFeedEvent - should remove poll from activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(id: pollId),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - activity has poll
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.id, pollId);

        // Emit PollDeletedFeedEvent
        await tester.emitEvent(
          PollDeletedFeedEvent(
            type: EventTypes.pollDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            poll: createDefaultPollResponse(id: pollId),
          ),
        );

        // Verify poll was removed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNull);
      },
    );

    feedTest(
      'PollUpdatedFeedEvent - should update poll in activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(
                id: pollId,
              ).copyWith(name: 'Original poll name'),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - poll has original name
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.name, 'Original poll name');

        // Emit PollUpdatedFeedEvent
        await tester.emitEvent(
          PollUpdatedFeedEvent(
            type: EventTypes.pollUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            poll: createDefaultPollResponse(
              id: pollId,
            ).copyWith(name: 'Updated poll name'),
          ),
        );

        // Verify poll was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.name, 'Updated poll name');
      },
    );

    feedTest(
      'PollClosedFeedEvent - should mark poll as closed',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(id: pollId),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - poll is not closed
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.isClosed, false);

        // Emit PollClosedFeedEvent
        await tester.emitEvent(
          PollClosedFeedEvent(
            type: EventTypes.pollClosed,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            poll: createDefaultPollResponse(
              id: pollId,
            ).copyWith(isClosed: true),
          ),
        );

        // Verify poll is closed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.isClosed, true);
      },
    );

    feedTest(
      'PollVoteCastedFeedEvent - should add vote to poll',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(id: pollId),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no votes
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.voteCount, 0);

        final firstOption = initialActivity.poll!.options.first;

        final newVote = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: pollId,
          optionId: firstOption.id,
        );

        // Emit PollVoteCastedFeedEvent
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pollVote: newVote,
            poll: createDefaultPollResponse(
              id: pollId,
              ownVotesAndAnswers: [newVote],
            ),
          ),
        );

        // Verify vote was added
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.voteCount, 1);
        expect(updatedActivity.poll!.voteCountsByOption[firstOption.id], 1);
      },
    );

    feedTest(
      'PollVoteChangedFeedEvent - should update vote on poll',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(
                id: pollId,
                ownVotesAndAnswers: [
                  createDefaultPollVoteResponse(
                    id: 'vote-1',
                    pollId: pollId,
                    optionId: 'option-1',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has vote on option-1
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.options, hasLength(2));
        expect(initialActivity.poll!.voteCountsByOption['option-1'], 1);

        final changedVote = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: pollId,
          optionId: 'option-2',
        );

        // Emit PollVoteChangedFeedEvent
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pollVote: changedVote,
            poll: createDefaultPollResponse(
              id: pollId,
              ownVotesAndAnswers: [changedVote],
            ),
          ),
        );

        // Verify vote was changed to option-2
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.voteCountsByOption['option-1'], null);
        expect(updatedActivity.poll!.voteCountsByOption['option-2'], 1);
      },
    );

    feedTest(
      'PollVoteRemovedFeedEvent - should remove vote from poll',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(
                id: pollId,
                ownVotesAndAnswers: [
                  createDefaultPollVoteResponse(
                    id: 'vote-1',
                    pollId: pollId,
                    optionId: 'option-1',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one vote
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.voteCount, 1);

        final pollVoteToRemove = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: pollId,
          optionId: 'option-1',
        );

        // Emit PollVoteRemovedFeedEvent
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pollVote: pollVoteToRemove,
            poll: createDefaultPollResponse(id: pollId),
          ),
        );

        // Verify vote was removed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.voteCount, 0);
      },
    );

    feedTest(
      'PollAnswerCastedFeedEvent - should add answer to poll',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(id: pollId),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no answers
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.answersCount, 0);

        final newAnswer = createDefaultPollAnswerResponse(
          id: 'answer-1',
          pollId: pollId,
          answerText: 'My answer text',
        );

        // Emit PollAnswerCastedFeedEvent (resolved from PollVoteCastedFeedEvent)
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pollVote: newAnswer,
            poll: createDefaultPollResponse(
              id: pollId,
              ownVotesAndAnswers: [newAnswer],
            ),
          ),
        );

        // Verify answer was added
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.answersCount, 1);
        expect(updatedActivity.poll!.latestAnswers, hasLength(1));
      },
    );

    feedTest(
      'PollAnswerRemovedFeedEvent - should remove answer from poll',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              poll: createDefaultPollResponse(
                id: pollId,
                ownVotesAndAnswers: [
                  createDefaultPollAnswerResponse(
                    id: 'answer-1',
                    pollId: pollId,
                    answerText: 'My answer text',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one answer
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.answersCount, 1);

        final answerToRemove = createDefaultPollAnswerResponse(
          id: 'answer-1',
          pollId: pollId,
          answerText: 'My answer text',
        );

        // Emit PollAnswerRemovedFeedEvent (resolved from PollVoteRemovedFeedEvent)
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pollVote: answerToRemove,
            poll: createDefaultPollResponse(id: pollId),
          ),
        );

        // Verify answer was removed
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.answersCount, 0);
        expect(updatedActivity.poll!.latestAnswers, isEmpty);
      },
    );
  });

  // ==========================================================================
  // Feed - Stories
  // ==========================================================================

  group('Feed - Stories', () {
    const feedId = FeedId(group: 'stories', id: 'target');
    final initialStories = [
      createDefaultActivityResponse(id: 'storyActivityId1'),
      createDefaultActivityResponse(id: 'storyActivityId2'),
    ];

    feedTest(
      'ActivityMarkEvent - watch story should update isWatched',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          aggregatedActivities: [
            createDefaultAggregatedActivityResponse(
              group: 'group1',
              activities: initialStories,
            ),
          ],
        ),
      ),
      body: (tester) async {
        final userStories = tester.feedState.aggregatedActivities;
        expect(userStories, hasLength(1));

        final firstUserStories = userStories.first.activities;
        expect(firstUserStories, hasLength(2));
        expect(firstUserStories[0].isWatched ?? false, isFalse);
        expect(firstUserStories[1].isWatched ?? false, isFalse);

        await tester.emitEvent(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            markWatched: const ['storyActivityId1'],
          ),
        );

        final updatedAllUserStories = tester.feedState.aggregatedActivities;
        expect(updatedAllUserStories, hasLength(1));

        final updatedFirstUserStories = updatedAllUserStories.first.activities;
        expect(updatedFirstUserStories, hasLength(2));
        expect(updatedFirstUserStories[0].isWatched ?? false, isTrue);
        expect(updatedFirstUserStories[1].isWatched ?? false, isFalse);
      },
    );

    feedTest(
      'queryMoreActivities() - pagination should load more aggregated activities',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          next: 'nextPageToken',
          aggregatedActivities: [
            createDefaultAggregatedActivityResponse(
              group: 'group1',
              activities: initialStories,
            ),
          ],
        ),
      ),
      body: (tester) async {
        final userStories = tester.feedState.aggregatedActivities;
        expect(userStories, hasLength(1));

        final firstUserStories = userStories.first.activities;
        expect(firstUserStories, hasLength(2));

        final nextPageQuery = tester.feed.query.copyWith(
          activityNext: tester.feedState.activitiesPagination?.next,
        );

        tester.mockApi(
          (api) => api.getOrCreateFeed(
            feedId: feedId.id,
            feedGroupId: feedId.group,
            getOrCreateFeedRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultGetOrCreateFeedResponse(
            prevPagination: 'prevPageToken',
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                group: 'group2',
                activities: [
                  createDefaultActivityResponse(id: 'storyActivityId3'),
                ],
              ),
            ],
          ),
        );

        // Fetch more activities
        await tester.feed.queryMoreActivities();

        final updatedUserStories = tester.feedState.aggregatedActivities;
        expect(updatedUserStories, hasLength(2));

        final lastUserStories = updatedUserStories.last.activities;
        expect(lastUserStories, hasLength(1));

        tester.verifyApi(
          (api) => api.getOrCreateFeed(
            feedId: feedId.id,
            feedGroupId: feedId.group,
            getOrCreateFeedRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    feedTest(
      'StoriesFeedUpdatedEvent - should update aggregated activities',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          aggregatedActivities: [
            createDefaultAggregatedActivityResponse(
              group: 'group1',
              activities: initialStories,
            ),
          ],
        ),
      ),
      body: (tester) async {
        final userStories = tester.feedState.aggregatedActivities;
        expect(userStories, hasLength(1));

        final firstUserStories = userStories.first.activities;
        expect(firstUserStories, hasLength(2));

        await tester.emitEvent(
          StoriesFeedUpdatedEvent(
            type: EventTypes.storiesFeedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                group: 'group1',
                activities: [
                  ...initialStories,
                  createDefaultActivityResponse(id: 'storyActivityId3'),
                ],
              ),
            ],
          ),
        );

        final updatedUserStories = tester.feedState.aggregatedActivities;
        expect(updatedUserStories, hasLength(1));

        final updatedFirstUserStories = updatedUserStories.first.activities;
        expect(updatedFirstUserStories, hasLength(3));
      },
    );
  });

  // ==========================================================================
  // Feed - Notifications
  // ==========================================================================

  group('Feed - Notifications', () {
    const feedId = FeedId(group: 'notification', id: 'john');
    final initialAggregatedActivities = [
      createDefaultAggregatedActivityResponse(
        group: 'group1',
        activities: [createDefaultActivityResponse(id: 'notification-1')],
      ),
    ];

    feedTest(
      'NotificationFeedUpdatedEvent - should update notification status and aggregated activities',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          aggregatedActivities: initialAggregatedActivities,
          notificationStatus: const NotificationStatusResponse(
            unseen: 5,
            unread: 10,
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.aggregatedActivities, hasLength(1));
        expect(tester.feedState.notificationStatus?.unseen, 5);
        expect(tester.feedState.notificationStatus?.unread, 10);

        await tester.emitEvent(
          NotificationFeedUpdatedEvent(
            type: EventTypes.notificationFeedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            notificationStatus: const NotificationStatusResponse(
              unseen: 2,
              unread: 3,
            ),
            aggregatedActivities: [
              createDefaultAggregatedActivityResponse(
                group: 'group2',
                activities: [
                  createDefaultActivityResponse(id: 'notification-2'),
                ],
              ),
            ],
          ),
        );

        expect(tester.feedState.aggregatedActivities, hasLength(2));
        final updatedGroup = tester.feedState.aggregatedActivities.firstWhere(
          (a) => a.group == 'group2',
        );
        expect(updatedGroup, isNotNull);
        expect(tester.feedState.notificationStatus?.unseen, 2);
        expect(tester.feedState.notificationStatus?.unread, 3);
      },
    );

    feedTest(
      'ActivityMarkEvent - should mark activity as read',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          aggregatedActivities: initialAggregatedActivities,
          notificationStatus: NotificationStatusResponse(
            unseen: 0,
            unread: 1,
            seenActivities: const [],
            readActivities: const [],
            lastSeenAt: DateTime(2021, 1, 1),
            lastReadAt: DateTime(2021, 1, 1),
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.aggregatedActivities, hasLength(1));
        expect(tester.feedState.notificationStatus?.unread, 1);
        expect(tester.feedState.notificationStatus?.readActivities, isEmpty);

        await tester.emitEvent(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            markRead: const ['notification-1'],
          ),
        );

        // Verify activity was marked as read
        final notificationStatus = tester.feedState.notificationStatus;
        expect(notificationStatus?.unread, 0);
        expect(notificationStatus?.readActivities, contains('notification-1'));
        expect(notificationStatus?.lastReadAt, isNotNull);
      },
    );

    feedTest(
      'ActivityMarkEvent - should mark activity as seen',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          aggregatedActivities: initialAggregatedActivities,
          notificationStatus: NotificationStatusResponse(
            unseen: 1,
            unread: 0,
            seenActivities: const [],
            readActivities: const [],
            lastSeenAt: DateTime(2021, 1, 1),
            lastReadAt: DateTime(2021, 1, 1),
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.aggregatedActivities, hasLength(1));
        expect(tester.feedState.notificationStatus?.unseen, 1);
        expect(tester.feedState.notificationStatus?.seenActivities, isEmpty);

        await tester.emitEvent(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            markSeen: const ['notification-1'],
          ),
        );

        // Verify activity was marked as seen
        final notificationStatus = tester.feedState.notificationStatus;
        expect(notificationStatus?.unseen, 0);
        expect(notificationStatus?.seenActivities, contains('notification-1'));
        expect(notificationStatus?.lastSeenAt, isNotNull);
      },
    );

    feedTest(
      'ActivityMarkEvent - should mark all activities as read',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          aggregatedActivities: [
            createDefaultAggregatedActivityResponse(
              group: 'group1',
              activities: [
                createDefaultActivityResponse(id: 'notification-1'),
                createDefaultActivityResponse(id: 'notification-2'),
                createDefaultActivityResponse(id: 'notification-3'),
              ],
            ),
          ],
          notificationStatus: NotificationStatusResponse(
            unseen: 0,
            unread: 3,
            seenActivities: const [],
            readActivities: const [],
            lastSeenAt: DateTime(2021, 1, 1),
            lastReadAt: DateTime(2021, 1, 1),
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.aggregatedActivities, hasLength(1));
        expect(tester.feedState.notificationStatus?.unread, 3);
        expect(tester.feedState.notificationStatus?.readActivities, isEmpty);

        await tester.emitEvent(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            markAllRead: true,
          ),
        );

        // Verify all activities were marked as read
        final notificationStatus = tester.feedState.notificationStatus;
        expect(notificationStatus?.unread, 0);
        expect(notificationStatus?.lastReadAt, isNotNull);
      },
    );

    feedTest(
      'ActivityMarkEvent - should mark all activities as seen',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          aggregatedActivities: [
            createDefaultAggregatedActivityResponse(
              group: 'group1',
              activities: [
                createDefaultActivityResponse(id: 'notification-1'),
                createDefaultActivityResponse(id: 'notification-2'),
                createDefaultActivityResponse(id: 'notification-3'),
              ],
            ),
          ],
          notificationStatus: NotificationStatusResponse(
            unseen: 3,
            unread: 0,
            seenActivities: const [],
            readActivities: const [],
            lastSeenAt: DateTime(2021, 1, 1),
            lastReadAt: DateTime(2021, 1, 1),
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.aggregatedActivities, hasLength(1));
        expect(tester.feedState.notificationStatus?.unseen, 3);
        expect(tester.feedState.notificationStatus?.seenActivities, isEmpty);

        await tester.emitEvent(
          ActivityMarkEvent(
            type: EventTypes.activityMarked,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            markAllSeen: true,
          ),
        );

        // Verify all activities were marked as seen
        final notificationStatus = tester.feedState.notificationStatus;
        expect(notificationStatus?.unseen, 0);
        expect(notificationStatus?.lastSeenAt, isNotNull);
      },
    );
  });

  // ==========================================================================
  // Feed - OnNewActivity
  // ==========================================================================

  group('Feed - OnNewActivity', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const currentUser = User(id: 'luke_skywalker');
    const otherUser = User(id: 'other_user');

    final initialActivities = [
      createDefaultActivityResponse(id: 'activity-1', userId: currentUser.id),
      createDefaultActivityResponse(id: 'activity-2', userId: currentUser.id),
      createDefaultActivityResponse(id: 'activity-3', userId: otherUser.id),
    ];

    feedTest(
      'defaultOnNewActivity - should add current user activity to start when matching filter',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.equal(
            ActivitiesFilterField.activityType,
            'post',
          ),
        ),
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from current user matching filter
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: currentUser.id,
              type: 'post',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.first.id, 'activity-4');
      },
    );

    feedTest(
      'defaultOnNewActivity - should ignore activity from other user',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.equal(
            ActivitiesFilterField.activityType,
            'post',
          ),
        ),
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from other user
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: otherUser.id,
              type: 'post',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'defaultOnNewActivity - should ignore current user activity that does not match filter',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.equal(
            ActivitiesFilterField.activityType,
            'post',
          ),
        ),
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from current user but doesn't match filter
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: currentUser.id,
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'custom onNewActivity - should add to start',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        const FeedQuery(fid: feedId),
        onNewActivity: (query, activity, currentUserId) {
          // Always add to start
          return InsertionAction.addToStart;
        },
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from other user
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: otherUser.id,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.first.id, 'activity-4');
      },
    );

    feedTest(
      'custom onNewActivity - should add to end',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        const FeedQuery(fid: feedId),
        onNewActivity: (query, activity, currentUserId) {
          // Always add to end
          return InsertionAction.addToEnd;
        },
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from other user
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: otherUser.id,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.last.id, 'activity-4');
      },
    );

    feedTest(
      'custom onNewActivity - should ignore',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        const FeedQuery(fid: feedId),
        onNewActivity: (query, activity, currentUserId) {
          // Always ignore
          return InsertionAction.ignore;
        },
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from current user
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: currentUser.id,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'custom onNewActivity - should use query and activity context',
      user: currentUser,
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.equal(
            ActivitiesFilterField.activityType,
            'post',
          ),
        ),
        onNewActivity: (query, activity, currentUserId) {
          // Add activities from other users that match the filter to the end
          if (activity.user.id != currentUserId) {
            if (activity.matches(query.activityFilter)) {
              return InsertionAction.addToEnd;
            }
          }
          return InsertionAction.ignore;
        },
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send ActivityAddedEvent from other user matching filter
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              userId: otherUser.id,
              type: 'post',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.last.id, 'activity-4');

        // Send ActivityAddedEvent from other user not matching filter
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-5',
              userId: otherUser.id,
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
      },
    );
  });

  group('Feed - comment request field mapping', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const currentUser = User(id: 'user-1');
    const commentId = 'comment-1';

    feedTest(
      'addComment() passes skipEnrichUrl to API',
      user: currentUser,
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addComment(
            addCommentRequest: const AddCommentRequest(
              comment: 'https://getstream.io',
              objectId: 'activity-1',
              objectType: 'activity',
              skipEnrichUrl: true,
            ),
          ),
          result: AddCommentResponse(
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'activity-1',
              userId: currentUser.id,
            ),
            duration: '0ms',
          ),
        );

        final result = await tester.feed.addComment(
          request: const ActivityAddCommentRequest(
            activityId: 'activity-1',
            activityType: 'activity',
            comment: 'https://getstream.io',
            skipEnrichUrl: true,
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addComment(
          addCommentRequest: const AddCommentRequest(
            comment: 'https://getstream.io',
            objectId: 'activity-1',
            objectType: 'activity',
            skipEnrichUrl: true,
          ),
        ),
      ),
    );
  });

  group('Feed - FeedAddActivityRequest field mapping', () {
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'addActivity() passes createNotificationActivity, skipPush, enrichOwnFields to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'post',
              feeds: [],
              createNotificationActivity: true,
              skipPush: true,
              enrichOwnFields: false,
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        final result = await tester.feed.addActivity(
          request: const FeedAddActivityRequest(
            type: 'post',
            createNotificationActivity: true,
            skipPush: true,
            enrichOwnFields: false,
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(
            type: 'post',
            feeds: [],
            createNotificationActivity: true,
            skipPush: true,
            enrichOwnFields: false,
          ),
        ),
      ),
    );

    feedTest(
      'addActivity() passes skipEnrichUrl to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'post',
              feeds: [],
              text: 'check out https://getstream.io',
              skipEnrichUrl: true,
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        final result = await tester.feed.addActivity(
          request: const FeedAddActivityRequest(
            type: 'post',
            text: 'check out https://getstream.io',
            skipEnrichUrl: true,
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(
            type: 'post',
            feeds: [],
            text: 'check out https://getstream.io',
            skipEnrichUrl: true,
          ),
        ),
      ),
    );

    feedTest(
      'addActivity() passes location to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'post',
              feeds: [],
              location: Location(lat: 52, lng: 4),
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        const loc = Location(lat: 52, lng: 4);
        final result = await tester.feed.addActivity(
          request: const FeedAddActivityRequest(type: 'post', location: loc),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(
            type: 'post',
            feeds: [],
            location: Location(lat: 52, lng: 4),
          ),
        ),
      ),
    );

    feedTest(
      'addActivity() passes restrictReplies to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: const AddActivityRequest(
              type: 'post',
              feeds: [],
              restrictReplies: AddActivityRequestRestrictReplies.peopleIFollow,
            ),
          ),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(id: 'activity-1'),
          ),
        );

        final result = await tester.feed.addActivity(
          request: const FeedAddActivityRequest(
            type: 'post',
            restrictReplies: ActivityRestrictReplies.peopleIFollow,
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(
          addActivityRequest: const AddActivityRequest(
            type: 'post',
            feeds: [],
            restrictReplies: AddActivityRequestRestrictReplies.peopleIFollow,
          ),
        ),
      ),
    );

    feedTest(
      'getOrCreate() exposes restrictReplies on activity state',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        await tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: 'activity-1',
                feeds: [feedId.rawValue],
                restrictReplies: ActivityResponseRestrictReplies.nobody,
              ),
            ],
          ),
        );

        final activity = tester.feedState.activities.firstWhere(
          (a) => a.id == 'activity-1',
        );
        expect(activity.restrictReplies, equals(ActivityRestrictReplies.nobody));
      },
    );

    feedTest(
      'getOrCreate() exposes i18n translations on activity state',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        await tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: 'activity-1',
                feeds: [feedId.rawValue],
                i18n: const {'en': 'Hello', 'nl': 'Hallo'},
              ),
            ],
          ),
        );

        final activity = tester.feedState.activities.firstWhere(
          (a) => a.id == 'activity-1',
        );
        expect(activity.i18n, equals({'en': 'Hello', 'nl': 'Hallo'}));
      },
    );

    feedTest(
      'getOrCreate() exposes latestShares on activity state',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        await tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: 'activity-1',
                feeds: [feedId.rawValue],
                latestShares: [
                  createDefaultShareResponse(
                    activityId: 'activity-1',
                    userId: 'sharer-1',
                  ),
                ],
              ),
            ],
          ),
        );

        final activity = tester.feedState.activities.firstWhere(
          (a) => a.id == 'activity-1',
        );
        expect(activity.shareCount, equals(1));
        expect(activity.latestShares, hasLength(1));
        expect(activity.latestShares.single.activityId, equals('activity-1'));
        expect(activity.latestShares.single.user.id, equals('sharer-1'));
      },
    );

    feedTest(
      'getOrCreate() exposes peopleIFollow restrictReplies on activity state',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        await tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: 'activity-1',
                feeds: [feedId.rawValue],
                restrictReplies: ActivityResponseRestrictReplies.peopleIFollow,
              ),
            ],
          ),
        );

        final activity = tester.feedState.activities.firstWhere(
          (a) => a.id == 'activity-1',
        );
        expect(
          activity.restrictReplies,
          equals(ActivityRestrictReplies.peopleIFollow),
        );
      },
    );

    feedTest(
      'getOrCreate() passes an unrecognized restrictReplies through to activity state',
      build: (client) => client.feedFromId(feedId),
      body: (tester) async {
        await tester.getOrCreate(
          modifyResponse: (it) => it.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: 'activity-1',
                feeds: [feedId.rawValue],
                restrictReplies: ActivityResponseRestrictReplies.fromJson(
                  'some_future_value',
                ),
              ),
            ],
          ),
        );

        final activity = tester.feedState.activities.firstWhere(
          (a) => a.id == 'activity-1',
        );
        expect(
          activity.restrictReplies,
          equals(const ActivityRestrictReplies('some_future_value')),
        );
      },
    );

    feedTest(
      'updateActivity() passes restrictReplies to API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        tester.mockApi(
          (api) => api.updateActivity(
            id: 'activity-1',
            updateActivityRequest: const UpdateActivityRequest(
              restrictReplies: UpdateActivityRequestRestrictReplies.nobody,
            ),
          ),
          result: UpdateActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
              restrictReplies: ActivityResponseRestrictReplies.nobody,
            ),
          ),
        );

        final result = await tester.feed.updateActivity(
          id: 'activity-1',
          request: const UpdateActivityRequest(
            restrictReplies: UpdateActivityRequestRestrictReplies.nobody,
          ),
        );

        expect(result.isSuccess, isTrue);
        final activity = result.getOrThrow();
        expect(activity.restrictReplies, equals(ActivityRestrictReplies.nobody));
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateActivity(
          id: 'activity-1',
          updateActivityRequest: const UpdateActivityRequest(
            restrictReplies: UpdateActivityRequestRestrictReplies.nobody,
          ),
        ),
      ),
    );
  });

  group('Attachment uploads', () {
    const feedId = FeedId(group: 'user', id: 'john');

    const uploadResponse = FileUploadResponse(
      duration: '0ms',
      file: 'https://cdn/a',
      thumbUrl: 'https://cdn/a-thumb',
    );

    const refused = StreamApiException(
      message: 'too large',
      statusCode: 413,
      code: StreamErrorCode.payloadTooBig,
    );

    // What the file upload above merges into, once posted.
    const uploadedAttachment = Attachment(
      custom: {},
      type: 'file',
      assetUrl: 'https://cdn/a',
      imageUrl: 'https://cdn/a',
      thumbUrl: 'https://cdn/a-thumb',
    );

    const mergedRequest = AddActivityRequest(
      type: 'post',
      feeds: [],
      attachments: [uploadedAttachment],
    );

    const mergedMixedRequest = AddActivityRequest(
      type: 'post',
      feeds: [],
      attachments: [
        uploadedAttachment,
        Attachment(
          custom: {},
          type: 'image',
          assetUrl: 'https://cdn/img',
          imageUrl: 'https://cdn/img',
        ),
      ],
    );

    const mergedCommentRequest = AddCommentRequest(
      comment: 'Look at this',
      objectId: 'activity-1',
      objectType: 'activity',
      attachments: [uploadedAttachment],
    );

    const mergedCommentsBatchRequest = AddCommentsBatchRequest(
      comments: [
        AddCommentRequest(
          comment: 'with attachment',
          objectId: 'activity-1',
          objectType: 'activity',
          attachments: [uploadedAttachment],
        ),
        AddCommentRequest(
          comment: 'plain',
          objectId: 'activity-1',
          objectType: 'activity',
        ),
      ],
    );

    StreamAttachment uploadAttachment(String id, {AttachmentType type = AttachmentType.file}) {
      // A real file: the CDN client reads the upload's bytes from its path.
      final directory = Directory.systemTemp.createTempSync('feeds_upload_test');
      addTearDown(() => directory.deleteSync(recursive: true));

      File('${directory.path}/$id.bin').writeAsBytesSync(const [1, 2, 3]);

      return StreamAttachment(id: id, type: type, file: AttachmentFile('${directory.path}/$id.bin'));
    }

    FeedAddActivityRequest requestWithUpload() {
      return FeedAddActivityRequest(
        type: 'post',
        attachmentUploads: [uploadAttachment('a')],
      );
    }

    setUpAll(() {
      registerFallbackValue(<MultipartFile>[]);
      registerFallbackValue(const AddActivityRequest(type: 'post', feeds: []));
      registerFallbackValue(const AddCommentRequest(comment: 'fallback', objectId: 'x', objectType: 'activity'));
    });

    Future<Result<FileUploadResponse>> uploadCall(CdnApi cdn) => cdn.uploadFile(
      file: any(named: 'file'),
      onUploadProgress: any(named: 'onUploadProgress'),
      cancelToken: any(named: 'cancelToken'),
    );

    Future<Result<ImageUploadResponse>> imageUploadCall(CdnApi cdn) => cdn.uploadImage(
      file: any(named: 'file'),
      onUploadProgress: any(named: 'onUploadProgress'),
      cancelToken: any(named: 'cancelToken'),
    );

    feedTest(
      'addActivity() - uploads the attachments and posts the merged request',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockCdn(uploadCall, result: uploadResponse);
        tester.mockApi(
          (api) => api.addActivity(addActivityRequest: mergedRequest),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              feeds: [feedId.rawValue],
            ),
          ),
        );

        final result = await tester.feed.addActivity(request: requestWithUpload());

        expect(result.isSuccess, isTrue);
      },
      // The uploaded file arrived merged into the posted request, its upload
      // queue spent.
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(addActivityRequest: mergedRequest),
      ),
    );

    feedTest(
      "addActivity() - fails with the upload's own error, posting nothing",
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockCdnFailure(uploadCall, error: refused);

        final result = await tester.feed.addActivity(request: requestWithUpload());

        // The upload's failure surfaces classified, and nothing was posted
        // for an activity whose attachments never made it.
        expect(result.exceptionOrNull(), same(refused));
        tester.verifyNeverCalled(
          (api) => api.addActivity(addActivityRequest: any(named: 'addActivityRequest')),
        );
      },
    );

    feedTest(
      'addActivity() - routes each attachment through its own endpoint and merges them all',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockCdn(uploadCall, result: uploadResponse);
        tester.mockCdn(
          imageUploadCall,
          result: const ImageUploadResponse(duration: '0ms', file: 'https://cdn/img'),
        );
        tester.mockApi(
          (api) => api.addActivity(addActivityRequest: mergedMixedRequest),
          result: AddActivityResponse(
            duration: '0ms',
            activity: createDefaultActivityResponse(id: 'activity-1', feeds: [feedId.rawValue]),
          ),
        );

        final result = await tester.feed.addActivity(
          request: FeedAddActivityRequest(
            type: 'post',
            attachmentUploads: [
              uploadAttachment('a'),
              uploadAttachment('b', type: AttachmentType.image),
            ],
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      // The file went through the file endpoint, the image through the image
      // one, and both arrived merged into the posted request.
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivity(addActivityRequest: mergedMixedRequest),
      ),
    );

    feedTest(
      'addComment() - uploads the attachments and posts the merged comment',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockCdn(uploadCall, result: uploadResponse);
        tester.mockApi(
          (api) => api.addComment(addCommentRequest: mergedCommentRequest),
          result: createDefaultAddCommentResponse(objectId: 'activity-1', text: 'Look at this'),
        );

        final result = await tester.feed.addComment(
          request: ActivityAddCommentRequest(
            activityId: 'activity-1',
            comment: 'Look at this',
            attachmentUploads: [uploadAttachment('a')],
          ),
        );

        expect(result.isSuccess, isTrue);
      },
      // The comment went out with the uploaded attachment merged in.
      verify: (tester) => tester.verifyApi(
        (api) => api.addComment(addCommentRequest: mergedCommentRequest),
      ),
    );

    feedTest(
      'addActivity() - refuses two attachments that share an id, before uploading anything',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        // A misuse rather than a failure, so it escapes the `Result` the method
        // otherwise reports through — a caller that only folds cannot see it.
        await expectLater(
          tester.feed.addActivity(
            request: FeedAddActivityRequest(
              type: 'post',
              attachmentUploads: [uploadAttachment('same'), uploadAttachment('same')],
            ),
          ),
          throwsArgumentError,
        );

        tester.verifyNeverCalled(
          (api) => api.addActivity(addActivityRequest: any(named: 'addActivityRequest')),
        );
      },
    );

    feedTest(
      "addComment() - fails with the upload's own error, posting nothing",
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        tester.mockCdnFailure(uploadCall, error: refused);

        final result = await tester.feed.addComment(
          request: ActivityAddCommentRequest(
            activityId: 'activity-1',
            comment: 'Look at this',
            attachmentUploads: [uploadAttachment('a')],
          ),
        );

        expect(result.exceptionOrNull(), same(refused));
        tester.verifyNeverCalled(
          (api) => api.addComment(addCommentRequest: any(named: 'addCommentRequest')),
        );
      },
    );

    activityTest(
      "addCommentsBatch() - uploads each request's attachments before posting the batch",
      build: (client) => client.activity(activityId: 'activity-1', fid: feedId),
      body: (tester) async {
        tester.mockCdn(uploadCall, result: uploadResponse);
        tester.mockApi(
          (api) => api.addCommentsBatch(addCommentsBatchRequest: mergedCommentsBatchRequest),
          result: AddCommentsBatchResponse(
            duration: '0ms',
            comments: [
              createDefaultCommentResponse(id: 'comment-1', objectId: 'activity-1', text: 'with attachment'),
              createDefaultCommentResponse(id: 'comment-2', objectId: 'activity-1', text: 'plain'),
            ],
          ),
        );

        final result = await tester.activity.addCommentsBatch([
          ActivityAddCommentRequest(
            activityId: 'activity-1',
            comment: 'with attachment',
            attachmentUploads: [uploadAttachment('a')],
          ),
          const ActivityAddCommentRequest(activityId: 'activity-1', comment: 'plain'),
        ]);

        expect(result.isSuccess, isTrue);
      },
      // Each comment keeps its own attachments: the upload landed on the
      // request that carried it, and only on that one.
      verify: (tester) => tester.verifyApi(
        (api) => api.addCommentsBatch(addCommentsBatchRequest: mergedCommentsBatchRequest),
      ),
    );
  });
}
