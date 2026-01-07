import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const query = PollVotesQuery(pollId: 'test-poll-id');

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Poll Vote List - Query Operations', () {
    pollVoteListTest(
      'get - should query initial votes via API',
      build: (client) => client.pollVoteList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<PollVoteData>>>());
        final votes = result.getOrThrow();

        expect(votes, isA<List<PollVoteData>>());
        expect(votes, hasLength(3));
      },
    );

    pollVoteListTest(
      'queryMorePollVotes - should load more votes via API',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          votes: [
            createDefaultPollVoteResponse(id: 'vote-1', pollId: query.pollId),
            createDefaultPollVoteResponse(id: 'vote-2', pollId: query.pollId),
            createDefaultPollVoteResponse(id: 'vote-3', pollId: query.pollId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));
        expect(tester.pollVoteListState.canLoadMore, isTrue);

        final nextPageQuery = tester.pollVoteList.query.copyWith(
          next: tester.pollVoteListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryPollVotes(
            pollId: nextPageQuery.pollId,
            queryPollVotesRequest: nextPageQuery.toRequest(),
          ),
          result: PollVotesResponse(
            duration: DateTime.now().toIso8601String(),
            votes: [
              createDefaultPollVoteResponse(id: 'vote-4', pollId: query.pollId),
            ],
          ),
        );

        // Query more votes
        final result = await tester.pollVoteList.queryMorePollVotes();

        expect(result.isSuccess, isTrue);
        final votes = result.getOrNull();
        expect(votes, isNotNull);
        expect(votes, hasLength(1));

        // Verify state was updated with merged votes
        expect(tester.pollVoteListState.votes, hasLength(4));
        expect(tester.pollVoteListState.canLoadMore, isFalse);

        tester.verifyApi(
          (api) => api.queryPollVotes(
            pollId: nextPageQuery.pollId,
            queryPollVotesRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    pollVoteListTest(
      'queryMorePollVotes - should return empty list when no more votes',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          votes: [
            createDefaultPollVoteResponse(id: 'vote-1', pollId: query.pollId),
            createDefaultPollVoteResponse(id: 'vote-2', pollId: query.pollId),
            createDefaultPollVoteResponse(id: 'vote-3', pollId: query.pollId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has votes but no pagination
        expect(tester.pollVoteListState.votes, hasLength(3));
        expect(tester.pollVoteListState.canLoadMore, isFalse);
        // Query more votes (should return empty immediately)
        final result = await tester.pollVoteList.queryMorePollVotes();

        expect(result.isSuccess, isTrue);
        final votes = result.getOrNull();
        expect(votes, isEmpty);

        // State should remain unchanged
        expect(tester.pollVoteListState.votes, hasLength(3));
        expect(tester.pollVoteListState.canLoadMore, isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Poll Vote List - Event Handling', () {
    final initialVotes = [
      createDefaultPollVoteResponse(id: 'vote-1', pollId: query.pollId),
      createDefaultPollVoteResponse(id: 'vote-2', pollId: query.pollId),
      createDefaultPollVoteResponse(id: 'vote-3', pollId: query.pollId),
    ];

    pollVoteListTest(
      'PollDeletedFeedEvent - should clear all votes when poll is deleted',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollDeletedFeedEvent(
            type: EventTypes.pollDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
          ),
        );

        // Verify all votes were cleared
        expect(tester.pollVoteListState.votes, isEmpty);
        expect(tester.pollVoteListState.pagination, isNull);
      },
    );

    pollVoteListTest(
      'PollDeletedFeedEvent - should not clear votes for different poll',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event for different poll
        await tester.emitEvent(
          PollDeletedFeedEvent(
            type: EventTypes.pollDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'different-poll-id'),
          ),
        );

        // Verify votes were not cleared
        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );

    pollVoteListTest(
      'PollVoteCastedFeedEvent - should add vote',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-4',
              pollId: query.pollId,
            ),
          ),
        );

        // Verify vote was added
        expect(tester.pollVoteListState.votes, hasLength(4));
        expect(
          tester.pollVoteListState.votes.any((v) => v.id == 'vote-4'),
          isTrue,
        );
      },
    );

    pollVoteListTest(
      'PollVoteCastedFeedEvent - should not add vote for different poll',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event for different poll
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-4',
              pollId: 'different-poll-id',
            ),
          ),
        );

        // Verify vote was not added
        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );

    pollVoteListTest(
      'PollVoteCastedFeedEvent - should not add vote that does not match filter',
      build: (client) => client.pollVoteList(
        query.copyWith(
          filter: Filter.equal(PollVotesFilterField.optionId, 'option-1'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event with vote that doesn't match filter
        await tester.emitEvent(
          PollVoteCastedFeedEvent(
            type: EventTypes.pollVoteCasted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-4',
              pollId: query.pollId,
              optionId: 'option-2',
            ),
          ),
        );

        // Verify vote was not added
        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );

    pollVoteListTest(
      'PollVoteChangedFeedEvent - should update vote',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: query.pollId,
            ).copyWith(optionId: 'option-2'),
          ),
        );

        // Verify vote was updated
        expect(tester.pollVoteListState.votes, hasLength(3));
        final updatedVote = tester.pollVoteListState.votes.firstWhere(
          (v) => v.id == 'vote-1',
        );
        expect(updatedVote.optionId, 'option-2');
      },
    );

    pollVoteListTest(
      'PollVoteChangedFeedEvent - should not update vote for different poll',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));
        final originalVote = tester.pollVoteListState.votes.firstWhere(
          (v) => v.id == 'vote-1',
        );

        // Emit event for different poll
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: 'different-poll-id',
            ).copyWith(optionId: 'option-2'),
          ),
        );

        // Verify vote was not updated
        expect(tester.pollVoteListState.votes, hasLength(3));
        final unchangedVote = tester.pollVoteListState.votes.firstWhere(
          (v) => v.id == 'vote-1',
        );
        expect(unchangedVote.optionId, originalVote.optionId);
      },
    );

    pollVoteListTest(
      'PollVoteRemovedFeedEvent - should remove vote',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: query.pollId,
            ),
          ),
        );

        // Verify vote was removed
        expect(tester.pollVoteListState.votes, hasLength(2));
        expect(
          tester.pollVoteListState.votes.any((v) => v.id == 'vote-1'),
          isFalse,
        );
      },
    );

    pollVoteListTest(
      'PollVoteRemovedFeedEvent - should not remove vote for different poll',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        // Initial state - has votes
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Emit event for different poll
        await tester.emitEvent(
          PollVoteRemovedFeedEvent(
            type: EventTypes.pollVoteRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: 'different-poll-id'),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: 'different-poll-id',
            ),
          ),
        );

        // Verify vote was not removed
        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Poll Vote List - Local Filtering', () {
    final initialVotes = [
      createDefaultPollVoteResponse(id: 'vote-1', pollId: query.pollId),
      createDefaultPollVoteResponse(id: 'vote-2', pollId: query.pollId),
      createDefaultPollVoteResponse(id: 'vote-3', pollId: query.pollId),
    ];

    pollVoteListTest(
      'PollVoteChangedFeedEvent - should remove vote when changed to non-matching option',
      build: (client) => client.pollVoteList(
        query.copyWith(
          filter: Filter.equal(PollVotesFilterField.optionId, 'option-1'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        expect(tester.pollVoteListState.votes, hasLength(3));

        // Send event with vote that changed to non-matching optionId
        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: query.pollId,
            ).copyWith(optionId: 'option-2'),
          ),
        );

        expect(tester.pollVoteListState.votes, hasLength(2));
      },
    );

    pollVoteListTest(
      'No filter - should not remove vote when no filter specified',
      build: (client) => client.pollVoteList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(votes: initialVotes),
      ),
      body: (tester) async {
        expect(tester.pollVoteListState.votes, hasLength(3));

        await tester.emitEvent(
          PollVoteChangedFeedEvent(
            type: EventTypes.pollVoteChanged,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'fid',
            poll: createDefaultPollResponse(id: query.pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: query.pollId,
            ).copyWith(optionId: 'option-2'),
          ),
        );

        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );
  });
}
