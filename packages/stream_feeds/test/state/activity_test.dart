import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  const activityId = 'activity-1';
  const feedId = FeedId(group: 'user', id: 'john');

  // ============================================================
  // FEATURE: Activity Retrieval
  // ============================================================

  group('Getting an activity', () {
    activityTest(
      'fetch activity and comments',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<ActivityData>>());
        expect(result.getOrNull()?.id, activityId);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.getActivity(id: activityId),
      ),
    );
  });

  // ============================================================
  // FEATURE: Activity Feedback
  // ============================================================

  group('Activity feedback', () {
    activityTest(
      'submits feedback via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

    activityTest(
      'marks activity hidden on ActivityFeedbackEvent',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
      'marks activity unhidden on ActivityFeedbackEvent',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

  // ============================================================
  // FEATURE: Poll Events
  // ============================================================

  group('Poll events', () {
    group('Vote operations', () {
      final pollWithVotes = createDefaultPollResponse(
        options: [
          createDefaultPollOptionResponse(id: 'option-1', text: 'Option 1'),
          createDefaultPollOptionResponse(id: 'option-2', text: 'Option 2'),
        ],
        latestVotesByOption: {
          'option-1': [
            createDefaultPollVoteResponse(id: 'vote-1', optionId: 'option-1'),
            createDefaultPollVoteResponse(id: 'vote-2', optionId: 'option-1'),
          ],
          'option-2': [
            createDefaultPollVoteResponse(id: 'vote-3', optionId: 'option-2'),
          ],
        },
      );

      activityTest(
        'poll vote casted',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: pollWithVotes),
        ),
        body: (tester) async {
          final pollData = tester.activityState.poll;
          expect(pollData!.voteCount, 3);

          expect(pollData.latestVotesByOption, hasLength(2));
          expect(pollData.latestVotesByOption['option-2'], hasLength(1));

          final pollVote = createDefaultPollVoteResponse(
            id: 'vote-4',
            pollId: pollData.id,
            optionId: 'option-2',
          );

          await tester.emitEvent(
            PollVoteCastedFeedEvent(
              type: EventTypes.pollVoteCasted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              pollVote: pollVote,
              poll: pollWithVotes.copyWith(
                voteCount: 4,
                latestVotesByOption: {
                  ...pollWithVotes.latestVotesByOption,
                  pollVote.optionId: List<PollVoteResponseData>.from(
                    pollWithVotes.latestVotesByOption[pollVote.optionId]!,
                  )..add(pollVote),
                },
              ),
            ),
          );

          final updatedPollData = tester.activityState.poll;
          expect(updatedPollData!.voteCount, 4);

          expect(updatedPollData.latestVotesByOption, hasLength(2));
          expect(updatedPollData.latestVotesByOption['option-2'], hasLength(2));
        },
      );

      activityTest(
        'poll vote removed',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: pollWithVotes),
        ),
        body: (tester) async {
          final pollData = tester.activityState.poll;
          expect(pollData!.voteCount, 3);

          expect(pollData.latestVotesByOption, hasLength(2));
          expect(pollData.latestVotesByOption['option-1'], hasLength(2));

          final voteToRemove = createDefaultPollVoteResponse(
            id: 'vote-1',
            pollId: pollData.id,
            optionId: 'option-1',
          );

          await tester.emitEvent(
            PollVoteRemovedFeedEvent(
              type: EventTypes.pollVoteRemoved,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              pollVote: voteToRemove,
              poll: pollWithVotes.copyWith(
                voteCount: 2,
                latestVotesByOption: {
                  ...pollWithVotes.latestVotesByOption,
                  voteToRemove.optionId: List<PollVoteResponseData>.from(
                    pollWithVotes.latestVotesByOption[voteToRemove.optionId]!,
                  )..removeWhere((vote) => vote.id == voteToRemove.id),
                },
              ),
            ),
          );

          final updatedPollData = tester.activityState.poll;
          expect(updatedPollData!.voteCount, 2);

          expect(updatedPollData.latestVotesByOption, hasLength(2));
          expect(updatedPollData.latestVotesByOption['option-1'], hasLength(1));
        },
      );
    });

    group('Answer operations', () {
      final pollWithAnswers = createDefaultPollResponse(
        latestAnswers: [
          createDefaultPollAnswerResponse(id: 'answer-1'),
          createDefaultPollAnswerResponse(id: 'answer-2'),
          createDefaultPollAnswerResponse(id: 'answer-3'),
        ],
      );

      activityTest(
        'poll answer casted',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: pollWithAnswers),
        ),
        body: (tester) async {
          final pollData = tester.activityState.poll;
          expect(pollData!.answersCount, 3);

          expect(pollData.latestAnswers, hasLength(3));

          final newAnswer = createDefaultPollAnswerResponse(
            id: 'answer-4',
            pollId: pollData.id,
            answerText: 'Answer 4',
          );

          await tester.emitEvent(
            PollVoteCastedFeedEvent(
              type: EventTypes.pollVoteCasted,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              pollVote: newAnswer,
              poll: pollWithAnswers.copyWith(
                answersCount: 4,
                latestAnswers: List<PollVoteResponseData>.from(
                  pollWithAnswers.latestAnswers,
                )..add(newAnswer),
              ),
            ),
          );

          final updatedPollData = tester.activityState.poll;
          expect(updatedPollData!.answersCount, 4);

          expect(updatedPollData.latestAnswers, hasLength(4));
        },
      );

      activityTest(
        'poll answer removed',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
        setUp: (tester) => tester.get(
          modifyResponse: (it) => it.copyWith(poll: pollWithAnswers),
        ),
        body: (tester) async {
          final pollData = tester.activityState.poll;
          expect(pollData!.answersCount, 3);

          expect(pollData.latestAnswers, hasLength(3));

          final answerToRemove = createDefaultPollAnswerResponse(
            id: 'answer-1',
            pollId: pollData.id,
            answerText: 'Answer 1',
          );

          await tester.emitEvent(
            PollVoteRemovedFeedEvent(
              type: EventTypes.pollVoteRemoved,
              createdAt: DateTime.timestamp(),
              custom: const {},
              fid: feedId.rawValue,
              pollVote: answerToRemove,
              poll: pollWithAnswers.copyWith(
                answersCount: 2,
                latestAnswers: List<PollVoteResponseData>.from(
                  pollWithAnswers.latestAnswers,
                )..removeWhere((answer) => answer.id == answerToRemove.id),
              ),
            ),
          );

          final updatedPollData = tester.activityState.poll;
          expect(updatedPollData!.answersCount, 2);

          expect(updatedPollData.latestAnswers, hasLength(2));
        },
      );
    });

    group('State changes', () {
      final defaultPoll = createDefaultPollResponse();

      activityTest(
        'poll closed',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
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
              fid: feedId.rawValue,
              poll: defaultPoll.copyWith(isClosed: true),
            ),
          );

          expect(tester.activityState.poll?.isClosed, true);
        },
      );

      activityTest(
        'poll deleted',
        build: (client) => client.activity(activityId: activityId, fid: feedId),
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
              fid: feedId.rawValue,
              poll: defaultPoll,
            ),
          );

          expect(tester.activityState.poll, isNull);
        },
      );
    });
  });

  // ============================================================
  // FEATURE: Comments
  // ============================================================

  group('Comments', () {
    const commentId = 'comment-test-1';
    const userId = 'luke_skywalker';

    activityTest(
      'addComment - should add comment to activity via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
      'addComment - should handle CommentAddedEvent and update comments',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Initial state - no comments
        expect(tester.activityState.comments, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
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

        // Verify state has comment
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.id, commentId);
        expect(tester.activityState.comments.first.text, 'Test comment');
        expect(tester.activityState.comments.first.user.id, userId);
      },
    );

    activityTest(
      'addComment - should handle both API call and event together',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
            fid: feedId.rawValue,
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
      'addComment - should not update comments if objectId does not match',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Initial state - no comments
        expect(tester.activityState.comments, isEmpty);

        // Emit CommentAddedEvent for different activity
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'different-activity-id',
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state was not updated
        expect(tester.activityState.comments, isEmpty);
      },
    );

    activityTest(
      'deleteComment - should delete comment via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
      'deleteComment - should handle CommentDeletedEvent and update comments',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit event
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify state has no comments
        expect(tester.activityState.comments, isEmpty);
      },
    );

    activityTest(
      'deleteComment - should not update comments if objectId does not match',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit CommentDeletedEvent for different activity
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: 'different-activity-id',
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify state was not updated
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.id, commentId);
      },
    );

    activityTest(
      'updateComment - should update comment via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
      'updateComment - should handle CommentUpdatedEvent and update comments',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit event
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Updated comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has updated comment
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.text, 'Updated comment');
      },
    );

    activityTest(
      'updateComment - should not update comments if objectId does not match',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit CommentUpdatedEvent for different activity
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: 'different-activity-id',
              objectType: 'activity',
              text: 'Updated comment',
              userId: userId,
            ),
          ),
        );

        // Verify state was not updated
        expect(tester.activityState.comments, hasLength(1));
        expect(tester.activityState.comments.first.text, 'Original comment');
      },
    );
  });

  // ============================================================
  // FEATURE: Comment Reactions
  // ============================================================

  group('Comment Reactions', () {
    const commentId = 'comment-test-1';
    const userId = 'luke_skywalker';
    const reactionType = 'heart';

    setUpAll(() {
      registerFallbackValue(const AddCommentReactionRequest(type: 'like'));
    });

    activityTest(
      'addCommentReaction - should add reaction to comment via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
      'addCommentReaction - should handle CommentReactionAddedEvent and update comment',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit event
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              commentId: commentId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has reaction
        final updatedComment = tester.activityState.comments.first;
        expect(updatedComment.ownReactions, hasLength(1));
        expect(updatedComment.ownReactions.first.type, reactionType);
        expect(updatedComment.ownReactions.first.user.id, userId);
      },
    );

    activityTest(
      'addCommentReaction - should handle both API call and event together',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
            fid: feedId.rawValue,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              commentId: commentId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
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
      'addCommentReaction - should not update comment if objectId does not match',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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

        // Emit CommentReactionAddedEvent for different activity
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: 'different-activity-id',
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'different-activity-id',
              commentId: 'different-comment-id',
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state was not updated
        final comment = tester.activityState.comments.first;
        expect(comment.ownReactions, isEmpty);
      },
    );

    activityTest(
      'deleteCommentReaction - should delete reaction from comment via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
                FeedsReactionResponse(
                  activityId: activityId,
                  commentId: commentId,
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

    activityTest(
      'deleteCommentReaction - should handle CommentReactionDeletedEvent and update comment',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
                FeedsReactionResponse(
                  activityId: activityId,
                  commentId: commentId,
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
        // Initial state - comment has reaction
        final initialComment = tester.activityState.comments.first;
        expect(initialComment.ownReactions, hasLength(1));

        // Emit event
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              commentId: commentId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has no reactions
        final updatedComment = tester.activityState.comments.first;
        expect(updatedComment.ownReactions, isEmpty);
      },
    );

    activityTest(
      'deleteCommentReaction - should not update comment if objectId does not match',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
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
                FeedsReactionResponse(
                  activityId: activityId,
                  commentId: commentId,
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
        // Initial state - comment has reaction
        final initialComment = tester.activityState.comments.first;
        expect(initialComment.ownReactions, hasLength(1));

        // Emit CommentReactionDeletedEvent for different activity
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: 'different-activity-id',
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'different-activity-id',
              commentId: 'different-comment-id',
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state was not updated
        final comment = tester.activityState.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, reactionType);
      },
    );
  });
}
