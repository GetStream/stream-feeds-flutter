import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('PollListEventHandler - Local filtering', () {
    final initialPolls = [
      createDefaultPollResponse(id: 'poll-1'),
      createDefaultPollResponse(id: 'poll-2'),
      createDefaultPollResponse(id: 'poll-3'),
    ];

    pollListTest(
      'PollUpdatedFeedEvent - should remove poll when updated to non-matching status',
      build: (client) => client.pollList(
        PollsQuery(
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
      'No filter - should not remove poll when no filter specified',
      build: (client) => client.pollList(
        // No filter specified, should accept all polls
        const PollsQuery(),
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

        expect(tester.pollListState.polls, hasLength(3));
      },
    );
  });
}
