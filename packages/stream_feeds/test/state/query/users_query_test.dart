import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // Distinct values for every filterable and sortable property, so a field
  // wired to the wrong property cannot accidentally still match.
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

  group('Users Query - Filter Fields', () {
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
      test('${testCase.remote} - should read the matching user property', () {
        expect(user.matches(testCase.matching), isTrue);
        expect(user.matches(testCase.notMatching), isFalse);
      });

      test('${testCase.remote} - should serialize to the API field name', () {
        expect(testCase.matching.toJson().keys, [testCase.remote]);
      });
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

  group('Users Query - Sort Fields', () {
    // Each case holds two users that differ only in the sorted property, so a
    // field reading the wrong property compares them as equal.
    final cases = <({String remote, UsersSortField field, UserData other})>[
      (
        remote: 'created_at',
        field: UsersSortField.createdAt,
        other: user.copyWith(createdAt: DateTime.utc(2025)),
      ),
      (
        remote: 'id',
        field: UsersSortField.id,
        other: user.copyWith(id: 'user-2'),
      ),
      (
        remote: 'last_active',
        field: UsersSortField.lastActive,
        other: user.copyWith(lastActive: DateTime.utc(2025, 3, 3)),
      ),
      (
        remote: 'name',
        field: UsersSortField.name,
        other: user.copyWith(name: 'Rey'),
      ),
      (
        remote: 'role',
        field: UsersSortField.role,
        other: user.copyWith(role: 'user'),
      ),
      (
        remote: 'updated_at',
        field: UsersSortField.updatedAt,
        other: user.copyWith(updatedAt: DateTime.utc(2025, 2, 2)),
      ),
    ];

    for (final testCase in cases) {
      test('${testCase.remote} - should order by the matching property', () {
        // Every `other` holds the higher value of the pair.
        expect(
          UsersSort.asc(testCase.field).compare(user, testCase.other),
          isNegative,
        );
        expect(
          UsersSort.desc(testCase.field).compare(user, testCase.other),
          isPositive,
        );
      });

      test('${testCase.remote} - should serialize to the API field name', () {
        expect(
          UsersSort.asc(testCase.field).toJson(),
          {'field': testCase.remote, 'direction': SortDirection.asc.value},
        );
      });
    }

    test('defaultSort - should order newest first, tie-breaking on id', () {
      final older = DateTime.utc(2023);
      final users = [
        user.copyWith(id: 'user-2', createdAt: older),
        user.copyWith(id: 'user-1'),
        user.copyWith(id: 'user-3', createdAt: older),
      ]..sort(UsersSort.defaultSort.compare);

      expect(users.map((it) => it.id), ['user-1', 'user-3', 'user-2']);
    });
  });

  group('Users Query - Validation', () {
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

    test('should also validate a query built with copyWith', () {
      expect(
        () => const UsersQuery().copyWith(limit: UsersQuery.maxLimit + 1),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('Users Query - Request', () {
    test('toRequest - should map the query onto the API payload', () {
      final query = UsersQuery(
        filter: Filter.equal(UsersFilterField.role, 'admin'),
        sort: [UsersSort.asc(UsersSortField.name)],
        limit: 10,
        offset: 20,
        includeDeactivatedUsers: true,
      );

      final request = query.toRequest();

      expect(request.filterConditions, {
        'role': {r'$eq': 'admin'},
      });
      expect(request.sort?.map((it) => (it.field, it.direction)), [
        ('name', SortDirection.asc.value),
      ]);
      expect(request.limit, 10);
      expect(request.offset, 20);
      expect(request.includeDeactivatedUsers, isTrue);
    });

    test('toRequest - should leave unset options out of the payload', () {
      final request = const UsersQuery().toRequest();

      // The API applies its own defaults for everything the query omits, so
      // nothing but an empty filter is sent.
      expect(request.filterConditions, isEmpty);
      expect(request.sort, isNull);
      expect(request.limit, isNull);
      expect(request.offset, isNull);
      expect(request.includeDeactivatedUsers, isNull);
    });
  });
}
