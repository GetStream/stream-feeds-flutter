import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/feed_id.dart';
import '../../models/feed_member_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'members_query.freezed.dart';

/// A query for retrieving feed members with filtering, sorting, and pagination.
///
/// Configures how feed members should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters.
///
/// ## Example
/// ```dart
/// final query = MembersQuery(
///   fid: FeedId(group: 'team', id: 'developers'),
///   filter: Filter.equal(MembersFilterField.role, "moderator"),
///   sort: MembersSort.defaultSort,
///   limit: 20,
/// );
/// ```
@freezed
class MembersQuery with _$MembersQuery {
  const MembersQuery({
    required this.fid,
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The feed ID to fetch members for.
  @override
  final FeedId fid;

  /// The filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which members are
  /// included in the query results based on field values and comparison operators.
  ///
  /// Use [MembersFilterField] for type-safe field references.
  @override
  final MembersFilter? filter;

  /// The sorting criteria for this query.
  ///
  /// Specifies how members should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<MembersSort>? sort;

  /// The maximum number of members to return.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  ///
  /// This cursor is typically provided in the response of a previous request
  /// and should be used to fetch subsequent pages of members.
  @override
  final String? next;

  /// The previous page cursor for pagination.
  ///
  /// This cursor is typically provided in the response of a previous request
  /// and should be used to fetch earlier pages when paginating backwards.
  @override
  final String? previous;
}

// region Filter

/// Represents a filtering operation for feed members.
///
/// See [MembersFilterField] for available fields to filter on.
typedef MembersFilter = Filter<FeedMemberData>;

/// Represents a field that can be used in feed members filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for members queries.
class MembersFilterField extends FilterField<FeedMemberData> {
  /// Creates a new members filter field.
  MembersFilterField(super.remote, super.value);

  /// Filter by the creation timestamp of the member.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = MembersFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the role of the member in the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final role = MembersFilterField(
    'role',
    (data) => data.role,
  );

  /// Filter by the status of the member (e.g., "accepted", "pending").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final status = MembersFilterField(
    'status',
    (data) => data.status,
  );

  /// Filter by the last update timestamp of the member.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final updatedAt = MembersFilterField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Filter by the user ID of the member.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final userId = MembersFilterField(
    'user_id',
    (data) => data.user.id,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for feed members.
///
/// This class extends the base Sort functionality and provides specific
/// sorting capabilities for feed member data with default configurations.
class MembersSort extends Sort<FeedMemberData> {
  /// Creates a new members sort with ascending direction.
  const MembersSort.asc(
    MembersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  /// Creates a new members sort with descending direction.
  const MembersSort.desc(
    MembersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// Default sorting configuration for feed members.
  ///
  /// This uses the `createdAt` field in reverse order, meaning the most recently added
  /// members will appear first.
  static final List<MembersSort> defaultSort = [
    MembersSort.desc(MembersSortField.createdAt),
  ];
}

/// Defines the fields by which feed members can be sorted.
///
/// This extension type provides specific fields for sorting feed member data.
/// Each field corresponds to a property of the FeedMemberData model, allowing for flexible
/// sorting options when querying members.
class MembersSortField extends SortField<FeedMemberData> {
  /// Creates a new members sort field.
  MembersSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the member.
  /// This field allows sorting members by when they were added to the feed (newest/oldest first).
  static final createdAt = MembersSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the last update timestamp of the member.
  /// This field allows sorting members by when they were last updated (newest/oldest first).
  static final updatedAt = MembersSortField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Sort by the user ID of the member.
  /// This field allows sorting members alphabetically by user ID.
  static final userId = MembersSortField(
    'user_id',
    (data) => data.user.id,
  );
}

// endregion

/// Extension for converting a [MembersQuery] to a [api.QueryFeedMembersRequest].
extension MembersQueryRequest on MembersQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryFeedMembersRequest] suitable for making API calls to retrieve feed members.
  api.QueryFeedMembersRequest toRequest() {
    return api.QueryFeedMembersRequest(
      limit: limit,
      next: next,
      prev: previous,
      sort: sort?.map((s) => s.toRequest()).toList(),
      filter: filter?.toRequest(),
    );
  }
}
