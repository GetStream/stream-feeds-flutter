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
          users: [
            createDefaultFullUserResponse(),
            createDefaultFullUserResponse(id: 'user-2'),
          ],
        ),
      ),
      body: (tester) async {
        final nextPageQuery = tester.userList.query.copyWith(
          offset: 2,
          limit: 5,
        );

        tester.mockApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
          result: createDefaultQueryUsersResponse(
            users: List.generate(
              5,
              (index) => createDefaultFullUserResponse(id: 'user-$index'),
            ),
          ),
        );

        await tester.userList.queryMoreUsers(limit: 5);

        tester.verifyApi(
          (api) => api.queryUsers(payload: nextPageQuery.toRequest()),
        );

        // The override is also what decides whether the page was the last one
        expect(tester.userListState.nextOffset, 7);
      },
    );

    userListTest(
      'queryMoreUsers - should stop when a page is shorter than the limit',
      build: (client) => client.userList(const UsersQuery(limit: 2)),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [createDefaultFullUserResponse()],
        ),
      ),
      body: (tester) async {
        // A single user for a limit of two means there is no next page, so no
        // extra request is needed to discover the end.
        expect(tester.userListState.users, hasLength(1));
        expect(tester.userListState.nextOffset, isNull);
        expect(tester.userListState.canLoadMore, isFalse);

        final result = await tester.userList.queryMoreUsers();

        expect(result.getOrThrow(), isEmpty);
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

  // ============================================================
  // FEATURE: Filter Fields
  // ============================================================

  group('User List - Filter Fields', () {
    // Distinct values for every filterable property, so a field wired to the
    // wrong property cannot accidentally still match.
    final user = UserData(
      banned: true,
      createdAt: DateTime.utc(2024),
      id: 'user-1',
      lastActive: DateTime.utc(2024, 3, 3),
      name: 'Luke',
      online: false,
      role: 'admin',
      teams: const ['red'],
      updatedAt: DateTime.utc(2024, 2, 2),
    );

    // Each case pairs a filter that should match [user] with one that should
    // not, which pins down both the remote field name sent to the API and the
    // local property the field reads.
    final cases =
        <
          ({
            String remote,
            UsersFilter matching,
            UsersFilter notMatching,
          })
        >[
          (
            remote: 'banned',
            matching: Filter.equal(UsersFilterField.banned, true),
            notMatching: Filter.equal(UsersFilterField.banned, false),
          ),
          (
            remote: 'created_at',
            matching: Filter.equal(UsersFilterField.createdAt, user.createdAt),
            notMatching: Filter.equal(UsersFilterField.createdAt, user.updatedAt),
          ),
          (
            remote: 'id',
            matching: Filter.in_(UsersFilterField.id, const ['user-1', 'user-2']),
            notMatching: Filter.equal(UsersFilterField.id, 'Luke'),
          ),
          (
            remote: 'last_active',
            matching: Filter.greater(UsersFilterField.lastActive, user.updatedAt),
            notMatching: Filter.less(UsersFilterField.lastActive, user.updatedAt),
          ),
          (
            remote: 'name',
            matching: Filter.autoComplete(UsersFilterField.name, 'Lu'),
            notMatching: Filter.equal(UsersFilterField.name, 'user-1'),
          ),
          (
            remote: 'role',
            matching: Filter.equal(UsersFilterField.role, 'admin'),
            notMatching: Filter.equal(UsersFilterField.role, 'user'),
          ),
          (
            remote: 'teams',
            matching: Filter.contains(UsersFilterField.teams, 'red'),
            notMatching: Filter.contains(UsersFilterField.teams, 'blue'),
          ),
          (
            remote: 'updated_at',
            matching: Filter.equal(UsersFilterField.updatedAt, user.updatedAt),
            notMatching: Filter.equal(UsersFilterField.updatedAt, user.createdAt),
          ),
        ];

    for (final testCase in cases) {
      // The SDK never evaluates a users filter itself, because a user list
      // takes no WebSocket events. `matches` is public API though, so an app
      // can filter a list of users it already holds.
      test('${testCase.remote} - should read the matching user property', () {
        expect(user.matches(testCase.matching), isTrue);
        expect(user.matches(testCase.notMatching), isFalse);
      });

      userListTest(
        '${testCase.remote} - should send the API field name',
        build: (client) => client.userList(UsersQuery(filter: testCase.matching)),
        setUp: (tester) => tester.get(),
        body: (tester) {
          final payload = tester.capturedQueryUsersPayload;
          expect(payload.filterConditions.keys, [testCase.remote]);
        },
      );
    }

    test('should match a user against a combination of filters', () {
      final filter = Filter.and([
        Filter.equal(UsersFilterField.role, 'admin'),
        Filter.contains(UsersFilterField.teams, 'red'),
      ]);

      expect(user.matches(filter), isTrue);
      expect(user.copyWith(role: 'user').matches(filter), isFalse);
    });
  });

  // ============================================================
  // FEATURE: Sort Fields
  // ============================================================

  group('User List - Sort Fields', () {
    // A user list merges pages by id, so the pair in each case cannot be made
    // to differ in the sorted property alone. Instead the id and the name run
    // *opposite* to the property under test, so a field wired to either of
    // those produces the reverse order and fails the assertion.
    //
    // Ascending, the user holding the lower value therefore comes first:
    // 'Zoe' (id `user-z`) ahead of 'Amy' (id `user-a`).
    const ascending = ['Zoe', 'Amy'];

    final cases =
        <
          ({
            String remote,
            UsersSortField field,
            List<String> ascending,
            FullUserResponse lower,
            FullUserResponse higher,
          })
        >[
          (
            remote: 'created_at',
            field: UsersSortField.createdAt,
            ascending: ascending,
            lower: createDefaultFullUserResponse(
              id: 'user-z',
              name: 'Zoe',
              createdAt: DateTime.utc(2024),
            ),
            higher: createDefaultFullUserResponse(
              id: 'user-a',
              name: 'Amy',
              createdAt: DateTime.utc(2025),
            ),
          ),
          (
            remote: 'id',
            field: UsersSortField.id,
            ascending: ascending,
            // The field under test is the id, so only the name runs opposite.
            lower: createDefaultFullUserResponse(id: 'user-a', name: 'Zoe'),
            higher: createDefaultFullUserResponse(id: 'user-z', name: 'Amy'),
          ),
          (
            remote: 'last_active',
            field: UsersSortField.lastActive,
            ascending: ascending,
            lower: createDefaultFullUserResponse(
              id: 'user-z',
              name: 'Zoe',
              lastActive: DateTime.utc(2024, 3, 3),
            ),
            higher: createDefaultFullUserResponse(
              id: 'user-a',
              name: 'Amy',
              lastActive: DateTime.utc(2025, 3, 3),
            ),
          ),
          (
            remote: 'name',
            field: UsersSortField.name,
            // The field under test is the name, so only the id runs opposite.
            ascending: ['Amy', 'Zoe'],
            lower: createDefaultFullUserResponse(id: 'user-z', name: 'Amy'),
            higher: createDefaultFullUserResponse(id: 'user-a', name: 'Zoe'),
          ),
          (
            remote: 'role',
            field: UsersSortField.role,
            ascending: ascending,
            lower: createDefaultFullUserResponse(
              id: 'user-z',
              name: 'Zoe',
              role: 'admin',
            ),
            higher: createDefaultFullUserResponse(
              id: 'user-a',
              name: 'Amy',
              role: 'moderator',
            ),
          ),
          (
            remote: 'updated_at',
            field: UsersSortField.updatedAt,
            ascending: ascending,
            lower: createDefaultFullUserResponse(
              id: 'user-z',
              name: 'Zoe',
              updatedAt: DateTime.utc(2024, 2, 2),
            ),
            higher: createDefaultFullUserResponse(
              id: 'user-a',
              name: 'Amy',
              updatedAt: DateTime.utc(2025, 2, 2),
            ),
          ),
        ];

    for (final testCase in cases) {
      userListTest(
        '${testCase.remote} - should order the list by the matching property',
        build: (client) => client.userList(
          UsersQuery(sort: [UsersSort.asc(testCase.field)]),
        ),
        // Served highest-first, so the resulting order is the sort's doing and
        // not the order the server happened to send.
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            users: [testCase.higher, testCase.lower],
          ),
        ),
        body: (tester) {
          expect(
            tester.userListState.users.map((it) => it.name),
            testCase.ascending,
          );
        },
      );

      userListTest(
        '${testCase.remote} - should order the list in reverse when descending',
        build: (client) => client.userList(
          UsersQuery(sort: [UsersSort.desc(testCase.field)]),
        ),
        setUp: (tester) => tester.get(
          modifyResponse: (response) => response.copyWith(
            users: [testCase.lower, testCase.higher],
          ),
        ),
        body: (tester) {
          expect(
            tester.userListState.users.map((it) => it.name),
            testCase.ascending.reversed,
          );
        },
      );

      userListTest(
        '${testCase.remote} - should send the API field name',
        build: (client) => client.userList(
          UsersQuery(sort: [UsersSort.asc(testCase.field)]),
        ),
        setUp: (tester) => tester.get(),
        body: (tester) {
          final payload = tester.capturedQueryUsersPayload;
          expect(payload.sort?.map((it) => (it.field, it.direction)), [
            (testCase.remote, SortDirection.asc.value),
          ]);
        },
      );
    }

    userListTest(
      'defaultSort - should order newest first, tie-breaking on id descending',
      build: (client) => client.userList(const UsersQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          users: [
            // `user-2` and `user-3` share a createdAt and are older than
            // `user-4`, so they land after it and settle on id descending.
            createDefaultFullUserResponse(
              id: 'user-2',
              createdAt: DateTime.utc(2020),
            ),
            createDefaultFullUserResponse(
              id: 'user-4',
              createdAt: DateTime.utc(2021),
            ),
            createDefaultFullUserResponse(
              id: 'user-3',
              createdAt: DateTime.utc(2020),
            ),
          ],
        ),
      ),
      body: (tester) {
        expect(
          tester.userListState.users.map((it) => it.id),
          ['user-4', 'user-3', 'user-2'],
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Query Validation
  // ============================================================

  group('User List - Query Validation', () {
    // A `const` query with an invalid limit or offset fails to compile, so the
    // queries here are built through a function to assert at runtime instead.
    UsersQuery buildQuery({int? limit, int? offset}) {
      return UsersQuery(limit: limit, offset: offset);
    }

    test('should reject a limit outside the range the API accepts', () {
      expect(
        () => buildQuery(limit: UsersQuery.maxLimit + 1),
        throwsA(isA<AssertionError>()),
      );
      expect(() => buildQuery(limit: 0), throwsA(isA<AssertionError>()));

      expect(buildQuery(limit: UsersQuery.maxLimit).limit, UsersQuery.maxLimit);
    });

    test('should reject an offset outside the range the API accepts', () {
      expect(
        () => buildQuery(offset: UsersQuery.maxOffset + 1),
        throwsA(isA<AssertionError>()),
      );
      expect(() => buildQuery(offset: -1), throwsA(isA<AssertionError>()));

      // The last page still starts at the maximum offset itself.
      expect(
        buildQuery(offset: UsersQuery.maxOffset).offset,
        UsersQuery.maxOffset,
      );
    });

    userListTest(
      'queryMoreUsers - should reject a limit override outside the range',
      build: (client) => client.userList(const UsersQuery(limit: 2)),
      setUp: (tester) => tester.get(),
      body: (tester) {
        // The override goes through `copyWith`, so the same bounds apply.
        expect(
          () => tester.userList.queryMoreUsers(limit: UsersQuery.maxLimit + 1),
          throwsA(isA<AssertionError>()),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Request Payload
  // ============================================================

  group('User List - Request Payload', () {
    userListTest(
      'should send every option the query sets',
      build: (client) => client.userList(
        UsersQuery(
          filter: Filter.equal(UsersFilterField.role, 'admin'),
          sort: [UsersSort.asc(UsersSortField.name)],
          limit: 10,
          offset: 20,
          includeDeactivatedUsers: true,
        ),
      ),
      setUp: (tester) => tester.get(),
      body: (tester) {
        final payload = tester.capturedQueryUsersPayload;

        expect(payload.filterConditions, {
          'role': {r'$eq': 'admin'},
        });
        expect(payload.sort?.map((it) => (it.field, it.direction)), [
          ('name', SortDirection.asc.value),
        ]);
        expect(payload.limit, 10);
        expect(payload.offset, 20);
        expect(payload.includeDeactivatedUsers, isTrue);
      },
    );

    userListTest(
      'should leave unset options out of the payload',
      build: (client) => client.userList(const UsersQuery()),
      setUp: (tester) => tester.get(),
      body: (tester) {
        final payload = tester.capturedQueryUsersPayload;

        // The API applies its own defaults for everything the query omits, so
        // nothing but an empty filter is sent.
        expect(payload.filterConditions, isEmpty);
        expect(payload.sort, isNull);
        expect(payload.limit, isNull);
        expect(payload.offset, isNull);
        expect(payload.includeDeactivatedUsers, isNull);
      },
    );
  });
}
