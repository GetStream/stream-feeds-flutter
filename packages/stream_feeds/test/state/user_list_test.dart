import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('User List - Query Operations', () {
    const query = UsersQuery();

    userListTest(
      'get - should query initial users via API',
      build: (client) => client.userList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<UserData>>>());
        final users = result.getOrThrow();

        expect(users, hasLength(3));

        // All fixtures share a createdAt, so the default sort
        // (createdAt desc, id desc) orders them by id descending.
        expect(
          tester.userListState.users.map((it) => it.id),
          ['user-3', 'user-2', 'user-1'],
        );
        expect(tester.userListState.nextOffset, 3);
        expect(tester.userListState.canLoadMore, isTrue);
      },
    );

    userListTest(
      'canLoadMore - should be false before the first query',
      build: (client) => client.userList(query),
      body: (tester) async {
        expect(tester.userListState.users, isEmpty);
        expect(tester.userListState.nextOffset, isNull);
        expect(tester.userListState.canLoadMore, isFalse);

        // Querying more without an initial query returns empty and hits no API
        final result = await tester.userList.queryMoreUsers();

        expect(result.isSuccess, isTrue);
        expect(result.getOrThrow(), isEmpty);

        tester.verifyNeverCalled(
          (api) => api.queryUsers(payload: query.toRequest()),
        );
      },
    );

    userListTest(
      'queryMoreUsers - should load more users via API',
      build: (client) => client.userList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse()],
        ),
      ),
      body: (tester) async {
        // Initial state - one user loaded, next page starts at offset 1
        expect(tester.userListState.users, hasLength(1));
        expect(tester.userListState.nextOffset, 1);

        final nextPageQuery = tester.userList.query.copyWith(offset: 1);

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: [createDefaultFullUserResponse(id: 'user-2')],
          ),
        );

        final result = await tester.userList.queryMoreUsers();

        expect(result.isSuccess, isTrue);
        expect(result.getOrThrow(), hasLength(1));

        // Verify state was updated with merged users
        expect(tester.userListState.users, hasLength(2));
        expect(tester.userListState.nextOffset, 2);
        expect(tester.userListState.canLoadMore, isTrue);

        tester.verifyApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
        );
      },
    );

    userListTest(
      'queryMoreUsers - should continue from the offset of the query',
      build: (client) => client.userList(const UsersQuery(offset: 10)),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [
            createDefaultFullUserResponse(),
            createDefaultFullUserResponse(id: 'user-2'),
          ],
        ),
      ),
      body: (tester) async {
        // Starting offset of 10 plus the two returned users
        expect(tester.userListState.nextOffset, 12);

        final nextPageQuery = tester.userList.query.copyWith(offset: 12);

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: [createDefaultFullUserResponse(id: 'user-3')],
          ),
        );

        await tester.userList.queryMoreUsers();

        tester.verifyApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
        );
      },
    );

    userListTest(
      'queryMoreUsers - should advance the offset by the returned page size',
      build: (client) => client.userList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse(name: 'Luke')],
        ),
      ),
      body: (tester) async {
        final nextPageQuery = tester.userList.query.copyWith(offset: 1);

        // The next page repeats user-1 with updated data, so the merged list
        // grows by one while the server returned two users.
        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: [
              createDefaultFullUserResponse(name: 'Luke Skywalker'),
              createDefaultFullUserResponse(id: 'user-2'),
            ],
          ),
        );

        await tester.userList.queryMoreUsers();

        expect(tester.userListState.users, hasLength(2));
        expect(
          tester.userListState.users.firstWhere((it) => it.id == 'user-1').name,
          'Luke Skywalker',
        );

        // Offset follows the server page size (1 + 2), not the merged length (2)
        expect(tester.userListState.nextOffset, 3);
      },
    );

    userListTest(
      'queryMoreUsers - should stop when a page comes back empty',
      build: (client) => client.userList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse()],
        ),
      ),
      body: (tester) async {
        final nextPageQuery = tester.userList.query.copyWith(offset: 1);

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(users: const []),
        );

        final result = await tester.userList.queryMoreUsers();

        expect(result.isSuccess, isTrue);
        expect(result.getOrThrow(), isEmpty);

        // State is unchanged and pagination has stopped
        expect(tester.userListState.users, hasLength(1));
        expect(tester.userListState.nextOffset, isNull);
        expect(tester.userListState.canLoadMore, isFalse);

        // A second call short-circuits instead of issuing another request
        final again = await tester.userList.queryMoreUsers();

        expect(again.getOrThrow(), isEmpty);
        tester.verifyApiCalled(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          times: 1,
        );
      },
    );

    userListTest(
      'queryMoreUsers - should forward the limit override',
      build: (client) => client.userList(const UsersQuery(limit: 2)),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse()],
        ),
      ),
      body: (tester) async {
        final nextPageQuery = tester.userList.query.copyWith(
          offset: 1,
          limit: 5,
        );

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: [createDefaultFullUserResponse(id: 'user-2')],
          ),
        );

        await tester.userList.queryMoreUsers(limit: 5);

        tester.verifyApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
        );
      },
    );

    userListTest(
      'queryMoreUsers - should stop at the maximum offset the API accepts',
      build: (client) => client.userList(
        const UsersQuery(limit: 100, offset: 950),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: List.generate(
            100,
            (index) => createDefaultFullUserResponse(id: 'user-$index'),
          ),
        ),
      ),
      body: (tester) async {
        expect(tester.userListState.users, hasLength(100));

        // 950 + 100 exceeds UsersQuery.maxOffset, so pagination stops rather
        // than issuing a request the API would reject.
        expect(tester.userListState.nextOffset, isNull);
        expect(tester.userListState.canLoadMore, isFalse);

        final result = await tester.userList.queryMoreUsers();

        expect(result.getOrThrow(), isEmpty);
      },
    );

    userListTest(
      'queryMoreUsers - should still load the page at the maximum offset',
      build: (client) => client.userList(
        const UsersQuery(limit: 100, offset: 900),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: List.generate(
            100,
            (index) => createDefaultFullUserResponse(id: 'user-$index'),
          ),
        ),
      ),
      body: (tester) {
        // Exactly at the cap, so the next page is still reachable
        expect(tester.userListState.nextOffset, UsersQuery.maxOffset);
        expect(tester.userListState.canLoadMore, isTrue);
      },
    );

    userListTest(
      'get - should keep merged users in the order requested by the sort',
      build: (client) => client.userList(
        UsersQuery(sort: [UsersSort.asc(UsersSortField.name)], limit: 1),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse(id: 'user-c', name: 'Charlie')],
        ),
      ),
      body: (tester) async {
        final nextPageQuery = tester.userList.query.copyWith(offset: 1);

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: [createDefaultFullUserResponse(id: 'user-a', name: 'Alice')],
          ),
        );

        await tester.userList.queryMoreUsers();

        expect(
          tester.userListState.users.map((it) => it.name),
          ['Alice', 'Charlie'],
        );
      },
    );

    userListTest(
      'get - should handle failure',
      build: (client) => client.userList(query),
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.queryUsers(payload: query.toRequest()),
          error: Exception('Failed to query users'),
        );

        final result = await tester.userList.get();

        expect(result.isFailure, isTrue);

        // State is untouched on failure
        expect(tester.userListState.users, isEmpty);
        expect(tester.userListState.nextOffset, isNull);
        expect(tester.userListState.canLoadMore, isFalse);
      },
    );
  });
}
