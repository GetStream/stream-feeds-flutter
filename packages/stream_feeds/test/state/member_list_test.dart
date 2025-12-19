import 'package:collection/collection.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const query = MembersQuery(fid: FeedId.user('john'));

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Member List - Query Operations', () {
    memberListTest(
      'get - should query initial members via API',
      build: (client) => client.memberList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<FeedMemberData>>>());
        final members = result.getOrThrow();

        expect(members, isA<List<FeedMemberData>>());
        expect(members, hasLength(3));
      },
    );

    memberListTest(
      'queryMoreMembers - should load more members via API',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          members: [
            createDefaultFeedMemberResponse(id: 'member-1'),
            createDefaultFeedMemberResponse(id: 'member-2'),
            createDefaultFeedMemberResponse(id: 'member-3'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has members
        expect(tester.memberListState.members, hasLength(3));
        expect(tester.memberListState.canLoadMore, isTrue);

        final nextPageQuery = tester.memberList.query.copyWith(
          next: tester.memberListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryFeedMembers(
            feedGroupId: nextPageQuery.fid.group,
            feedId: nextPageQuery.fid.id,
            queryFeedMembersRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryFeedMembersResponse(
            members: [
              createDefaultFeedMemberResponse(id: 'member-4'),
            ],
          ),
        );

        // Query more members
        final result = await tester.memberList.queryMoreMembers();

        expect(result.isSuccess, isTrue);
        final members = result.getOrNull();
        expect(members, isNotNull);
        expect(members, hasLength(1));

        // Verify state was updated with merged members
        expect(tester.memberListState.members, hasLength(4));
        expect(tester.memberListState.canLoadMore, isFalse);

        tester.verifyApi(
          (api) => api.queryFeedMembers(
            feedGroupId: nextPageQuery.fid.group,
            feedId: nextPageQuery.fid.id,
            queryFeedMembersRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    memberListTest(
      'queryMoreMembers - should return empty list when no more members',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          members: [
            createDefaultFeedMemberResponse(id: 'member-1'),
            createDefaultFeedMemberResponse(id: 'member-2'),
            createDefaultFeedMemberResponse(id: 'member-3'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has members but no pagination
        expect(tester.memberListState.members, hasLength(3));
        expect(tester.memberListState.canLoadMore, isFalse);
        // Query more members (should return empty immediately)
        final result = await tester.memberList.queryMoreMembers();

        expect(result.isSuccess, isTrue);
        final members = result.getOrNull();
        expect(members, isEmpty);

        // State should remain unchanged
        expect(tester.memberListState.members, hasLength(3));
        expect(tester.memberListState.canLoadMore, isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Member List - Event Handling', () {
    // Note: Member ID is simply user.id
    final initialMembers = [
      createDefaultFeedMemberResponse(id: 'member-1'),
      createDefaultFeedMemberResponse(id: 'member-2'),
      createDefaultFeedMemberResponse(id: 'member-3'),
    ];

    memberListTest(
      'FeedMemberAddedEvent - should add member',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        // Initial state - has members
        expect(tester.memberListState.members, hasLength(3));

        // Emit event
        await tester.emitEvent(
          FeedMemberAddedEvent(
            type: EventTypes.feedMemberAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: query.fid.rawValue,
            member: createDefaultFeedMemberResponse(id: 'member-4'),
          ),
        );

        // Verify member was added
        expect(tester.memberListState.members, hasLength(4));
        expect(
          tester.memberListState.members.any((m) => m.user.id == 'member-4'),
          isTrue,
        );
      },
    );

    memberListTest(
      'FeedMemberUpdatedEvent - should update member',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        // Emit event
        await tester.emitEvent(
          FeedMemberUpdatedEvent(
            type: EventTypes.feedMemberUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: query.fid.rawValue,
            member: createDefaultFeedMemberResponse(
              id: 'member-1',
              role: 'admin',
            ),
          ),
        );

        // Verify member was updated
        final updatedMember = tester.memberListState.members.firstWhereOrNull(
          (m) => m.user.id == 'member-1',
        );

        expect(updatedMember, isNotNull);
        expect(updatedMember!.role, 'admin');
        expect(tester.memberListState.members, hasLength(3));
      },
    );

    memberListTest(
      'FeedMemberRemovedEvent - should remove member',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        // Verify initial state
        expect(tester.memberListState.members, hasLength(3));
        final memberToRemove = tester.memberListState.members.first;

        // Emit event
        await tester.emitEvent(
          FeedMemberRemovedEvent(
            type: EventTypes.feedMemberRemoved,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: query.fid.rawValue,
            memberId: memberToRemove.id,
          ),
        );

        // Verify member was removed
        final deletedMember = tester.memberListState.members.firstWhereOrNull(
          (m) => m.id == memberToRemove.id,
        );

        expect(deletedMember, isNull);
        expect(tester.memberListState.members, hasLength(2));
      },
    );

    memberListTest(
      'FeedMemberAddedEvent - should not add member for different feed',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        // Initial state - has members
        expect(tester.memberListState.members, hasLength(3));

        // Emit event for different feed
        await tester.emitEvent(
          FeedMemberAddedEvent(
            type: EventTypes.feedMemberAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:different-feed',
            member: createDefaultFeedMemberResponse(id: 'member-4'),
          ),
        );

        // Verify member was not added
        expect(tester.memberListState.members, hasLength(3));
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Member List - Local filtering', () {
    final initialMembers = [
      createDefaultFeedMemberResponse(id: 'member-1'),
      createDefaultFeedMemberResponse(id: 'member-2'),
      createDefaultFeedMemberResponse(id: 'member-3'),
    ];

    memberListTest(
      'FeedMemberUpdatedEvent - should remove member when updated to non-matching status',
      build: (client) => client.memberList(
        query.copyWith(
          filter: Filter.equal(
            MembersFilterField.status,
            FeedMemberStatus.member,
          ),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        expect(tester.memberListState.members, hasLength(3));

        await tester.emitEvent(
          FeedMemberUpdatedEvent(
            type: EventTypes.feedMemberUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: query.fid.rawValue,
            member: createDefaultFeedMemberResponse(
              id: 'member-1',
              status: FeedMemberResponseStatus.pending,
            ),
          ),
        );

        expect(tester.memberListState.members, hasLength(2));
      },
    );

    memberListTest(
      'No filter - should not remove member when no filter specified',
      build: (client) => client.memberList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(members: initialMembers),
      ),
      body: (tester) async {
        expect(tester.memberListState.members, hasLength(3));

        await tester.emitEvent(
          FeedMemberUpdatedEvent(
            type: EventTypes.feedMemberUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: query.fid.rawValue,
            member: createDefaultFeedMemberResponse(
              id: 'member-1',
              status: FeedMemberResponseStatus.pending,
            ),
          ),
        );

        expect(tester.memberListState.members, hasLength(3));
      },
    );
  });
}
