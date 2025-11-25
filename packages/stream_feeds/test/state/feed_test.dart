// ignore_for_file: avoid_redundant_argument_values

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
          activityFilter: Filter.equal(ActivitiesFilterField.type, 'post'),
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
      'BookmarkAddedEvent - should remove activity when bookmark causes filter mismatch',
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
        modifyResponse: (it) => it.copyWith(
          activities: initialActivities,
          pinnedActivities: initialPinnedActivities,
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send BookmarkAddedEvent with activity that doesn't have 'important' tag
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-1',
            ).copyWith(
              activity: createDefaultActivityResponse(
                id: 'activity-1',
              ).copyWith(
                feeds: [feedId.rawValue], // Activity belongs to this feed
                filterTags: ['general'], // Doesn't have 'important' tag
              ),
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'BookmarkDeletedEvent - should remove activity when bookmark deletion causes filter mismatch',
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
        modifyResponse: (it) => it.copyWith(
          activities: initialActivities,
          pinnedActivities: initialPinnedActivities,
        ),
      ),
      body: (tester) async {
        expect(tester.feedState.activities, hasLength(3));

        // Send BookmarkDeletedEvent with activity that doesn't have 'important' tag
        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-2',
            ).copyWith(
              activity: createDefaultActivityResponse(
                id: 'activity-2',
                feeds: [feedId.rawValue], // Activity belongs to this feed
              ).copyWith(
                filterTags: ['general'], // Doesn't have 'important' tag
              ),
            ),
          ),
        );

        expect(tester.feedState.activities, hasLength(2));
      },
    );

    feedTest(
      'Complex filter with AND - should filter correctly',
      build: (client) => client.feedFromQuery(
        FeedQuery(
          fid: feedId,
          activityFilter: Filter.and([
            Filter.equal(ActivitiesFilterField.type, 'post'),
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
            Filter.equal(ActivitiesFilterField.type, 'post'),
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
}
