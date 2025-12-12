import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const activityId = 'activity-1';
  const userId = 'luke_skywalker';
  const reactionType = 'like';

  const query = ActivitiesQuery();
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Local filtering with real-time events', () {
    final defaultActivities = [
      createDefaultActivityResponse(id: 'activity-1'),
      createDefaultActivityResponse(id: 'activity-2'),
      createDefaultActivityResponse(id: 'activity-3'),
    ];

    activityListTest(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching type',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              type: 'comment',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'ActivityReactionAddedEvent - should remove activity when reaction causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-2',
              type: 'comment',
            ),
            reaction: FeedsReactionResponse(
              activityId: 'activity-2',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'ActivityReactionDeletedEvent - should remove activity when reaction deletion causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-3',
              type: 'share',
            ),
            reaction: FeedsReactionResponse(
              activityId: 'activity-3',
              type: 'like',
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(),
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'BookmarkAddedEvent - should remove activity when bookmark causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-1',
              activityType: 'comment',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'BookmarkDeletedEvent - should remove activity when bookmark deletion causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: 'activity-2',
              activityType: 'share',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'CommentAddedEvent - should remove activity when comment causes filter mismatch',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-3',
              type: 'comment',
            ),
            comment: createDefaultCommentResponse(
              objectId: 'activity-3',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'Complex filter with AND - should filter correctly',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.and([
            Filter.equal(ActivitiesFilterField.activityType, 'post'),
            Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
            ).copyWith(
              filterTags: ['general'], // Doesn't match second condition
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(2));
      },
    );

    activityListTest(
      'Complex filter with OR - should only keep activities matching any condition',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.or([
            Filter.equal(ActivitiesFilterField.activityType, 'post'),
            Filter.equal(ActivitiesFilterField.filterTags, ['featured']),
          ]),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
            ).copyWith(
              filterTags: ['general'], // Doesn't match second condition
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(3));

        final updatedActivity = tester.activityListState.activities.firstWhere(
          (activity) => activity.id == 'activity-1',
        );

        expect(updatedActivity.filterTags, ['general']);
      },
    );

    activityListTest(
      'No filter - filtering is disabled when no filter specified',
      build: (client) => client.activityList(const ActivitiesQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            activity: createDefaultActivityResponse(
              id: 'activity-1',
              type: 'share',
            ),
          ),
        );

        expect(tester.activityListState.activities, hasLength(3));
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
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, false);

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

        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, true);
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
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, true);

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

        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.hidden, false);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Query Operations
  // ============================================================

  group('Activity List - Query Operations', () {
    activityListTest(
      'get - should query initial activities via API',
      build: (client) => client.activityList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<ActivityData>>>());
        final activities = result.getOrThrow();

        expect(activities, isA<List<ActivityData>>());
        expect(activities, hasLength(3));
        expect(activities[0].id, 'activity-1');
        expect(activities[1].id, 'activity-2');
        expect(activities[2].id, 'activity-3');
      },
    );

    activityListTest(
      'queryMoreActivities - should load more activities via API',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          activities: [
            createDefaultActivityResponse(
              id: activityId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has activity
        expect(tester.activityListState.activities, hasLength(1));

        final nextPageQuery = tester.activityList.query.copyWith(
          next: tester.activityListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryActivities(
            queryActivitiesRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryActivitiesResponse(
            prev: 'prev-cursor',
            activities: [
              createDefaultActivityResponse(id: 'activity-2'),
            ],
          ),
        );

        // Query more activities
        final result = await tester.activityList.queryMoreActivities();

        expect(result.isSuccess, isTrue);
        final activities = result.getOrNull();
        expect(activities, isNotNull);
        expect(activities, hasLength(1));

        // Verify state was updated with merged activities
        expect(tester.activityListState.activities, hasLength(2));
        expect(tester.activityListState.pagination?.next, isNull);
        expect(tester.activityListState.pagination?.previous, 'prev-cursor');
      },
      verify: (tester) {
        final nextPageQuery = tester.activityList.query.copyWith(
          next: tester.activityListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryActivities(
            queryActivitiesRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    activityListTest(
      'queryMoreActivities - should return empty list when no more activities',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has activity but no pagination
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.pagination?.next, isNull);
        expect(tester.activityListState.pagination?.previous, isNull);

        // Query more activities (should return empty immediately)
        final result = await tester.activityList.queryMoreActivities();

        expect(result.isSuccess, isTrue);
        final activities = result.getOrNull();
        expect(activities, isEmpty);

        // Verify state was not updated (no new activities, pagination remains null)
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.pagination?.next, isNull);
        expect(tester.activityListState.pagination?.previous, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Event Handling
  // ============================================================

  group('Activity List - Event Handling', () {
    activityListTest(
      'should handle ActivityAddedEvent and add activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(activities: const []),
      ),
      body: (tester) async {
        // Initial state - no activities
        expect(tester.activityListState.activities, isEmpty);

        // Emit event
        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
          ),
        );

        // Verify state has activity
        expect(tester.activityListState.activities, hasLength(1));
        final addedActivity = tester.activityListState.activities.first;
        expect(addedActivity.id, activityId);
        expect(addedActivity.type, 'post');
      },
    );

    activityListTest(
      'should handle ActivityUpdatedEvent and update activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has activity
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.type, 'post');

        // Emit event
        await tester.emitEvent(
          ActivityUpdatedEvent(
            type: EventTypes.activityUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
              type: 'share',
            ),
          ),
        );

        // Verify state has updated activity
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.type, 'share');
      },
    );

    activityListTest(
      'should handle ActivityDeletedEvent and remove activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has activity
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.activities.first.id, activityId);

        // Emit event
        await tester.emitEvent(
          ActivityDeletedEvent(
            type: 'feeds.activity.deleted',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
            ),
          ),
        );

        // Verify state has no activities
        expect(tester.activityListState.activities, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Reactions
  // ============================================================

  group('Activity List - Reactions', () {
    activityListTest(
      'should handle ActivityReactionAddedEvent and update activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no reactions
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.ownReactions, isEmpty);

        // Emit event
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: EventTypes.activityReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has reaction
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownReactions, hasLength(1));
        expect(updatedActivity.ownReactions.first.type, reactionType);
      },
    );

    activityListTest(
      'should handle ActivityReactionDeletedEvent and remove reaction',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              ownReactions: [
                FeedsReactionResponse(
                  activityId: activityId,
                  type: reactionType,
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.ownReactions, hasLength(1));

        // Emit event
        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: EventTypes.activityReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has no reactions
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownReactions, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Bookmarks
  // ============================================================

  group('Activity List - Bookmarks', () {
    activityListTest(
      'should handle BookmarkAddedEvent and update activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no bookmarks
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.ownBookmarks, isEmpty);

        // Emit event
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: activityId,
              userId: userId,
            ),
          ),
        );

        // Verify state has bookmark
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));
        expect(updatedActivity.ownBookmarks.first.user.id, userId);
      },
    );

    activityListTest(
      'should handle BookmarkDeletedEvent and remove bookmark',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              ownBookmarks: [
                createDefaultBookmarkResponse(
                  activityId: activityId,
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.ownBookmarks, hasLength(1));

        // Emit event
        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              activityId: activityId,
              userId: userId,
            ),
          ),
        );

        // Verify state has no bookmarks
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownBookmarks, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Comments
  // ============================================================

  group('Activity List - Comments', () {
    activityListTest(
      'should handle CommentAddedEvent and update activity',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(id: activityId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no comments
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
            ),
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has comment
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.text, 'Test comment');
      },
    );

    activityListTest(
      'should handle CommentUpdatedEvent and update comment',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              comments: [
                createDefaultCommentResponse(
                  id: 'comment-1',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Original comment',
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.text, 'Original comment');

        // Emit event
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
              text: 'Updated comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has updated comment
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.text, 'Updated comment');
      },
    );

    activityListTest(
      'should handle CommentDeletedEvent and remove comment',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              comments: [
                createDefaultCommentResponse(
                  id: 'comment-1',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Test comment',
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.id, 'comment-1');
        expect(initialActivity.commentCount, 1);

        // Emit event
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify state has no comments
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, isEmpty);
        expect(updatedActivity.commentCount, 0);
      },
    );
  });
}
