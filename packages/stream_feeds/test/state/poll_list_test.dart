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
        expect(tester.pollListState.canLoadMore, isTrue);

        final nextPageQuery = tester.pollList.query.copyWith(
          next: tester.pollListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryPolls(
            queryPollsRequest: nextPageQuery.toRequest(),
          ),
          result: QueryPollsResponse(
            duration: DateTime.now().toIso8601String(),
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
        expect(tester.pollListState.canLoadMore, isFalse);

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
        expect(tester.pollListState.canLoadMore, isFalse);
        // Query more polls (should return empty immediately)
        final result = await tester.pollList.queryMorePolls();

        expect(result.isSuccess, isTrue);
        final polls = result.getOrNull();
        expect(polls, isEmpty);

        // State should remain unchanged
        expect(tester.pollListState.polls, hasLength(3));
        expect(tester.pollListState.canLoadMore, isFalse);
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
        // Initial state - has 3 polls
        expect(tester.pollListState.polls, hasLength(3));

        final newVote = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: 'poll-1',
          optionId: 'option-1',
        );

        // Emit PollVoteCastedFeedEvent
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [newVote],
            ),
            pollVote: newVote,
          ),
        );

        // Verify poll was updated with vote
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );
        expect(updatedPoll, isNotNull);
        expect(updatedPoll!.voteCount, 1);
        expect(updatedPoll.latestVotesByOption['option-1'], hasLength(1));
      },
    );

    pollListTest(
      'PollVoteChangedFeedEvent - should update poll with changed vote',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          polls: [
            createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [
                createDefaultPollVoteResponse(
                  id: 'vote-1',
                  optionId: 'option-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one poll with one vote on option-1
        expect(tester.pollListState.polls, hasLength(1));
        final initialPoll = tester.pollListState.polls.first;
        expect(initialPoll.voteCount, 1);
        expect(initialPoll.latestVotesByOption['option-1'], hasLength(1));

        final changedVote = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: 'poll-1',
          optionId: 'option-2',
        );

        // Emit PollVoteChangedFeedEvent
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [changedVote],
            ),
            pollVote: changedVote,
          ),
        );

        // Verify poll was updated with changed vote
        final updatedPoll = tester.pollListState.polls.first;
        expect(updatedPoll.voteCount, 1);
        expect(updatedPoll.latestVotesByOption['option-1'], isNull);
        expect(updatedPoll.latestVotesByOption['option-2'], hasLength(1));
      },
    );

    pollListTest(
      'PollVoteRemovedFeedEvent - should update poll when vote is removed',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          polls: [
            createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [
                createDefaultPollVoteResponse(
                  id: 'vote-1',
                  optionId: 'option-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one poll with one vote
        expect(tester.pollListState.polls, hasLength(1));
        final initialPoll = tester.pollListState.polls.first;
        expect(initialPoll.voteCount, 1);
        expect(initialPoll.latestVotesByOption['option-1'], hasLength(1));

        final voteToRemove = createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: 'poll-1',
          optionId: 'option-1',
        );

        // Emit PollVoteRemovedFeedEvent
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [],
            ),
            pollVote: voteToRemove,
          ),
        );

        // Verify vote was removed
        final updatedPoll = tester.pollListState.polls.first;
        expect(updatedPoll.voteCount, 0);
        expect(updatedPoll.latestVotesByOption['option-1'], isNull);
      },
    );

    pollListTest(
      'PollAnswerCastedFeedEvent - should update poll with answer',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(polls: initialPolls),
      ),
      body: (tester) async {
        // Initial state - has 3 polls
        expect(tester.pollListState.polls, hasLength(3));

        final newAnswer = createDefaultPollAnswerResponse(
          id: 'answer-1',
          pollId: 'poll-1',
          answerText: 'My Custom Answer',
        );

        // Emit PollVoteCastedFeedEvent (resolved to PollAnswerCastedFeedEvent)
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [newAnswer],
            ),
            pollVote: newAnswer,
          ),
        );

        // Verify poll was updated with answer
        final updatedPoll = tester.pollListState.polls.firstWhereOrNull(
          (p) => p.id == 'poll-1',
        );
        expect(updatedPoll, isNotNull);
        expect(updatedPoll!.answersCount, 1);
        expect(updatedPoll.latestAnswers, hasLength(1));
        expect(updatedPoll.latestAnswers.first.answerText, 'My Custom Answer');
      },
    );

    pollListTest(
      'PollAnswerRemovedFeedEvent - should update poll when answer is removed',
      build: (client) => client.pollList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          polls: [
            createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [
                createDefaultPollAnswerResponse(id: 'answer-1'),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has one poll with one answer
        expect(tester.pollListState.polls, hasLength(1));
        final initialPoll = tester.pollListState.polls.first;
        expect(initialPoll.answersCount, 1);
        expect(initialPoll.latestAnswers, hasLength(1));

        final answerToRemove = createDefaultPollAnswerResponse(
          id: 'answer-1',
          pollId: 'poll-1',
        );

        // Emit PollVoteRemovedFeedEvent (resolved to PollAnswerRemovedFeedEvent)
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(
              id: 'poll-1',
              ownVotesAndAnswers: [],
            ),
            pollVote: answerToRemove,
          ),
        );

        // Verify answer was removed
        final updatedPoll = tester.pollListState.polls.first;
        expect(updatedPoll.answersCount, 0);
        expect(updatedPoll.latestAnswers, isEmpty);
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
