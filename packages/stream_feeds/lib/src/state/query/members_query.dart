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
  final Filter<MembersFilterField>? filter;

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

/// Represents a field that can be used in feed members filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for members queries.
extension type const MembersFilterField(String _) implements FilterField {
  /// Filter by the creation timestamp of the member.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = MembersFilterField('created_at');

  /// Filter by the role of the member in the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const role = MembersFilterField('role');

  /// Filter by the status of the member (e.g., "accepted", "pending").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const status = MembersFilterField('status');

  /// Filter by the last update timestamp of the member.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = MembersFilterField('updated_at');

  /// Filter by the user ID of the member.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = MembersFilterField('user_id');

  /// Filter by the feed ID that the member belongs to.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const fid = MembersFilterField('fid');

  /// Filter by whether the member is a request (true/false).
  ///
  /// **Supported operators:** `.equal`
  static const request = MembersFilterField('request');
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
  static final defaultSort = <MembersSort>[
    MembersSort.desc(MembersSortField.createdAt),
  ];
}

/// Defines the fields by which feed members can be sorted.
///
/// This extension type provides specific fields for sorting feed member data.
/// Each field corresponds to a property of the FeedMemberData model, allowing for flexible
/// sorting options when querying members.
extension type const MembersSortField(SortField<FeedMemberData> _)
    implements SortField<FeedMemberData> {
  /// Sort by the creation timestamp of the member.
  /// This field allows sorting members by when they were added to the feed (newest/oldest first).
  static final createdAt = MembersSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the last update timestamp of the member.
  /// This field allows sorting members by when they were last updated (newest/oldest first).
  static final updatedAt = MembersSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );

  /// Sort by the user ID of the member.
  /// This field allows sorting members alphabetically by user ID.
  static final userId = MembersSortField(
    SortField('user_id', (data) => data.user.id),
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
