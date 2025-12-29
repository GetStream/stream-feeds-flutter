import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const activityId = 'activity-1';
  const fid = FeedId(group: 'user', id: 'john');

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Activity - Query Operations', () {
    activityTest(
      'fetch activity and comments',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<ActivityData>>());
        expect(result.getOrNull()?.id, activityId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.getActivity(id: activityId),
      ),
    );

    activityTest(
      'queryMoreComments - should load more comments',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          next: 'next-cursor',
          comments: [
            createDefaultThreadedCommentResponse(
              id: 'comment-1',
              objectId: activityId,
              objectType: 'activity',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.canLoadMoreComments, isTrue);

        tester.mockApi(
          (api) => api.getComments(
            next: 'next-cursor',
            objectId: activityId,
            objectType: 'activity',
            depth: 3,
          ),
          result: createDefaultCommentsResponse(
            comments: [
              createDefaultThreadedCommentResponse(
                id: 'comment-2',
                objectId: activityId,
                objectType: 'activity',
              ),
            ],
          ),
        );

        final result = await tester.activity.queryMoreComments();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, hasLength(1));

        // Verify state was updated
        expect(tester.activityState.comments, hasLength(2));
        expect(tester.activityState.canLoadMoreComments, isFalse);

        tester.verifyApi(
          (api) => api.getComments(
            next: 'next-cursor',
            objectId: activityId,
            objectType: 'activity',
            depth: 3,
          ),
        );
      },
    );

    activityTest(
      'getComment - should get specific comment by ID',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        const commentId = 'comment-1';

        tester.mockApi(
          (api) => api.getComment(id: commentId),
          result: GetCommentResponse(
            duration: DateTime.timestamp().toIso8601String(),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
            ),
          ),
        );

        final result = await tester.activity.getComment(commentId);

        expect(result.isSuccess, isTrue);
        final comment = result.getOrNull();
        expect(comment, isNotNull);
        expect(comment!.id, commentId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.getComment(id: 'comment-1'),
      ),
    );

    activityTest(
      'getPoll - should get poll for activity',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.getPoll(pollId: pollId),
          result: PollResponse(
            poll: createDefaultPollResponse(id: pollId),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.getPoll();

        expect(result.isSuccess, isTrue);
        final poll = result.getOrNull();
        expect(poll, isNotNull);
        expect(poll!.id, pollId);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi((api) => api.getPoll(pollId: pollId));
      },
    );

    activityTest(
      'getPollOption - should get poll option by ID',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(
            options: [
              createDefaultPollOptionResponse(
                id: 'option-1',
                text: 'Option 1',
              ),
            ],
          ),
        ),
      ),
      body: (tester) async {
        const optionId = 'option-1';
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.getPollOption(pollId: pollId, optionId: optionId),
          result: PollOptionResponse(
            duration: DateTime.timestamp().toIso8601String(),
            pollOption: createDefaultPollOptionResponse(
              id: optionId,
              text: 'Option 1',
            ),
          ),
        );

        final result = await tester.activity.getPollOption(optionId);

        expect(result.isSuccess, isTrue);
        final option = result.getOrNull();
        expect(option, isNotNull);
        expect(option!.id, optionId);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.getPollOption(pollId: pollId, optionId: 'option-1'),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Methods
  // ============================================================

  group('Activity - Activity Methods', () {
    activityTest(
      'activityFeedback - should submit feedback via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.mockApi(
        (api) => api.activityFeedback(
          activityId: activityId,
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        ),
        result: createDefaultActivityFeedbackResponse(activityId: activityId),
      ),
      body: (tester) async {
        const activityFeedbackRequest = ActivityFeedbackRequest(hide: true);

        final result = await tester.activity.activityFeedback(
          activityFeedbackRequest: activityFeedbackRequest,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.activityFeedback(
          activityId: activityId,
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        ),
      ),
    );

    group('ActivityFeedbackEvent', () {
      activityTest(
        'ActivityFeedbackEvent - should mark activity hidden',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(hidden: false),
        ),
        body: (tester) async {
          expect(tester.activityState.activity?.hidden, false);

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

          expect(tester.activityState.activity?.hidden, true);
        },
      );

      activityTest(
        'ActivityFeedbackEvent - should mark activity unhidden',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(hidden: true),
        ),
        body: (tester) async {
          expect(tester.activityState.activity?.hidden, true);

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

          expect(tester.activityState.activity?.hidden, false);
        },
      );
    });

    group('Activity Events', () {
      activityTest(
        'ActivityUpdatedEvent - should update activity',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.type, 'post');

          await tester.emitEvent(
            ActivityUpdatedEvent(
              type: EventTypes.activityUpdated,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(
                id: activityId,
                type: 'share',
              ),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.type, 'share');
        },
      );

      activityTest(
        'ActivityDeletedEvent - should delete activity',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyCommentsResponse: (response) => response.copyWith(
            comments: [
              createDefaultThreadedCommentResponse(
                id: 'comment-1',
                objectId: activityId,
                objectType: 'activity',
              ),
            ],
          ),
        ),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(tester.activityState.comments, hasLength(1));

          await tester.emitEvent(
            ActivityDeletedEvent(
              type: EventTypes.activityDeleted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(id: activityId),
            ),
          );

          final deletedActivity = tester.activityState.activity;
          expect(deletedActivity, isNull);
          expect(tester.activityState.comments, isEmpty);
        },
      );

      activityTest(
        'ActivityDeletedEvent - should not delete activity for different activity',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);

          await tester.emitEvent(
            ActivityDeletedEvent(
              type: EventTypes.activityDeleted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(id: 'different-activity'),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.id, activityId);
        },
      );
    });

    activityTest(
      'pin - should pin activity via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.pinActivity(
            activityId: activityId,
            feedGroupId: fid.group,
            feedId: fid.id,
          ),
          result: PinActivityResponse(
            activity: createDefaultActivityResponse(id: activityId),
            createdAt: DateTime.timestamp(),
            duration: DateTime.timestamp().toIso8601String(),
            feed: fid.rawValue,
            userId: 'user-id',
          ),
        );

        final result = await tester.activity.pin();

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.pinActivity(
          activityId: activityId,
          feedGroupId: fid.group,
          feedId: fid.id,
        ),
      ),
    );

    activityTest(
      'unpin - should unpin activity via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        tester.mockApi(
          (api) => api.unpinActivity(
            activityId: activityId,
            feedGroupId: fid.group,
            feedId: fid.id,
          ),
          result: UnpinActivityResponse(
            activity: createDefaultActivityResponse(id: activityId),
            duration: DateTime.timestamp().toIso8601String(),
            feed: fid.rawValue,
            userId: 'user-id',
          ),
        );

        final result = await tester.activity.unpin();

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.unpinActivity(
          activityId: activityId,
          feedGroupId: fid.group,
          feedId: fid.id,
        ),
      ),
    );
  });

  // ============================================================
  // FEATURE: Comments
  // ============================================================

  group('Activity - Comments', () {
    const commentId = 'comment-test-1';
    const userId = 'luke_skywalker';

    setUpAll(() {
      registerFallbackValue(
        const AddCommentsBatchRequest(comments: []),
      );
    });

    activityTest(
      'addComment - should add comment to activity via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addComment(
            addCommentRequest: any(named: 'addCommentRequest'),
          ),
          result: createDefaultAddCommentResponse(
            commentId: commentId,
            objectId: activityId,
            userId: userId,
            text: 'Test comment',
          ),
        );

        // Initial state - no comments
        expect(tester.activityState.comments, isEmpty);

        // Add comment
        final result = await tester.activity.addComment(
          request: const ActivityAddCommentRequest(
            activityId: activityId,
            comment: 'Test comment',
          ),
        );

        expect(result.isSuccess, isTrue);
        final comment = result.getOrNull();
        expect(comment, isNotNull);
        expect(comment!.id, commentId);
        expect(comment.text, 'Test comment');
        expect(comment.user.id, userId);

        // Note: addComment updates state automatically via onCommentAdded
        await tester.pumpEventQueue();
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.id, commentId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addComment(
          addCommentRequest: any(named: 'addCommentRequest'),
        ),
      ),
    );

    activityTest(
      'addComment - should handle both API call and event together',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Initial state - no comments
        expect(tester.activityState.comments, isEmpty);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addComment(
            addCommentRequest: any(named: 'addCommentRequest'),
          ),
          result: createDefaultAddCommentResponse(
            commentId: commentId,
            objectId: activityId,
            userId: userId,
            text: 'Test comment',
          ),
        );

        // Add comment via API
        final result = await tester.activity.addComment(
          request: const ActivityAddCommentRequest(
            activityId: activityId,
            comment: 'Test comment',
          ),
        );
        expect(result.isSuccess, isTrue);

        // Also emit event (simulating real-time update)
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid.rawValue,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has comment (should not duplicate)
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.id, commentId);
      },
    );

    activityTest(
      'deleteComment - should delete comment via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.id, commentId);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteComment(
            id: commentId,
            hardDelete: any(named: 'hardDelete'),
          ),
          result: createDefaultDeleteCommentResponse(
            commentId: commentId,
            activityId: activityId,
            objectId: activityId,
            userId: userId,
          ),
        );

        // Delete comment
        final result = await tester.activity.deleteComment(commentId);

        expect(result.isSuccess, isTrue);

        // Note: deleteComment updates state automatically via onCommentRemoved
        await tester.pumpEventQueue();
        expect(tester.activityState.comments, isEmpty);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteComment(
          id: commentId,
          hardDelete: any(named: 'hardDelete'),
        ),
      ),
    );

    activityTest(
      'updateComment - should update comment via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Original comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.text, 'Original comment');

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.updateComment(
            id: commentId,
            updateCommentRequest: any(named: 'updateCommentRequest'),
          ),
          result: createDefaultUpdateCommentResponse(
            commentId: commentId,
            objectId: activityId,
            text: 'Updated comment',
            userId: userId,
          ),
        );

        // Update comment
        final result = await tester.activity.updateComment(
          commentId,
          const ActivityUpdateCommentRequest(
            comment: 'Updated comment',
          ),
        );

        expect(result.isSuccess, isTrue);
        final updatedComment = result.getOrNull();
        expect(updatedComment, isNotNull);
        expect(updatedComment!.text, 'Updated comment');

        // Note: updateComment updates state automatically via onCommentUpdated
        await tester.pumpEventQueue();
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.text, 'Updated comment');
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.updateComment(
          id: commentId,
          updateCommentRequest: any(named: 'updateCommentRequest'),
        ),
      ),
    );

    activityTest(
      'addCommentsBatch - should add multiple comments via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        const commentId1 = 'comment-1';
        const commentId2 = 'comment-2';

        tester.mockApi(
          (api) => api.addCommentsBatch(
            addCommentsBatchRequest: any(named: 'addCommentsBatchRequest'),
          ),
          result: AddCommentsBatchResponse(
            duration: DateTime.timestamp().toIso8601String(),
            comments: [
              createDefaultCommentResponse(
                id: commentId1,
                objectId: activityId,
                objectType: 'activity',
                userId: userId,
                text: 'First comment',
              ),
              createDefaultCommentResponse(
                id: commentId2,
                objectId: activityId,
                objectType: 'activity',
                userId: userId,
                text: 'Second comment',
              ),
            ],
          ),
        );

        final result = await tester.activity.addCommentsBatch([
          const ActivityAddCommentRequest(
            activityId: activityId,
            comment: 'First comment',
          ),
          const ActivityAddCommentRequest(
            activityId: activityId,
            comment: 'Second comment',
          ),
        ]);

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, hasLength(2));
        expect(comments!.first.id, commentId1);
        expect(comments.last.id, commentId2);

        // Verify state was updated via onCommentAdded
        await tester.pumpEventQueue();
        expect(tester.activityState.comments, hasLength(2));
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addCommentsBatch(
          addCommentsBatchRequest: any(named: 'addCommentsBatchRequest'),
        ),
      ),
    );
  });

  // ============================================================
  // FEATURE: Comment Reactions
  // ============================================================

  group('Activity - Comment Reactions', () {
    const commentId = 'comment-test-1';
    const userId = 'luke_skywalker';
    const reactionType = 'heart';

    setUpAll(() {
      registerFallbackValue(const AddCommentReactionRequest(type: 'like'));
    });

    activityTest(
      'addCommentReaction - should add reaction to comment via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has no reactions
        final initialComment = tester.activityState.comments.first;
        expect(initialComment.id, commentId);
        expect(initialComment.ownReactions, isEmpty);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addCommentReaction(
            id: commentId,
            addCommentReactionRequest: any(named: 'addCommentReactionRequest'),
          ),
          result: createDefaultAddCommentReactionResponse(
            commentId: commentId,
            objectId: activityId,
            userId: userId,
            reactionType: reactionType,
          ),
        );

        // Add reaction
        final result = await tester.activity.addCommentReaction(
          commentId: commentId,
          request: const AddCommentReactionRequest(type: reactionType),
        );

        expect(result.isSuccess, isTrue);
        final reaction = result.getOrNull();
        expect(reaction, isNotNull);
        expect(reaction!.type, reactionType);
        expect(reaction.user.id, userId);

        // Note: addCommentReaction updates state automatically via onCommentReactionAdded
        await tester.pumpEventQueue();
        final updatedComment = tester.activityState.comments.first;
        expect(updatedComment.ownReactions, hasLength(1));
        expect(updatedComment.ownReactions.first.type, reactionType);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.addCommentReaction(
          id: commentId,
          addCommentReactionRequest: any(named: 'addCommentReactionRequest'),
        ),
      ),
    );

    activityTest(
      'addCommentReaction - should handle both API call and event together',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has no reactions
        final initialComment = tester.activityState.comments.first;
        expect(initialComment.ownReactions, isEmpty);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.addCommentReaction(
            id: commentId,
            addCommentReactionRequest: any(named: 'addCommentReactionRequest'),
          ),
          result: createDefaultAddCommentReactionResponse(
            commentId: commentId,
            objectId: activityId,
            userId: userId,
            reactionType: reactionType,
          ),
        );

        // Add reaction via API
        final result = await tester.activity.addCommentReaction(
          commentId: commentId,
          request: const AddCommentReactionRequest(type: reactionType),
        );
        expect(result.isSuccess, isTrue);

        // Also emit event (simulating real-time update)
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid.rawValue,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              activityId: activityId,
              commentId: commentId,
            ),
          ),
        );

        // Verify state has reaction (should not duplicate)
        final updatedComment = tester.activityState.comments.first;
        expect(updatedComment.ownReactions, hasLength(1));
        expect(updatedComment.ownReactions.first.type, reactionType);
      },
    );

    activityTest(
      'deleteCommentReaction - should delete reaction from comment via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyCommentsResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: reactionType,
                  userId: userId,
                  activityId: activityId,
                  commentId: commentId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has reaction
        final initialComment = tester.activityState.comments.first;
        expect(initialComment.ownReactions, hasLength(1));
        expect(initialComment.ownReactions.first.type, reactionType);

        // Mock API call that will be used
        tester.mockApi(
          (api) => api.deleteCommentReaction(
            id: commentId,
            type: reactionType,
          ),
          result: createDefaultDeleteCommentReactionResponse(
            commentId: commentId,
            objectId: activityId,
            userId: userId,
            reactionType: reactionType,
          ),
        );

        // Delete reaction
        final result = await tester.activity.deleteCommentReaction(
          commentId,
          reactionType,
        );

        expect(result.isSuccess, isTrue);

        // Note: deleteCommentReaction updates state automatically via onCommentReactionRemoved
        await tester.pumpEventQueue();
        final updatedComment = tester.activityState.comments.first;
        expect(updatedComment.ownReactions, isEmpty);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.deleteCommentReaction(
          id: commentId,
          type: reactionType,
        ),
      ),
    );
  });

  // ============================================================
  // FEATURE: Activity Reactions
  // ============================================================

  group('Activity - Reactions', () {
    const currentUser = User(id: 'test_user');

    group('Activity Reactions', () {
      activityTest(
        'ActivityReactionAddedEvent - should add reaction to activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownReactions, isEmpty);

          await tester.emitEvent(
            ActivityReactionAddedEvent(
              type: EventTypes.activityReactionAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(id: activityId),
              reaction: createDefaultReactionResponse(
                reactionType: 'love',
                userId: currentUser.id,
                activityId: activityId,
              ),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownReactions, hasLength(1));

          expect(updatedActivity.ownReactions.first.type, 'love');
        },
      );

      activityTest(
        'ActivityReactionUpdatedEvent - should replace user reaction',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            ownReactions: [
              createDefaultReactionResponse(
                reactionType: 'wow',
                userId: currentUser.id,
                activityId: activityId,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has 'wow' reaction
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownReactions, hasLength(1));
          expect(activity.ownReactions.first.type, 'wow');

          // Emit ActivityReactionUpdatedEvent - replaces 'wow' with 'fire'
          await tester.emitEvent(
            ActivityReactionUpdatedEvent(
              type: EventTypes.activityReactionUpdated,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(
                id: activityId,
                latestReactions: [
                  createDefaultReactionResponse(
                    reactionType: 'fire',
                    userId: currentUser.id,
                    activityId: activityId,
                  ),
                ],
              ),
              reaction: createDefaultReactionResponse(
                reactionType: 'fire',
                userId: currentUser.id,
                activityId: activityId,
              ),
            ),
          );

          // Verify 'wow' was replaced with 'fire'
          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownReactions, hasLength(1));
          expect(updatedActivity.ownReactions.first.type, 'fire');
        },
      );

      activityTest(
        'ActivityReactionDeletedEvent - should remove reaction from activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            ownReactions: [
              createDefaultReactionResponse(
                reactionType: 'love',
                userId: currentUser.id,
                activityId: activityId,
              ),
            ],
          ),
        ),
        body: (tester) async {
          // Initial state - has 'love' reaction
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownReactions, hasLength(1));
          expect(activity.ownReactions.first.type, 'love');

          // Emit ActivityReactionDeletedEvent
          await tester.emitEvent(
            ActivityReactionDeletedEvent(
              type: EventTypes.activityReactionDeleted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(id: activityId),
              reaction: createDefaultReactionResponse(
                reactionType: 'love',
                userId: currentUser.id,
                activityId: activityId,
              ),
            ),
          );

          // Verify reaction was removed
          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownReactions, isEmpty);
        },
      );

      activityTest(
        'ActivityReactionAddedEvent - should not add reaction for different activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownReactions, isEmpty);

          await tester.emitEvent(
            ActivityReactionAddedEvent(
              type: EventTypes.activityReactionAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              activity: createDefaultActivityResponse(id: 'different-activity'),
              reaction: createDefaultReactionResponse(
                reactionType: 'love',
                userId: currentUser.id,
                activityId: 'different-activity',
              ),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownReactions, isEmpty);
        },
      );
    });
  });

  // ============================================================
  // FEATURE: Bookmarks
  // ============================================================

  group('Activity - Bookmarks', () {
    const currentUser = User(id: 'test_user');

    group('Activity Bookmarks', () {
      activityTest(
        'BookmarkAddedEvent - should add bookmark to activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownBookmarks, isEmpty);

          await tester.emitEvent(
            BookmarkAddedEvent(
              type: EventTypes.bookmarkAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                activityId: activityId,
                userId: currentUser.id,
              ),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownBookmarks, hasLength(1));
        },
      );

      activityTest(
        'BookmarkUpdatedEvent - should update bookmark on activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);

          final existingBookmark = createDefaultBookmarkResponse(
            activityId: activityId,
            userId: currentUser.id,
          );

          // First add a bookmark
          await tester.emitEvent(
            BookmarkAddedEvent(
              type: EventTypes.bookmarkAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: existingBookmark,
            ),
          );

          // Then update it
          final updatedBookmark = existingBookmark.copyWith(
            custom: const {'updated': true},
          );

          await tester.emitEvent(
            BookmarkUpdatedEvent(
              type: EventTypes.bookmarkUpdated,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: updatedBookmark,
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownBookmarks, hasLength(1));

          final bookmarkModel = updatedBookmark.toModel();
          final foundBookmark = updatedActivity.ownBookmarks.firstWhere(
            (b) => b.id == bookmarkModel.id,
          );
          expect(foundBookmark.custom?['updated'], isTrue);
        },
      );

      activityTest(
        'BookmarkDeletedEvent - should remove bookmark from activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);

          final bookmark = createDefaultBookmarkResponse(
            activityId: activityId,
            userId: currentUser.id,
          );

          // First add a bookmark
          await tester.emitEvent(
            BookmarkAddedEvent(
              type: EventTypes.bookmarkAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: bookmark,
            ),
          );

          // Verify bookmark was added
          var updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownBookmarks, hasLength(1));

          // Then remove it
          await tester.emitEvent(
            BookmarkDeletedEvent(
              type: EventTypes.bookmarkDeleted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: bookmark,
            ),
          );

          updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownBookmarks, isEmpty);
        },
      );

      activityTest(
        'BookmarkAddedEvent - should not add bookmark for different activity',
        user: currentUser,
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(),
        body: (tester) async {
          final activity = tester.activityState.activity;
          expect(activity, isNotNull);
          expect(activity!.ownBookmarks, isEmpty);

          await tester.emitEvent(
            BookmarkAddedEvent(
              type: EventTypes.bookmarkAdded,
              createdAt: DateTime.timestamp(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                activityId: 'different-activity',
                userId: currentUser.id,
              ),
            ),
          );

          final updatedActivity = tester.activityState.activity;
          expect(updatedActivity, isNotNull);
          expect(updatedActivity!.ownBookmarks, isEmpty);
        },
      );
    });
  });

  // ============================================================
  // FEATURE: Polls
  // ============================================================

  group('Activity - Polls', () {
    activityTest(
      'closePoll - should close poll via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.updatePollPartial(
            pollId: pollId,
            updatePollPartialRequest: const UpdatePollPartialRequest(
              set: {'is_closed': true},
            ),
          ),
          result: PollResponse(
            poll: createDefaultPollResponse(
              id: pollId,
            ).copyWith(isClosed: true),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.closePoll();

        expect(result.isSuccess, isTrue);
        final poll = result.getOrNull();
        expect(poll, isNotNull);
        expect(poll!.isClosed, isTrue);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.updatePollPartial(
            pollId: pollId,
            updatePollPartialRequest: const UpdatePollPartialRequest(
              set: {'is_closed': true},
            ),
          ),
        );
      },
    );

    activityTest(
      'deletePoll - should delete poll via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.deletePoll(pollId: pollId),
          result: DurationResponse(
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.deletePoll();

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi((api) => api.deletePoll(pollId: pollId));
      },
    );

    activityTest(
      'updatePollPartial - should update poll partially via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.updatePollPartial(
            pollId: pollId,
            updatePollPartialRequest: const UpdatePollPartialRequest(
              set: {'name': 'Updated Poll Name'},
            ),
          ),
          result: PollResponse(
            poll: createDefaultPollResponse(
              id: pollId,
            ).copyWith(name: 'Updated Poll Name'),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.updatePollPartial(
          const UpdatePollPartialRequest(set: {'name': 'Updated Poll Name'}),
        );

        expect(result.isSuccess, isTrue);
        final poll = result.getOrNull();
        expect(poll, isNotNull);
        expect(poll!.name, 'Updated Poll Name');
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.updatePollPartial(
            pollId: pollId,
            updatePollPartialRequest: const UpdatePollPartialRequest(
              set: {'name': 'Updated Poll Name'},
            ),
          ),
        );
      },
    );

    activityTest(
      'updatePoll - should update poll via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.updatePoll(
            updatePollRequest: UpdatePollRequest(
              id: pollId,
              name: 'Updated Poll Name',
            ),
          ),
          result: PollResponse(
            poll: createDefaultPollResponse(
              id: pollId,
            ).copyWith(name: 'Updated Poll Name'),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.updatePoll(
          UpdatePollRequest(
            id: pollId,
            name: 'Updated Poll Name',
          ),
        );

        expect(result.isSuccess, isTrue);
        final poll = result.getOrNull();
        expect(poll, isNotNull);
        expect(poll!.name, 'Updated Poll Name');
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.updatePoll(
            updatePollRequest: UpdatePollRequest(
              id: pollId,
              name: 'Updated Poll Name',
            ),
          ),
        );
      },
    );

    activityTest(
      'createPollOption - should create poll option via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        const optionId = 'option-new';
        const optionText = 'New Option';

        tester.mockApi(
          (api) => api.createPollOption(
            pollId: pollId,
            createPollOptionRequest: const CreatePollOptionRequest(
              text: optionText,
            ),
          ),
          result: PollOptionResponse(
            pollOption: createDefaultPollOptionResponse(
              id: optionId,
              text: optionText,
            ),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.createPollOption(
          const CreatePollOptionRequest(text: optionText),
        );

        expect(result.isSuccess, isTrue);
        final option = result.getOrNull();
        expect(option, isNotNull);
        expect(option!.text, optionText);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.createPollOption(
            pollId: pollId,
            createPollOptionRequest: const CreatePollOptionRequest(
              text: 'New Option',
            ),
          ),
        );
      },
    );

    activityTest(
      'deletePollOption - should delete poll option via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(
            options: [
              createDefaultPollOptionResponse(
                id: 'option-1',
                text: 'Option 1',
              ),
            ],
          ),
        ),
      ),
      body: (tester) async {
        const optionId = 'option-1';
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.deletePollOption(
            pollId: pollId,
            optionId: optionId,
          ),
          result: DurationResponse(
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.deletePollOption(
          optionId: optionId,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.deletePollOption(
            pollId: pollId,
            optionId: 'option-1',
          ),
        );
      },
    );

    activityTest(
      'updatePollOption - should update poll option via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(
            options: [
              createDefaultPollOptionResponse(
                id: 'option-1',
                text: 'Option 1',
              ),
            ],
          ),
        ),
      ),
      body: (tester) async {
        const optionId = 'option-1';
        final pollId = tester.activityState.poll?.id;
        expect(pollId, isNotNull);

        tester.mockApi(
          (api) => api.updatePollOption(
            pollId: pollId!,
            updatePollOptionRequest: const UpdatePollOptionRequest(
              id: optionId,
              text: 'Updated Option Text',
            ),
          ),
          result: PollOptionResponse(
            pollOption: createDefaultPollOptionResponse(
              id: optionId,
              text: 'Updated Option Text',
            ),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.updatePollOption(
          const UpdatePollOptionRequest(
            id: optionId,
            text: 'Updated Option Text',
          ),
        );

        expect(result.isSuccess, isTrue);
        final option = result.getOrNull();
        expect(option, isNotNull);
        expect(option!.text, 'Updated Option Text');
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.updatePollOption(
            pollId: pollId,
            updatePollOptionRequest: const UpdatePollOptionRequest(
              id: 'option-1',
              text: 'Updated Option Text',
            ),
          ),
        );
      },
    );

    activityTest(
      'castPollVote - should cast poll vote via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(
            options: [
              createDefaultPollOptionResponse(
                id: 'option-1',
                text: 'Option 1',
              ),
            ],
          ),
        ),
      ),
      body: (tester) async {
        final pollId = tester.activityState.poll!.id;

        const optionId = 'option-1';

        tester.mockApi(
          (api) => api.castPollVote(
            pollId: pollId,
            activityId: activityId,
            castPollVoteRequest: const CastPollVoteRequest(
              vote: VoteData(optionId: optionId),
            ),
          ),
          result: PollVoteResponse(
            vote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: pollId,
              optionId: optionId,
            ),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.castPollVote(
          const CastPollVoteRequest(vote: VoteData(optionId: optionId)),
        );

        expect(result.isSuccess, isTrue);
        final vote = result.getOrNull();
        expect(vote, isNotNull);
        expect(vote!.id, 'vote-1');
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.castPollVote(
            pollId: pollId,
            activityId: activityId,
            castPollVoteRequest: const CastPollVoteRequest(
              vote: VoteData(optionId: 'option-1'),
            ),
          ),
        );
      },
    );

    activityTest(
      'deletePollVote - should delete poll vote via API',
      build: (client) => client.activity(activityId: activityId, fid: fid),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          poll: createDefaultPollResponse(),
        ),
      ),
      body: (tester) async {
        const voteId = 'vote-1';
        final pollId = tester.activityState.poll!.id;

        tester.mockApi(
          (api) => api.deletePollVote(
            activityId: activityId,
            pollId: pollId,
            voteId: voteId,
          ),
          result: PollVoteResponse(
            vote: createDefaultPollVoteResponse(
              id: voteId,
              pollId: pollId,
            ),
            duration: DateTime.timestamp().toIso8601String(),
          ),
        );

        final result = await tester.activity.deletePollVote(voteId: voteId);

        expect(result.isSuccess, isTrue);
        final vote = result.getOrNull();
        expect(vote, isNotNull);
        expect(vote!.id, voteId);
      },
      verify: (tester) {
        final pollId = tester.activityState.poll!.id;
        tester.verifyApi(
          (api) => api.deletePollVote(
            activityId: activityId,
            pollId: pollId,
            voteId: 'vote-1',
          ),
        );
      },
    );

    group('Poll Events', () {
      final defaultPoll = createDefaultPollResponse();

      activityTest(
        'poll closed',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: defaultPoll),
        ),
        body: (tester) async {
          expect(tester.activityState.poll?.isClosed, false);

          await tester.emitEvent(
            PollClosedFeedEvent(
              type: EventTypes.pollClosed,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              poll: defaultPoll.copyWith(isClosed: true),
            ),
          );

          expect(tester.activityState.poll?.isClosed, true);
        },
      );

      activityTest(
        'poll deleted',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: defaultPoll),
        ),
        body: (tester) async {
          expect(tester.activityState.poll, isNotNull);

          await tester.emitEvent(
            PollDeletedFeedEvent(
              type: EventTypes.pollDeleted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              poll: defaultPoll,
            ),
          );

          expect(tester.activityState.poll, isNull);
        },
      );

      activityTest(
        'poll updated',
        build: (client) => client.activity(activityId: activityId, fid: fid),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: defaultPoll),
        ),
        body: (tester) async {
          final poll = tester.activityState.poll!;
          expect(poll.name, 'name');

          await tester.emitEvent(
            PollUpdatedFeedEvent(
              type: EventTypes.pollUpdated,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: fid.rawValue,
              poll: defaultPoll.copyWith(name: 'Updated Poll Name'),
            ),
          );

          final updatedPoll = tester.activityState.poll;
          expect(updatedPoll, isNotNull);
          expect(updatedPoll!.name, 'Updated Poll Name');
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
            createDefaultPollVoteResponse(id: 'vote-2', optionId: 'option-1'),
            createDefaultPollVoteResponse(id: 'vote-3', optionId: 'option-2'),
          ],
        );

        activityTest(
          'poll vote casted',
          build: (client) => client.activity(activityId: activityId, fid: fid),
          setUp: (tester) => tester.get(
            modifyResponse: (it) => it.copyWith(poll: pollWithVotes),
          ),
          body: (tester) async {
            // Initial state - has 3 votes
            final initialPoll = tester.activityState.poll!;
            expect(initialPoll.voteCount, 3);
            expect(initialPoll.latestVotesByOption, hasLength(2));
            expect(initialPoll.latestVotesByOption['option-2'], hasLength(1));

            final newVote = createDefaultPollVoteResponse(
              id: 'vote-4',
              pollId: initialPoll.id,
              optionId: 'option-2',
            );

            // Emit PollVoteCastedFeedEvent
            await tester.emitEvent(
              PollVoteCastedFeedEvent(
                type: EventTypes.pollVoteCasted,
                createdAt: DateTime.timestamp(),
                custom: const {},
                fid: fid.rawValue,
                pollVote: newVote,
                poll: createDefaultPollResponse(
                  options: pollWithVotes.options,
                  ownVotesAndAnswers: [
                    createDefaultPollVoteResponse(
                      id: 'vote-1',
                      optionId: 'option-1',
                    ),
                    createDefaultPollVoteResponse(
                      id: 'vote-2',
                      optionId: 'option-1',
                    ),
                    createDefaultPollVoteResponse(
                      id: 'vote-3',
                      optionId: 'option-2',
                    ),
                    newVote,
                  ],
                ),
              ),
            );

            // Verify vote was added
            final updatedPoll = tester.activityState.poll!;
            expect(updatedPoll.voteCount, 4);
            expect(updatedPoll.latestVotesByOption, hasLength(2));
            expect(updatedPoll.latestVotesByOption['option-2'], hasLength(2));
          },
        );

        activityTest(
          'poll vote changed',
          build: (client) => client.activity(activityId: activityId, fid: fid),
          setUp: (tester) => tester.get(
            modifyResponse: (it) => it.copyWith(
              poll: createDefaultPollResponse(
                options: pollWithVotes.options,
                ownVotesAndAnswers: [
                  createDefaultPollVoteResponse(
                    id: 'vote-1',
                    optionId: 'option-1',
                  ),
                ],
              ),
            ),
          ),
          body: (tester) async {
            // Initial state - has one vote on option-1
            final initialPoll = tester.activityState.poll!;
            expect(initialPoll.voteCount, 1);
            expect(initialPoll.latestVotesByOption['option-1'], hasLength(1));

            final changedVote = createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: initialPoll.id,
              optionId: 'option-2',
            );

            // Emit PollVoteChangedFeedEvent
            await tester.emitEvent(
              PollVoteChangedFeedEvent(
                type: EventTypes.pollVoteChanged,
                createdAt: DateTime.timestamp(),
                custom: const {},
                fid: fid.rawValue,
                pollVote: changedVote,
                poll: createDefaultPollResponse(
                  options: pollWithVotes.options,
                  ownVotesAndAnswers: [changedVote],
                ),
              ),
            );

            // Verify vote was changed
            final updatedPoll = tester.activityState.poll!;
            expect(updatedPoll.voteCount, 1);
            expect(updatedPoll.latestVotesByOption['option-1'], isNull);
            expect(updatedPoll.latestVotesByOption['option-2'], hasLength(1));
          },
        );

        activityTest(
          'poll vote removed',
          build: (client) => client.activity(activityId: activityId, fid: fid),
          setUp: (tester) => tester.get(
            modifyResponse: (it) => it.copyWith(
              poll: createDefaultPollResponse(
                options: pollWithVotes.options,
                ownVotesAndAnswers: [
                  createDefaultPollVoteResponse(
                    id: 'vote-1',
                    optionId: 'option-1',
                  ),
                ],
              ),
            ),
          ),
          body: (tester) async {
            // Initial state - has one vote on option-1
            final initialPoll = tester.activityState.poll!;
            expect(initialPoll.voteCount, 1);
            expect(initialPoll.latestVotesByOption['option-1'], hasLength(1));

            final voteToRemove = createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: initialPoll.id,
              optionId: 'option-1',
            );

            // Emit PollVoteRemovedFeedEvent
            await tester.emitEvent(
              PollVoteRemovedFeedEvent(
                type: EventTypes.pollVoteRemoved,
                createdAt: DateTime.timestamp(),
                custom: const {},
                fid: fid.rawValue,
                pollVote: voteToRemove,
                poll: createDefaultPollResponse(
                  options: pollWithVotes.options,
                  ownVotesAndAnswers: [],
                ),
              ),
            );

            // Verify vote was removed
            final updatedPoll = tester.activityState.poll!;
            expect(updatedPoll.voteCount, 0);
            expect(updatedPoll.latestVotesByOption['option-1'], isNull);
          },
        );
      });

      group('Answer operations', () {
        final pollWithAnswers = createDefaultPollResponse(
          ownVotesAndAnswers: [
            createDefaultPollAnswerResponse(id: 'answer-1'),
            createDefaultPollAnswerResponse(id: 'answer-2'),
            createDefaultPollAnswerResponse(id: 'answer-3'),
          ],
        );

        activityTest(
          'poll answer casted',
          build: (client) => client.activity(activityId: activityId, fid: fid),
          setUp: (tester) => tester.get(
            modifyResponse: (it) => it.copyWith(poll: pollWithAnswers),
          ),
          body: (tester) async {
            // Initial state - has 3 answers
            final initialPoll = tester.activityState.poll!;
            expect(initialPoll.answersCount, 3);
            expect(initialPoll.latestAnswers, hasLength(3));

            final newAnswer = createDefaultPollAnswerResponse(
              id: 'answer-4',
              pollId: initialPoll.id,
              answerText: 'Answer 4',
            );

            // Emit PollVoteCastedFeedEvent (resolved to PollAnswerCastedFeedEvent)
            await tester.emitEvent(
              PollVoteCastedFeedEvent(
                type: EventTypes.pollVoteCasted,
                createdAt: DateTime.timestamp(),
                custom: const {},
                fid: fid.rawValue,
                pollVote: newAnswer,
                poll: createDefaultPollResponse(
                  ownVotesAndAnswers: [
                    createDefaultPollAnswerResponse(id: 'answer-1'),
                    createDefaultPollAnswerResponse(id: 'answer-2'),
                    createDefaultPollAnswerResponse(id: 'answer-3'),
                    newAnswer,
                  ],
                ),
              ),
            );

            // Verify answer was added
            final updatedPoll = tester.activityState.poll!;
            expect(updatedPoll.answersCount, 4);
            expect(updatedPoll.latestAnswers, hasLength(4));
          },
        );

        activityTest(
          'poll answer removed',
          build: (client) => client.activity(activityId: activityId, fid: fid),
          setUp: (tester) => tester.get(
            modifyResponse: (it) => it.copyWith(
              poll: createDefaultPollResponse(
                ownVotesAndAnswers: [
                  createDefaultPollAnswerResponse(id: 'answer-1'),
                ],
              ),
            ),
          ),
          body: (tester) async {
            // Initial state - has one answer
            final initialPoll = tester.activityState.poll!;
            expect(initialPoll.answersCount, 1);
            expect(initialPoll.latestAnswers, hasLength(1));

            final answerToRemove = createDefaultPollAnswerResponse(
              id: 'answer-1',
              pollId: initialPoll.id,
            );

            // Emit PollVoteRemovedFeedEvent (resolved to PollAnswerRemovedFeedEvent)
            await tester.emitEvent(
              PollVoteRemovedFeedEvent(
                type: EventTypes.pollVoteRemoved,
                createdAt: DateTime.timestamp(),
                custom: const {},
                fid: fid.rawValue,
                pollVote: answerToRemove,
                poll: createDefaultPollResponse(
                  ownVotesAndAnswers: [],
                ),
              ),
            );

            // Verify answer was removed
            final updatedPoll = tester.activityState.poll!;
            expect(updatedPoll.answersCount, 0);
            expect(updatedPoll.latestAnswers, isEmpty);
          },
        );
      });
    });
  });
}
