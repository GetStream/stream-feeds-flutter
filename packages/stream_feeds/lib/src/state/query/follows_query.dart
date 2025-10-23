import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/follow_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'follows_query.freezed.dart';

/// A query for retrieving follow relationships with filtering, sorting, and pagination.
///
/// Configures how follow relationships should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters.
///
/// ## Example
/// ```dart
/// final query = FollowsQuery(
///   filter: Filter.equal(FollowsFilterField.status, "accepted"),
///   sort: [FollowsSort.desc(FollowsSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class FollowsQuery with _$FollowsQuery {
  const FollowsQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which follows
  /// are included in the query results based on field values and comparison operators.
  ///
  /// Use this to narrow down results based on specific criteria such as
  /// source feed, target feed, follow status, or creation timestamp. If null,
  /// all follow relationships will be considered (subject to other parameters).
  ///
  /// Use [FollowsFilterField] for type-safe field references.
  @override
  final FollowsFilter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how follow relationships should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<FollowsSort>? sort;

  /// The maximum number of follow relationships to return.
  ///
  /// Controls pagination by limiting the response size. If not specified,
  /// the API will use its default limit. Use with [next] and [previous]
  /// for paginated access to large follow sets.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  ///
  /// This cursor is typically provided in the response of a previous request
  /// and should be used to fetch subsequent pages of follow relationships.
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

/// Represents a filtering operation for follows.
///
/// See [FollowsFilterField] for available fields to filter on.
typedef FollowsFilter = Filter<FollowData>;

/// Represents a field that can be used in follows filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for follows queries.
class FollowsFilterField extends FilterField<FollowData> {
  /// Creates a new follows filter field.
  FollowsFilterField(super.remote, super.value);

  /// Filter by the source feed ID (the feed that is following).
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final sourceFeed = FollowsFilterField(
    'source_feed',
    (data) => data.sourceFeed.feed.rawValue,
  );

  /// Filter by the target feed ID (the feed being followed).
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final targetFeed = FollowsFilterField(
    'target_feed',
    (data) => data.targetFeed.feed.rawValue,
  );

  /// Filter by the status of the follow relationship (e.g., "accepted", "pending").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final status = FollowsFilterField(
    'status',
    (data) => data.status,
  );

  /// Filter by the creation timestamp of the follow relationship.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = FollowsFilterField(
    'created_at',
    (data) => data.createdAt,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for follows.
class FollowsSort extends Sort<FollowData> {
  const FollowsSort.asc(
    FollowsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const FollowsSort.desc(
    FollowsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for follows queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<FollowsSort> defaultSort = [
    FollowsSort.desc(FollowsSortField.createdAt),
  ];
}

/// Defines the fields by which follows can be sorted.
///
/// This extension type provides specific fields for sorting follow data.
class FollowsSortField extends SortField<FollowData> {
  /// Creates a new follows sort field.
  FollowsSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the follow relationship.
  /// This field allows sorting follows by when they were created (newest/oldest first).
  static final createdAt = FollowsSortField(
    'created_at',
    (data) => data.createdAt,
  );
}

// endregion

/// Extensions for converting [FollowsQuery] to API requests.
extension FollowsQueryRequest on FollowsQuery {
  /// Converts this query to an API request format.
  ///
  /// Transforms the query parameters into the format expected by the
  /// Stream Feeds API. Filters are converted to their JSON representation,
  /// sort criteria are mapped to API sort objects, and pagination parameters
  /// are passed through directly.
  ///
  /// Returns a [api.QueryFollowsRequest] ready for API transmission.
  api.QueryFollowsRequest toRequest() {
    return api.QueryFollowsRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
