import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('PollVoteListEventHandler - Local filtering', () {
    const pollId = 'test-poll-id';

    final initialVotes = [
      createDefaultPollVoteResponse(id: 'vote-1', pollId: pollId),
      createDefaultPollVoteResponse(id: 'vote-2', pollId: pollId),
      createDefaultPollVoteResponse(id: 'vote-3', pollId: pollId),
    ];

    pollVoteListTest(
      'PollVoteChangedFeedEvent - should remove vote when changed to non-matching option',
      build: (client) => client.pollVoteList(
        PollVotesQuery(
          pollId: pollId,
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
            poll: createDefaultPollResponse(id: pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: pollId,
            ).copyWith(optionId: 'option-2'),
          ),
        );

        expect(tester.pollVoteListState.votes, hasLength(2));
      },
    );

    pollVoteListTest(
      'No filter - should not remove vote when no filter specified',
      build: (client) => client.pollVoteList(
        const PollVotesQuery(
          pollId: pollId,
          // No filter specified, should accept all votes
        ),
      ),
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
            poll: createDefaultPollResponse(id: pollId),
            pollVote: createDefaultPollVoteResponse(
              id: 'vote-1',
              pollId: pollId,
            ).copyWith(optionId: 'option-2'),
          ),
        );

        expect(tester.pollVoteListState.votes, hasLength(3));
      },
    );
  });
}
