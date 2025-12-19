// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const activityId = 'activity-1';
  const userId = 'luke_skywalker';
  const reactionType = 'like';

  const query = ActivitiesQuery();

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
        expect(tester.activityListState.canLoadMore, isTrue);

        final nextPageQuery = tester.activityList.query.copyWith(
          next: tester.activityListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryActivities(
            queryActivitiesRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryActivitiesResponse(
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
        expect(tester.activityListState.canLoadMore, isFalse);

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
        expect(tester.activityListState.canLoadMore, isFalse);
        // Query more activities (should return empty immediately)
        final result = await tester.activityList.queryMoreActivities();

        expect(result.isSuccess, isTrue);
        final activities = result.getOrNull();
        expect(activities, isEmpty);

        // Verify state was not updated (no new activities, pagination remains null)
        expect(tester.activityListState.activities, hasLength(1));
        expect(tester.activityListState.canLoadMore, isFalse);
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
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              activityId: activityId,
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
      'ActivityReactionUpdatedEvent - should replace user reaction',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: reactionType,
                  userId: userId,
                  activityId: activityId,
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
        expect(initialActivity.ownReactions.first.type, reactionType);

        // Emit event
        await tester.emitEvent(
          ActivityReactionUpdatedEvent(
            type: EventTypes.activityReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'love',
                  userId: userId,
                  activityId: activityId,
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: userId,
              activityId: activityId,
            ),
          ),
        );

        // Verify state has updated reaction
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownReactions, hasLength(1));
        expect(updatedActivity.ownReactions.first.type, 'love');
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
                createDefaultReactionResponse(
                  reactionType: reactionType,
                  userId: userId,
                  activityId: activityId,
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
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              activityId: activityId,
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
      'should handle BookmarkUpdatedEvent and update bookmark',
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

        final existingBookmark = initialActivity.ownBookmarks.first;

        // Emit event with updated bookmark
        final updatedBookmarkResponse = createDefaultBookmarkResponse(
          activityId: activityId,
          userId: userId,
        ).copyWith(
          custom: const {'updated': true},
        );

        await tester.emitEvent(
          BookmarkUpdatedEvent(
            type: EventTypes.bookmarkUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: updatedBookmarkResponse,
          ),
        );

        // Verify state has updated bookmark
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.ownBookmarks, hasLength(1));

        final updatedBookmark = updatedActivity.ownBookmarks.first;
        expect(updatedBookmark.id, existingBookmark.id);
        expect(updatedBookmark.custom?['updated'], isTrue);
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

  // ============================================================
  // FEATURE: Activity List - Comment Reactions
  // ============================================================

  group('Activity List - Comment Reactions', () {
    activityListTest(
      'should handle CommentReactionAddedEvent and update comment',
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
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with no reactions
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              activityId: activityId,
              commentId: 'comment-1',
              userId: userId,
            ),
          ),
        );

        // Verify state has reaction on comment
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, hasLength(1));

        final comment = updatedActivity.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, 'love');
      },
    );

    activityListTest(
      'CommentReactionUpdatedEvent - should replace user reaction',
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
                  userId: userId,
                  ownReactions: [
                    createDefaultReactionResponse(
                      reactionType: 'wow',
                      userId: userId,
                      commentId: 'comment-1',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with 'wow' reaction
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, hasLength(1));
        expect(initialActivity.comments.first.ownReactions.first.type, 'wow');

        // Emit CommentReactionUpdatedEvent - replaces 'wow' with 'love'
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'love',
                  userId: userId,
                  commentId: 'comment-1',
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: userId,
              commentId: 'comment-1',
            ),
          ),
        );

        // Verify 'wow' was replaced with 'love'
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions.first.type, 'love');
      },
    );

    activityListTest(
      'should handle CommentReactionDeletedEvent and remove reaction',
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
                  userId: userId,
                  ownReactions: [
                    createDefaultReactionResponse(
                      reactionType: 'love',
                      userId: userId,
                      commentId: 'comment-1',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with 'love' reaction
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.comments, hasLength(1));
        expect(initialActivity.comments.first.ownReactions, hasLength(1));
        expect(initialActivity.comments.first.ownReactions.first.type, 'love');

        // Emit CommentReactionDeletedEvent
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: userId,
              commentId: 'comment-1',
            ),
          ),
        );

        // Verify reaction was removed
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.comments, hasLength(1));
        expect(updatedActivity.comments.first.ownReactions, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity List - Polls
  // ============================================================

  group('Activity List - Polls', () {
    final defaultPoll = createDefaultPollResponse();

    activityListTest(
      'should handle PollClosedFeedEvent and update poll',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              poll: defaultPoll,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has poll
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.isClosed, false);

        // Emit event
        await tester.emitEvent(
          PollClosedFeedEvent(
            type: EventTypes.pollClosed,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            poll: defaultPoll.copyWith(isClosed: true),
          ),
        );

        // Verify state has closed poll
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.isClosed, true);
      },
    );

    activityListTest(
      'should handle PollDeletedFeedEvent and remove poll',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              poll: defaultPoll,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has poll
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.poll, isNotNull);

        // Emit event
        await tester.emitEvent(
          PollDeletedFeedEvent(
            type: EventTypes.pollDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            poll: defaultPoll,
          ),
        );

        // Verify state has no poll
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.poll, isNull);
      },
    );

    activityListTest(
      'should handle PollUpdatedFeedEvent and update poll',
      build: (client) => client.activityList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          activities: [
            createDefaultActivityResponse(
              id: activityId,
              poll: defaultPoll,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has poll
        final initialActivity = tester.activityListState.activities.first;
        expect(initialActivity.poll, isNotNull);
        expect(initialActivity.poll!.name, 'name');

        // Emit event
        await tester.emitEvent(
          PollUpdatedFeedEvent(
            type: EventTypes.pollUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            poll: defaultPoll.copyWith(name: 'Updated Poll Name'),
          ),
        );

        // Verify state has updated poll
        final updatedActivity = tester.activityListState.activities.first;
        expect(updatedActivity.poll, isNotNull);
        expect(updatedActivity.poll!.name, 'Updated Poll Name');
      },
    );

    group('Vote operations', () {
      final pollWithVotes = createDefaultPollResponse(
        options: [
          createDefaultPollOptionResponse(id: 'option-1', text: 'Option 1'),
          createDefaultPollOptionResponse(id: 'option-2', text: 'Option 2'),
        ],
        ownVotesAndAnswers: [
          createDefaultPollVoteResponse(id: 'vote-1', optionId: 'option-1'),
        ],
      );

      activityListTest(
        'should handle PollVoteCastedFeedEvent and update poll with vote',
        build: (client) => client.activityList(query),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: activityId,
                poll: pollWithVotes,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has poll with votes
          final initialActivity = tester.activityListState.activities.first;
          expect(initialActivity.poll, isNotNull);
          expect(initialActivity.poll!.voteCount, 1);

          final newVote = createDefaultPollVoteResponse(
            id: 'vote-2',
            pollId: pollWithVotes.id,
            optionId: 'option-2',
          );

          // Emit PollVoteCastedFeedEvent
          await tester.emitEvent(
            PollVoteCastedFeedEvent(
              type: EventTypes.pollVoteCasted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:john',
              pollVote: newVote,
              poll: createDefaultPollResponse(
                options: pollWithVotes.options,
                ownVotesAndAnswers: [
                  createDefaultPollVoteResponse(
                    id: 'vote-1',
                    optionId: 'option-1',
                  ),
                  newVote,
                ],
              ),
            ),
          );

          // Verify state has updated poll
          final updatedActivity = tester.activityListState.activities.first;
          expect(updatedActivity.poll, isNotNull);
          expect(updatedActivity.poll!.voteCount, 2);
        },
      );

      activityListTest(
        'should handle PollVoteChangedFeedEvent and update poll with changed vote',
        build: (client) => client.activityList(query),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: activityId,
                poll: pollWithVotes,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has poll with vote on option-1
          final initialActivity = tester.activityListState.activities.first;
          expect(initialActivity.poll, isNotNull);
          final votesInOption1 =
              initialActivity.poll!.latestVotesByOption['option-1'];
          expect(votesInOption1, hasLength(1));

          final changedVote = createDefaultPollVoteResponse(
            id: 'vote-1',
            pollId: pollWithVotes.id,
            optionId: 'option-2',
          );

          // Emit PollVoteChangedFeedEvent
          await tester.emitEvent(
            PollVoteChangedFeedEvent(
              type: EventTypes.pollVoteChanged,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:john',
              pollVote: changedVote,
              poll: createDefaultPollResponse(
                options: pollWithVotes.options,
                ownVotesAndAnswers: [changedVote],
              ),
            ),
          );

          // Verify state has updated poll
          final updatedActivity = tester.activityListState.activities.first;
          expect(updatedActivity.poll, isNotNull);
          expect(updatedActivity.poll!.voteCount, 1);
          expect(
            updatedActivity.poll!.latestVotesByOption['option-2'],
            hasLength(1),
          );
        },
      );

      activityListTest(
        'should handle PollVoteRemovedFeedEvent and update poll when vote is removed',
        build: (client) => client.activityList(query),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: activityId,
                poll: pollWithVotes,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has poll with vote
          final initialActivity = tester.activityListState.activities.first;
          expect(initialActivity.poll, isNotNull);
          expect(initialActivity.poll!.voteCount, 1);

          final voteToRemove = createDefaultPollVoteResponse(
            id: 'vote-1',
            pollId: pollWithVotes.id,
            optionId: 'option-1',
          );

          // Emit PollVoteRemovedFeedEvent
          await tester.emitEvent(
            PollVoteRemovedFeedEvent(
              type: EventTypes.pollVoteRemoved,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:john',
              pollVote: voteToRemove,
              poll: createDefaultPollResponse(
                options: pollWithVotes.options,
                ownVotesAndAnswers: [],
              ),
            ),
          );

          // Verify state has updated poll
          final updatedActivity = tester.activityListState.activities.first;
          expect(updatedActivity.poll, isNotNull);
          expect(updatedActivity.poll!.voteCount, 0);
        },
      );
    });

    group('Answer operations', () {
      final pollWithAnswers = createDefaultPollResponse(
        ownVotesAndAnswers: [
          createDefaultPollAnswerResponse(id: 'answer-1'),
        ],
      );

      activityListTest(
        'should handle PollAnswerCastedFeedEvent and update poll with answer',
        build: (client) => client.activityList(query),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: activityId,
                poll: pollWithAnswers,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has poll with answers
          final initialActivity = tester.activityListState.activities.first;
          expect(initialActivity.poll, isNotNull);
          expect(initialActivity.poll!.answersCount, 1);

          final newAnswer = createDefaultPollAnswerResponse(
            id: 'answer-2',
            pollId: pollWithAnswers.id,
            answerText: 'Answer 2',
          );

          // Emit event using PollVoteCastedFeedEvent with isAnswer: true
          // This will be resolved to PollAnswerCastedFeedEvent by the resolver
          await tester.emitEvent(
            PollVoteCastedFeedEvent(
              type: EventTypes.pollVoteCasted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:john',
              pollVote: newAnswer,
              poll: createDefaultPollResponse(
                ownVotesAndAnswers: [
                  createDefaultPollAnswerResponse(id: 'answer-1'),
                  newAnswer,
                ],
              ),
            ),
          );

          // Verify state has updated poll
          final updatedActivity = tester.activityListState.activities.first;
          expect(updatedActivity.poll, isNotNull);
          expect(updatedActivity.poll!.answersCount, 2);
        },
      );

      activityListTest(
        'should handle PollAnswerRemovedFeedEvent and update poll when answer is removed',
        build: (client) => client.activityList(query),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            activities: [
              createDefaultActivityResponse(
                id: activityId,
                poll: pollWithAnswers,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has poll with answer
          final initialActivity = tester.activityListState.activities.first;
          expect(initialActivity.poll, isNotNull);
          expect(initialActivity.poll!.answersCount, 1);

          final answerToRemove = createDefaultPollAnswerResponse(
            id: 'answer-1',
            pollId: pollWithAnswers.id,
          );

          // Emit event using PollVoteRemovedFeedEvent with isAnswer: true
          // This will be resolved to PollAnswerRemovedFeedEvent by the resolver
          await tester.emitEvent(
            PollVoteRemovedFeedEvent(
              type: EventTypes.pollVoteRemoved,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: 'user:john',
              pollVote: answerToRemove,
              poll: createDefaultPollResponse(
                ownVotesAndAnswers: [],
              ),
            ),
          );

          // Verify state has updated poll
          final updatedActivity = tester.activityListState.activities.first;
          expect(updatedActivity.poll, isNotNull);
          expect(updatedActivity.poll!.answersCount, 0);
        },
      );
    });
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('ActivityListEventHandler - Local filtering', () {
    final defaultActivities = [
      createDefaultActivityResponse(id: 'activity-1'),
      createDefaultActivityResponse(id: 'activity-2'),
      createDefaultActivityResponse(id: 'activity-3'),
    ];

    activityListTest(
      'ActivityAddedEvent - should not add activity when it does not match filter',
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
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              type: 'comment',
            ),
          ),
        );

        // Activity should not be added because it doesn't match the filter
        expect(tester.activityListState.activities, hasLength(3));
      },
    );

    activityListTest(
      'ActivityAddedEvent - should add activity when it matches filter',
      build: (client) => client.activityList(
        ActivitiesQuery(
          filter: Filter.equal(ActivitiesFilterField.activityType, 'activity'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(activities: defaultActivities),
      ),
      body: (tester) async {
        expect(tester.activityListState.activities, hasLength(3));

        await tester.emitEvent(
          ActivityAddedEvent(
            type: EventTypes.activityAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: 'activity-4',
              type: 'activity',
            ),
          ),
        );

        // Activity should be added because it matches the filter
        final activities = tester.activityListState.activities;

        expect(activities, hasLength(4));
        expect(activities.any((a) => a.id == 'activity-4'), isTrue);
      },
    );

    activityListTest(
      'ActivityUpdatedEvent - should remove activity when updated to non-matching filter',
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
      'ActivityUpdatedEvent - should remove activity when updated to non-matching AND filter',
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
      'ActivityUpdatedEvent - should keep activity when updated to match OR filter',
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
      'No filter - should not remove activity when no filter specified',
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
}
