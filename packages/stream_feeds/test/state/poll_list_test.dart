import 'package:collection/collection.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const query = PollsQuery();

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Poll List - Query Operations', () {
    pollListTest(
      'get - should query initial polls via API',
      build: (client) => client.pollList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<PollData>>>());
        final polls = result.getOrThrow();

        expect(polls, isA<List<PollData>>());
        expect(polls, hasLength(3));
      },
    );

    pollListTest(
      'queryMorePolls - should load more polls via API',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          polls: [
            createDefaultPollResponse(id: 'poll-1'),
            createDefaultPollResponse(id: 'poll-2'),
            createDefaultPollResponse(id: 'poll-3'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        final nextPageQuery = tester.pollList.query.copyWith(
          next: tester.pollListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryPolls(
            queryPollsRequest: nextPageQuery.toRequest(),
          ),
          result: QueryPollsResponse(
            duration: DateTime.now().toIso8601String(),
            prev: 'prev-cursor',
            polls: [
              createDefaultPollResponse(id: 'poll-4'),
            ],
          ),
        );

        // Query more polls
        final result = await tester.pollList.queryMorePolls();

        expect(result.isSuccess, isTrue);
        final polls = result.getOrNull();
        expect(polls, isNotNull);
        expect(polls, hasLength(1));

        // Verify state was updated with merged polls
        expect(tester.pollListState.polls, hasLength(4));
        expect(tester.pollListState.pagination?.next, isNull);
        expect(tester.pollListState.pagination?.previous, 'prev-cursor');
      },
      verify: (tester) {
        final nextPageQuery = tester.pollList.query.copyWith(
          next: tester.pollListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryPolls(
            queryPollsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    pollListTest(
      'queryMorePolls - should return empty list when no more polls',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          polls: [
            createDefaultPollResponse(id: 'poll-1'),
            createDefaultPollResponse(id: 'poll-2'),
            createDefaultPollResponse(id: 'poll-3'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has polls but no pagination
        expect(tester.pollListState.polls, hasLength(3));
        expect(tester.pollListState.pagination?.next, isNull);
        expect(tester.pollListState.pagination?.previous, isNull);

        // Query more polls (should return empty immediately)
        final result = await tester.pollList.queryMorePolls();

        expect(result.isSuccess, isTrue);
        final polls = result.getOrNull();
        expect(polls, isEmpty);

        // State should remain unchanged
        expect(tester.pollListState.polls, hasLength(3));
        expect(tester.pollListState.pagination?.next, isNull);
        expect(tester.pollListState.pagination?.previous, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Poll List - Event Handling', () {
    final initialPolls = [
      createDefaultPollResponse(id: 'poll-1'),
      createDefaultPollResponse(id: 'poll-2'),
      createDefaultPollResponse(id: 'poll-3'),
    ];

    pollListTest(
      'PollDeletedFeedEvent - should remove poll',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollDeletedFeedEvent(
            type: EventTypes.pollDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1'),
          ),
        );

        // Verify poll was removed
        expect(tester.pollListState.polls, hasLength(2));

        final removedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(removedPoll, isNull);
      },
    );

    pollListTest(
      'PollUpdatedFeedEvent - should update poll',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollUpdatedFeedEvent(
            type: EventTypes.pollUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              name: 'Updated Poll Name',
            ),
          ),
        );

        // Verify poll was updated
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        expect(updatedPoll!.name, 'Updated Poll Name');
      },
    );

    pollListTest(
      'PollClosedFeedEvent - should close poll',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollClosedFeedEvent(
            type: EventTypes.pollClosed,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1'),
          ),
        );

        // Verify poll was closed
        expect(tester.pollListState.polls, hasLength(3));
        final closedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(closedPoll, isNotNull);
        expect(closedPoll!.isClosed, isTrue);
      },
    );

    pollListTest(
      'PollVoteCastedFeedEvent - should update poll with vote',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        const optionId = 'option-1';
        const voteId = 'vote-1';
        final vote = createDefaultPollVoteResponse(
          id: voteId,
          pollId: 'poll-1',
          optionId: optionId,
        );

        // Emit event
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              voteCount: 1,
              voteCountsByOption: {optionId: 1},
              latestVotesByOption: {
                optionId: [vote],
              },
            ),
            pollVote: vote,
          ),
        );

        // Verify poll was updated with vote
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        final votes = updatedPoll!.latestVotesByOption[optionId];

        expect(votes, isNotNull);
        expect(votes!.any((v) => v.id == voteId), isTrue);
      },
    );

    pollListTest(
      'PollVoteChangedFeedEvent - should update poll with changed vote',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        const voteId = 'vote-1';
        const newOptionId = 'option-2';
        final changedVote = createDefaultPollVoteResponse(
          id: voteId,
          pollId: 'poll-1',
          optionId: newOptionId,
        );

        // Emit event
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              latestVotesByOption: {
                newOptionId: [changedVote],
              },
            ),
            pollVote: changedVote,
          ),
        );

        // Verify poll was updated with changed vote
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        final votes = updatedPoll!.latestVotesByOption[newOptionId];

        expect(votes, isNotNull);
        expect(votes!.any((v) => v.id == voteId), isTrue);
      },
    );

    pollListTest(
      'PollVoteRemovedFeedEvent - should update poll when vote is removed',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        const voteId = 'vote-1';
        const optionId = 'option-1';
        final vote = createDefaultPollVoteResponse(
          id: voteId,
          pollId: 'poll-1',
          optionId: optionId,
        );

        // First add a vote
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              latestVotesByOption: {
                optionId: [vote],
              },
              voteCount: 1,
              voteCountsByOption: {optionId: 1},
            ),
            pollVote: vote,
          ),
        );

        // Verify vote was added
        final pollAfterAdd = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(pollAfterAdd, isNotNull);
        final votes = pollAfterAdd!.latestVotesByOption[optionId];

        expect(votes, isNotNull);
        expect(votes!.any((v) => v.id == voteId), isTrue);

        // Now remove the vote
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1'),
            pollVote: vote,
          ),
        );

        // Verify poll was updated and vote was removed
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        // Vote should no longer be in latestVotesByOption
        final updatedVotes = updatedPoll!.latestVotesByOption[optionId];
        expect(updatedVotes, isNull);
      },
    );

    pollListTest(
      'PollAnswerCastedFeedEvent - should update poll with answer',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        const answerId = 'answer-1';
        const answerText = 'My Custom Answer';
        final answer = createDefaultPollAnswerResponse(
          id: answerId,
          pollId: 'poll-1',
          answerText: answerText,
        );

        // Emit event using PollVoteCastedFeedEvent with isAnswer: true
        // This will be resolved to PollAnswerCastedFeedEvent by the resolver
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              latestAnswers: [answer],
              answersCount: 1,
            ),
            pollVote: answer,
          ),
        );

        // Verify poll was updated with answer
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        final updatedAnswers = updatedPoll!.latestAnswers;

        expect(updatedAnswers, isNotNull);
        expect(updatedAnswers.any((a) => a.id == answerId), isTrue);

        final foundAnswer = updatedAnswers.firstWhere((a) => a.id == answerId);
        expect(foundAnswer.answerText, answerText);
      },
    );

    pollListTest(
      'PollAnswerRemovedFeedEvent - should update poll when answer is removed',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has polls
        expect(tester.pollListState.polls, hasLength(3));

        const answerId = 'answer-1';
        const answerText = 'My Custom Answer';
        final answer = createDefaultPollAnswerResponse(
          id: answerId,
          pollId: 'poll-1',
          answerText: answerText,
        );

        // First add an answer
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              latestAnswers: [answer],
              answersCount: 1,
            ),
            pollVote: answer,
          ),
        );

        // Verify answer was added
        final pollAfterAdd = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );
        expect(pollAfterAdd, isNotNull);
        final answers = pollAfterAdd!.latestAnswers;

        expect(answers, isNotNull);
        expect(answers.any((a) => a.id == answerId), isTrue);

        // Now remove the answer
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1'),
            pollVote: answer,
          ),
        );

        // Verify poll was updated and answer was removed
        expect(tester.pollListState.polls, hasLength(3));
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );

        expect(updatedPoll, isNotNull);
        // Answer should no longer be in latestAnswers
        final updatedAnswers = updatedPoll!.latestAnswers;
        expect(updatedAnswers.any((a) => a.id == answerId), isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Poll List - Local Filtering', () {
    final initialPolls = [
      createDefaultPollResponse(id: 'poll-1'),
      createDefaultPollResponse(id: 'poll-2'),
      createDefaultPollResponse(id: 'poll-3'),
    ];

    pollListTest(
      'PollUpdatedFeedEvent - should remove poll when updated to non-matching status',
      build: (client) => client.pollList(
        query.copyWith(
          filter: Filter.equal(PollsFilterField.isClosed, false),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        expect(tester.pollListState.polls, hasLength(3));

        // Send event with poll that doesn't match filter (isClosed: false)
        await tester.emitEvent(
          PollUpdatedFeedEvent(
            type: EventTypes.pollUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
            ).copyWith(isClosed: true),
          ),
        );

        expect(tester.pollListState.polls, hasLength(2));
      },
    );

    pollListTest(
      'PollClosedFeedEvent - should remove poll when closed and does not match filter',
      build: (client) => client.pollList(
        query.copyWith(
          filter: Filter.equal(PollsFilterField.isClosed, false),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        expect(tester.pollListState.polls, hasLength(3));

        // Send event with poll that is closed (doesn't match filter)
        // The poll in the event should have isClosed: true so it doesn't match the filter
        await tester.emitEvent(
          PollClosedFeedEvent(
            type: EventTypes.pollClosed,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'poll-1').copyWith(
              isClosed: true,
            ),
          ),
        );

        expect(tester.pollListState.polls, hasLength(2));
      },
    );

    pollListTest(
      'No filter - should not remove poll when no filter specified',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        expect(tester.pollListState.polls, hasLength(3));

        // Send event with poll that doesn't match filter (isClosed: false)
        await tester.emitEvent(
          PollUpdatedFeedEvent(
            type: EventTypes.pollUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
            ).copyWith(isClosed: true),
          ),
        );

        expect(tester.pollListState.polls, hasLength(3));
      },
    );
  });
}
