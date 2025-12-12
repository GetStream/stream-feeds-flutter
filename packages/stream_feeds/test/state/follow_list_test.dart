import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('FollowListEventHandler - Local filtering', () {
    final initialFollows = [
      createDefaultFollowResponse(id: 'follow-1'),
      createDefaultFollowResponse(id: 'follow-2'),
      createDefaultFollowResponse(id: 'follow-3'),
    ];

    followListTest(
      'FollowUpdatedEvent - should remove follow when updated to non-matching status',
      build: (client) => client.followList(
        FollowsQuery(
          filter: Filter.equal(
            FollowsFilterField.status,
            FollowStatus.accepted,
          ),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        expect(tester.followListState.follows, hasLength(3));

        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:follow-1',
            follow: createDefaultFollowResponse(
              id: 'follow-1',
            ).copyWith(
              status: FollowResponseStatus.rejected,
            ),
          ),
        );

        expect(tester.followListState.follows, hasLength(2));
      },
    );

    followListTest(
      'No filter - should not remove follow when no filter specified',
      build: (client) => client.followList(
        // No filter specified, should accept all follows
        const FollowsQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        expect(tester.followListState.follows, hasLength(3));

        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:follow-1',
            follow: createDefaultFollowResponse(
              id: 'follow-1',
            ).copyWith(
              status: FollowResponseStatus.rejected,
            ),
          ),
        );

        expect(tester.followListState.follows, hasLength(3));
      },
    );
  });
}
