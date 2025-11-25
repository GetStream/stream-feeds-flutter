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
}
