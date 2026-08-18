import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/user_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'users_query.freezed.dart';

/// A query for retrieving users with filtering, sorting, and pagination.
///
/// Configures how users should be fetched from the Stream Feeds API
/// including filters, sorting options and pagination parameters.
///
/// Unlike most other queries in this SDK, users are paginated with
/// [limit]/[offset] instead of cursors, because the users endpoint does not
/// return page cursors.
///
/// ## Example
/// ```dart
/// final query = UsersQuery(
///   filter: Filter.autoComplete(UsersFilterField.name, 'Al'),
///   sort: [UsersSort.asc(UsersSortField.name)],
///   limit: 25,
/// );
/// ```
@freezed
class UsersQuery with _$UsersQuery {
  const UsersQuery({
    this.filter,
    this.sort,
    this.limit,
    this.offset,
    this.presence,
    this.includeDeactivatedUsers,
  });

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which users
  /// are included in the query results based on field values and comparison operators.
  ///
  /// Use [UsersFilterField] for type-safe field references.
  @override
  final UsersFilter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how users should be ordered in the response.
  /// If not provided, the API will use its default sorting.
  /// Multiple sort fields can be specified.
  @override
  final List<UsersSort>? sort;

  /// The maximum number of users to return.
  /// If not specified, the API will use its default limit.
  @override
  final int? limit;

  /// The number of users to skip before returning results.
  ///
  /// Combine with [limit] to page through results, for example an [offset] of
  /// 25 with a [limit] of 25 returns the second page.
  @override
  final int? offset;

  /// Whether to include online presence information for the returned users.
  ///
  /// When enabled, the `online` and `lastActive` fields of [UserData] reflect
  /// the current presence of each user.
  @override
  final bool? presence;

  /// Whether deactivated users should be included in the results.
  ///
  /// Deactivated users are excluded by default.
  @override
  final bool? includeDeactivatedUsers;
}

// region Filter

/// Represents filtering options for users.
///
/// See [UsersFilterField] for available fields.
typedef UsersFilter = Filter<UserData>;

/// Represents a field that can be used in users filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for users queries.
class UsersFilterField extends FilterField<UserData> {
  /// Creates a new users filter field.
  UsersFilterField(super.remote, super.value);

  /// Filter by whether the user is banned.
  ///
  /// **Supported operators:** `.equal`
  static final banned = UsersFilterField(
    'banned',
    (data) => data.banned,
  );

  /// Filter by the creation timestamp of the user.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = UsersFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the unique identifier of the user.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.autoComplete`
  static final id = UsersFilterField(
    'id',
    (data) => data.id,
  );

  /// Filter by the timestamp the user was last active at.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final lastActive = UsersFilterField(
    'last_active',
    (data) => data.lastActive,
  );

  /// Filter by the name of the user.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.autoComplete`, `.query`
  static final name = UsersFilterField(
    'name',
    (data) => data.name,
  );

  /// Filter by the role of the user.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final role = UsersFilterField(
    'role',
    (data) => data.role,
  );

  /// Filter by the teams the user belongs to.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.contains`
  static final teams = UsersFilterField(
    'teams',
    (data) => data.teams,
  );

  /// Filter by the last update timestamp of the user.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final updatedAt = UsersFilterField(
    'updated_at',
    (data) => data.updatedAt,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for users.
class UsersSort extends Sort<UserData> {
  /// Creates a new users sort with ascending direction.
  const UsersSort.asc(
    UsersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  /// Creates a new users sort with descending direction.
  const UsersSort.desc(
    UsersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();
}

/// Defines the fields by which users can be sorted.
///
/// This extension type provides specific fields for sorting user data.
class UsersSortField extends SortField<UserData> {
  /// Creates a new users sort field.
  UsersSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the user.
  /// This field allows sorting users by when they were created (newest/oldest first).
  static final createdAt = UsersSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the unique identifier of the user.
  /// This field allows sorting users alphabetically by id.
  static final id = UsersSortField(
    'id',
    (data) => data.id,
  );

  /// Sort by the timestamp the user was last active at.
  /// This field allows sorting users by recency of activity.
  static final lastActive = UsersSortField(
    'last_active',
    (data) => data.lastActive,
  );

  /// Sort by the name of the user.
  /// This field allows sorting users alphabetically by name.
  static final name = UsersSortField(
    'name',
    (data) => data.name,
  );

  /// Sort by the last update timestamp of the user.
  /// This field allows sorting users by when they were last updated (newest/oldest first).
  static final updatedAt = UsersSortField(
    'updated_at',
    (data) => data.updatedAt,
  );
}

// endregion

/// Extension for converting a [UsersQuery] to a [api.QueryUsersPayload].
extension UsersQueryRequest on UsersQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryUsersPayload] suitable for making API calls to retrieve users.
  api.QueryUsersPayload toRequest() {
    return api.QueryUsersPayload(
      filterConditions: filter?.toRequest() ?? const {},
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      offset: offset,
      presence: presence,
      includeDeactivatedUsers: includeDeactivatedUsers,
    );
  }
}
