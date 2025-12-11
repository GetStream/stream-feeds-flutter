// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/src/utils/filter.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Feed Operations
  // ============================================================

  group('Get a Feed', () {
    feedTest(
      'get feed',
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
  });

  group('Query follow suggestions', () {
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'should return list of FeedSuggestionData',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.mockApi(
        (api) => api.getFollowSuggestions(
          feedGroupId: feedId.group,
          limit: any(named: 'limit'),
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
      ),
      body: (tester) async {
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
          limit: any(named: 'limit'),
        ),
      ),
    );
  });

  // ============================================================
  // FEATURE: Activity Feedback
  // ============================================================

  group('Activity feedback', () {
    const activityId = 'activity-1';
    const feedId = FeedId(group: 'user', id: 'john');

    feedTest(
      'submits feedback via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) {
        const activityFeedbackRequest = ActivityFeedbackRequest(hide: true);
        tester.mockApi(
          (api) => api.activityFeedback(
            activityId: activityId,
            activityFeedbackRequest: activityFeedbackRequest,
          ),
          result: createDefaultActivityFeedbackResponse(activityId: activityId),
        );
      },
      body: (tester) async {
        const activityFeedbackRequest = ActivityFeedbackRequest(hide: true);
        final result = await tester.feed.activityFeedback(
          activityId: activityId,
          activityFeedbackRequest: activityFeedbackRequest,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) {
        const activityFeedbackRequest = ActivityFeedbackRequest(hide: true);
        tester.verifyApi(
          (api) => api.activityFeedback(
            activityId: activityId,
            activityFeedbackRequest: activityFeedbackRequest,
          ),
        );
      },
    );

    feedTest(
      'marks activity hidden on ActivityFeedbackEvent',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId, hidden: false),
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
              activityId: activityId,
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
      'marks activity unhidden on ActivityFeedbackEvent',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId, hidden: true),
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
              activityId: activityId,
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
  });

  group('Follow events', () {
    const targetFeedId = FeedId(group: 'group', id: 'target');
    const sourceFeedId = FeedId(group: 'group', id: 'source');

    feedTest(
      'follow target feed should update follower count',
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
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 0);
      },
    );

    feedTest(
      'follow source feed should update following count',
      build: (client) => client.feedFromId(sourceFeedId),
      setUp: (tester) => tester.getOrCreate(),
      body: (tester) async {
        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 0);

        await tester.emitEvent(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: sourceFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
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
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 1);
      },
    );

    feedTest(
      'follow deleted target feed should update follower count',
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
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 0);
        expect(tester.feedState.feed?.followingCount, 1);
      },
    );

    feedTest(
      'follow deleted source feed should update following count',
      build: (client) => client.feedFromId(sourceFeedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          feed: createDefaultFeedResponse(
            id: sourceFeedId.id,
            groupId: sourceFeedId.group,
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
            fid: sourceFeedId.toString(),
            follow: FollowResponse(
              createdAt: DateTime.timestamp(),
              custom: const {},
              followerRole: 'followerRole',
              pushPreference: FollowResponsePushPreference.none,
              requestAcceptedAt: DateTime.timestamp(),
              requestRejectedAt: DateTime.timestamp(),
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
              updatedAt: DateTime.timestamp(),
            ),
          ),
        );

        expect(tester.feedState.feed?.followerCount, 1);
        expect(tester.feedState.feed?.followingCount, 0);
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Local filtering with real-time events', () {
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

        // Send ActivityAddedEvent with type 'comment' (doesn't match filter)
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              // Doesn't match 'post' filter
            ).copyWith(type: 'comment'),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
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

        // Send ActivityUpdatedEvent with type that doesn't match filter
        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              // Doesn't match 'post' filter
            ).copyWith(type: 'comment'),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'ActivityReactionAddedEvent - should remove activity when reaction causes filter mismatch',
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

        // Send ActivityReactionAddedEvent with activity that doesn't match filter
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              // Doesn't match 'post' filter
            ).copyWith(type: 'comment'),
            reaction: FeedsReactionResponse(
              activityId: 'activity-1',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'CommentAddedEvent - should remove activity when comment causes filter mismatch',
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.in_(
            ActivitiesFilterField.filterTags,
            ['important'],
          ),
        ),
      ),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(activities: initialActivities),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send CommentAddedEvent with activity that doesn't have 'important' tag
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-1',
            ).copyWith(
              filterTags: ['general'], // Doesn't have 'important' tag
            ),
            comment: createDefaultCommentResponse(
              objectId: 'activity-1',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'ActivityReactionDeletedEvent - should remove activity when reaction deletion causes filter mismatch',
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

        // Send ActivityReactionDeletedEvent with activity that doesn't match filter
        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(
              id: 'activity-2',
              // Doesn't match 'post' filter
            ).copyWith(type: 'comment'),
            reaction: FeedsReactionResponse(
              activityId: 'activity-2',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'ActivityPinnedEvent - should remove activity when pinned activity does not match filter',
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
        modifyResponse: (it) => it.copyWith(
          activities: initialActivities,
          pinnedActivities: initialPinnedActivities,
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));
        expect(tester.feedState.pinnedActivities, hasLength(1));

        // Send ActivityPinnedEvent with activity that doesn't match filter
        await tester.emitEvent(
          ActivityPinnedEvent(
            type: EventTypes.activityPinned,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pinnedActivity: createDefaultPinActivityResponse(
              activityId: 'activity-1',
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
        expect(tester.feedState.pinnedActivities, isEmpty);
      },
    );

    feedTest(
      'ActivityUnpinnedEvent - should remove activity when unpinned activity does not match filter',
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
        modifyResponse: (it) => it.copyWith(
          activities: initialActivities,
          pinnedActivities: initialPinnedActivities,
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));
        expect(tester.feedState.pinnedActivities, hasLength(1));

        // Send ActivityUnpinnedEvent with activity that doesn't match filter
        await tester.emitEvent(
          ActivityUnpinnedEvent(
            type: EventTypes.activityUnpinned,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            pinnedActivity: createDefaultPinActivityResponse(
              activityId: 'activity-1',
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
        expect(tester.feedState.pinnedActivities, isEmpty);
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
            activity: createDefaultActivityResponse(
              id: 'activity-4',
            ).copyWith(
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
            activity: createDefaultActivityResponse(
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

  // ============================================================
  // FEATURE: Story Events
  // ============================================================

  group('Story events', () {
    const feedId = FeedId(group: 'stories', id: 'target');
    final initialStories = [
      createDefaultActivityResponse(id: 'storyActivityId1'),
      createDefaultActivityResponse(id: 'storyActivityId2'),
    ];

    feedTest(
      'Watch story should update isWatched',
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
      'Pagination should load more aggregated activities',
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
      },
      verify: (tester) {
        final nextPageQuery = tester.feed.query.copyWith(
          activityNext: tester.feedState.activitiesPagination?.next,
        );

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
      'StoriesFeedUpdatedEvent should update aggregated activities',
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

  // ============================================================
  // FEATURE: Bookmarks
  // ============================================================

  group('Bookmarks', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const activityId = 'activity-1';
    const userId = 'luke_skywalker';

    feedTest(
      'addBookmark - should add bookmark to activity via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addBookmark(
            activityId: activityId,
            addBookmarkRequest: any(named: 'addBookmarkRequest'),
          ),
          result: createDefaultAddBookmarkResponse(
            userId: userId,
            activityId: activityId,
          ),
        );

        // Initial state - no bookmarks
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.id, activityId);
        expect(initialActivity.ownBookmarks, isEmpty);

        // Add bookmark
        final result = await tester.feed.addBookmark(activityId: activityId);

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, activityId);
        expect(bookmark.user.id, userId);

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
        expect(updatedActivity.ownBookmarks.first.id, bookmark.id);
        expect(updatedActivity.ownBookmarks.first.user.id, userId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addBookmark(
          activityId: activityId,
          addBookmarkRequest: any(named: 'addBookmarkRequest'),
        ),
      ),
    );

    feedTest(
      'addBookmark - should handle BookmarkAddedEvent and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
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
              activityId: activityId,
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
        expect(updatedActivity.ownBookmarks.first.user.id, userId);
        expect(updatedActivity.ownBookmarks.first.activity.id, activityId);
      },
    );

    feedTest(
      'addBookmark - should handle both API call and event together',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no bookmarks
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownBookmarks, isEmpty);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addBookmark(
            activityId: activityId,
            addBookmarkRequest: any(named: 'addBookmarkRequest'),
          ),
          result: createDefaultAddBookmarkResponse(
            userId: userId,
            activityId: activityId,
          ),
        );

        // Add bookmark via API
        final result = await tester.feed.addBookmark(activityId: activityId);
        expect(result.isSuccess, isTrue);

        // Also emit event (simulating real-time update)
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: activityId,
            ),
          ),
        );

        // Verify state has bookmark (should not duplicate)
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
      },
    );

    feedTest(
      'addBookmark - should not update activity if activity ID does not match',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
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
      'updateBookmark - should update bookmark via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: activityId,
                  folderId: 'folder-id',
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
        expect(initialActivity.ownBookmarks.first.folder?.id, 'folder-id');

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.updateBookmark(
            activityId: activityId,
            updateBookmarkRequest: any(named: 'updateBookmarkRequest'),
          ),
          result: createDefaultUpdateBookmarkResponse(
            userId: userId,
            activityId: activityId,
            folderId: 'new-folder-id',
          ),
        );

        final result = await tester.feed.updateBookmark(
          activityId: activityId,
          request: const UpdateBookmarkRequest(folderId: 'new-folder-id'),
        );

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, activityId);
        expect(bookmark.folder?.id, 'new-folder-id');
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateBookmark(
          activityId: activityId,
          updateBookmarkRequest: any(named: 'updateBookmarkRequest'),
        ),
      ),
    );

    // Note: BookmarkUpdatedEvent is not currently handled in FeedEventHandler
    // It's only handled in BookmarkListEventHandler for bookmark list state
    // This test is skipped until BookmarkUpdatedEvent handling is added to FeedEventHandler

    feedTest(
      'deleteBookmark - should delete bookmark via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: activityId,
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

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteBookmark(
            activityId: activityId,
            folderId: any(named: 'folderId'),
          ),
          result: createDefaultDeleteBookmarkResponse(
            userId: userId,
            activityId: activityId,
          ),
        );

        // Delete bookmark
        final result = await tester.feed.deleteBookmark(activityId: activityId);

        expect(result, isA<Result<BookmarkData>>());
        final bookmark = result.getOrThrow();
        expect(bookmark.activity.id, activityId);
        expect(bookmark.user.id, userId);

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, isEmpty);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteBookmark(
          activityId: activityId,
          folderId: any(named: 'folderId'),
        ),
      ),
    );

    feedTest(
      'deleteBookmark - should handle BookmarkDeletedEvent and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: activityId,
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
              activityId: activityId,
            ),
          ),
        );

        // Verify state was updated
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, isEmpty);
      },
    );

    feedTest(
      'deleteBookmark - should handle both API call and event together',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  userId: userId,
                  activityId: activityId,
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

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteBookmark(
            activityId: activityId,
            folderId: any(named: 'folderId'),
          ),
          result: createDefaultDeleteBookmarkResponse(
            userId: userId,
            activityId: activityId,
          ),
        );

        // Delete bookmark via API
        final result = await tester.feed.deleteBookmark(activityId: activityId);
        expect(result.isSuccess, isTrue);

        // Also emit event (simulating real-time update)
        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              userId: userId,
              activityId: activityId,
            ),
          ),
        );

        // Verify state has no bookmarks
        final updatedActivity = tester.feedState.activities.first;
        expect(updatedActivity.ownBookmarks, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Reactions
  // ============================================================

  group('Reactions', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const activityId = 'activity-1';
    const userId = 'luke_skywalker';

    setUpAll(() {
      registerFallbackValue(const AddReactionRequest(type: 'like'));
    });

    feedTest(
      'addActivityReaction - should add reaction to activity via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addActivityReaction(
            activityId: activityId,
            addReactionRequest: any(named: 'addReactionRequest'),
          ),
          result: createDefaultAddReactionResponse(
            activityId: activityId,
            userId: userId,
            reactionType: 'heart',
          ),
        );

        // Initial state - no reactions
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, isEmpty);

        // Add reaction
        final result = await tester.feed.addActivityReaction(
          activityId: activityId,
          request: const AddReactionRequest(type: 'heart'),
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.activityId, activityId);
        expect(reaction.type, 'heart');
        expect(reaction.user.id, userId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addActivityReaction(
          activityId: activityId,
          addReactionRequest: any(named: 'addReactionRequest'),
        ),
      ),
    );

    feedTest(
      'addActivityReaction - should handle ActivityReactionAddedEvent and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
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
            activity: createDefaultActivityResponse(id: activityId).copyWith(
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: 'heart',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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
      'deleteActivityReaction - should delete reaction via API',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownReactions: [
                FeedsReactionResponse(
                  activityId: activityId,
                  type: 'heart',
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
              ],
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        final initialActivity = tester.feedState.activities.first;
        expect(initialActivity.ownReactions, hasLength(1));

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteActivityReaction(
            activityId: activityId,
            type: 'heart',
          ),
          result: createDefaultDeleteReactionResponse(
            activityId: activityId,
            userId: userId,
            reactionType: 'heart',
          ),
        );

        // Delete reaction
        final result = await tester.feed.deleteActivityReaction(
          activityId: activityId,
          type: 'heart',
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrThrow();
        expect(reaction.activityId, activityId);
        expect(reaction.type, 'heart');
        expect(reaction.user.id, userId);

        // Note: deleteActivityReaction doesn't update state automatically
        // State is only updated via events (ActivityReactionDeletedEvent)
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteActivityReaction(
          activityId: activityId,
          type: 'heart',
        ),
      ),
    );

    feedTest(
      'deleteActivityReaction - should handle ActivityReactionDeletedEvent and update activity',
      build: (client) => client.feedFromId(feedId),
      setUp: (tester) => tester.getOrCreate(
        modifyResponse: (it) => it.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              feeds: [feedId.rawValue],
              ownReactions: [
                FeedsReactionResponse(
                  activityId: activityId,
                  type: 'heart',
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
              ],
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
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
            activity: createDefaultActivityResponse(id: activityId).copyWith(
              reactionGroups: const {},
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: 'heart',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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
              id: activityId,
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
            activity: createDefaultActivityResponse(id: activityId).copyWith(
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: 'heart',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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
            activity: createDefaultActivityResponse(id: activityId).copyWith(
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
                'fire': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: 'fire',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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
              id: activityId,
              feeds: [feedId.rawValue],
              ownReactions: [
                FeedsReactionResponse(
                  activityId: activityId,
                  type: 'heart',
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
                FeedsReactionResponse(
                  activityId: activityId,
                  type: 'fire',
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
              ],
              reactionGroups: {
                'heart': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
                'fire': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
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
            activity: createDefaultActivityResponse(id: activityId).copyWith(
              reactionGroups: {
                'fire': ReactionGroupResponse(
                  count: 1,
                  firstReactionAt: DateTime.timestamp(),
                  lastReactionAt: DateTime.timestamp(),
                ),
              },
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: 'heart',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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

  // ============================================================
  // FEATURE: OnNewActivity
  // ============================================================

  group('OnNewActivity', () {
    const feedId = FeedId(group: 'user', id: 'john');
    const currentUserId = 'luke_skywalker';
    const otherUserId = 'other_user';

    final initialActivities = [
      createDefaultActivityResponse(id: 'activity-1', userId: currentUserId),
      createDefaultActivityResponse(id: 'activity-2', userId: currentUserId),
      createDefaultActivityResponse(id: 'activity-3', userId: otherUserId),
    ];

    feedTest(
      'defaultOnNewActivity - should add current user activity to start when matching filter',
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
              userId: currentUserId,
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
              userId: otherUserId,
              type: 'post',
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'defaultOnNewActivity - should ignore current user activity that does not match filter',
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
              userId: currentUserId,
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'custom onNewActivity - should add to start',
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
              userId: otherUserId,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.first.id, 'activity-4');
      },
    );

    feedTest(
      'custom onNewActivity - should add to end',
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
              userId: otherUserId,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
        expect(tester.feedState.activities.last.id, 'activity-4');
      },
    );

    feedTest(
      'custom onNewActivity - should ignore',
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
              userId: currentUserId,
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(3));
      },
    );

    feedTest(
      'custom onNewActivity - should use query and activity context',
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
              userId: otherUserId,
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
              userId: otherUserId,
              type: 'comment', // Doesn't match 'post' filter
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(4));
      },
    );
  });
}
