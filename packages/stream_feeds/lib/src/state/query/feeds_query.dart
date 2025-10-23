import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart';
import '../../models/feed_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'feeds_query.freezed.dart';

/// A query for retrieving feeds with filtering, sorting, and pagination.
///
/// Supports comprehensive feed discovery by metadata, social metrics, and time-based criteria.
/// Includes flexible filtering options and efficient pagination.
///
/// ## Example
/// ```dart
/// final query = FeedsQuery(
///   filter: Filter.equal(FeedsFilterField.visibility, "public"),
///   sort: [FeedsSort.desc(FeedsSortField.createdAt)],
///   limit: 20,
///   watch: true,
/// );
/// ```
@freezed
class FeedsQuery with _$FeedsQuery {
  const FeedsQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
    this.watch = false,
  });

  /// The filter criteria for this query.
  ///
  /// Use [FeedsFilterField] for type-safe field references.
  @override
  final FeedsFilter? filter;

  /// The sorting criteria for this query.
  @override
  final List<FeedsSort>? sort;

  /// The maximum number of feeds to return.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  @override
  final String? next;

  /// The previous page cursor for pagination.
  @override
  final String? previous;

  /// Whether to subscribe to real-time updates for the query results.
  @override
  final bool watch;
}

// region Filter

/// Represents filtering options for feeds.
///
/// See [FeedsFilterField] for available fields to filter on.
typedef FeedsFilter = Filter<FeedData>;

/// Represents a field that can be used in feeds filtering.
///
/// This type provides a type-safe way to specify which field should be used
/// when creating filters for feeds queries.
class FeedsFilterField extends FilterField<FeedData> {
  /// Creates a new feeds filter field.
  FeedsFilterField(super.remote, super.value);

  /// Filter by the unique identifier of the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final id = FeedsFilterField(
    'id',
    (data) => data.id,
  );

  /// Filter by the group ID of the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final groupId = FeedsFilterField(
    'group_id',
    (data) => data.groupId,
  );

  /// Filter by the feed ID (feed) of the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final feed = FeedsFilterField(
    'feed',
    (data) => data.feed.rawValue,
  );

  /// Filter by the creation timestamp of the feed.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`,
  /// `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = FeedsFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the ID of the user who created the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final createdById = FeedsFilterField(
    'created_by_id',
    (data) => data.createdBy.id,
  );

  /// Filter by the name of the user who created the feed.
  ///
  /// **Supported operators:** `.equal`, `.customQ`, `.customAutocomplete`
  static final createdByName = FeedsFilterField(
    'created_by.name',
    (data) => data.createdBy.name,
  );

  /// Filter by the description of the feed.
  ///
  /// **Supported operators:** `.equal`, `.customQ`, `.customAutocomplete`
  static final description = FeedsFilterField(
    'description',
    (data) => data.description,
  );

  /// Filter by the number of followers the feed has.
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.greaterThan`,
  /// `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final followerCount = FeedsFilterField(
    'follower_count',
    (data) => data.followerCount,
  );

  /// Filter by the number of feeds this feed is following.
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.greaterThan`,
  /// `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final followingCount = FeedsFilterField(
    'following_count',
    (data) => data.followingCount,
  );

  /// Filter by the number of members in the feed.
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.greaterThan`,
  /// `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final memberCount = FeedsFilterField(
    'member_count',
    (data) => data.memberCount,
  );

  /// Filter by specific members in the feed.
  ///
  /// **Supported operators:** `.in`
  static final members = FeedsFilterField(
    'members',
    (data) => <String>[], // Local data unavailable
  );

  /// Filter by the name of the feed.
  ///
  /// **Supported operators:** `.equal`, `.customQ`, `.customAutocomplete`
  static final name = FeedsFilterField(
    'name',
    (data) => data.name,
  );

  /// Filter by the last update timestamp of the feed.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`,
  /// `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final updatedAt = FeedsFilterField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Filter by the visibility setting of the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final visibility = FeedsFilterField(
    'visibility',
    (data) => data.visibility,
  );

  /// Filter by feeds that this feed is following.
  ///
  /// **Supported operators:** `.in`
  static final followingFeeds = FeedsFilterField(
    'following_feeds',
    (data) => <String>[], // Local data unavailable
  );

  /// Filter by filter tags associated with the feed.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.customContains`
  static final filterTags = FeedsFilterField(
    'filter_tags',
    (data) => data.filterTags,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for feeds.
class FeedsSort extends Sort<FeedData> {
  const FeedsSort.asc(
    FeedsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const FeedsSort.desc(
    FeedsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for feeds queries.
  ///
  /// Sorts feeds by creation date in ascending order (oldest first).
  static final List<FeedsSort> defaultSort = [
    FeedsSort.asc(FeedsSortField.createdAt),
  ];
}

/// Defines the fields by which feeds can be sorted.
///
/// This extension type implements [SortField] and provides specific fields for
/// sorting feed data.
///
/// Each field corresponds to a property of the [FeedData] model, allowing for
/// flexible sorting options when querying feeds.
class FeedsSortField extends SortField<FeedData> {
  /// Creates a new feeds sort field.
  FeedsSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the feed.
  ///
  /// Allows sorting feeds by when they were created (newest/oldest first).
  static final createdAt = FeedsSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the update timestamp of the feed.
  ///
  /// Allows sorting feeds by when they were last updated (newest/oldest first).
  static final updatedAt = FeedsSortField(
    'updated_at',
    (data) => data.updatedAt,
  );

  /// Sort by the number of members in the feed.
  /// Allows sorting feeds by member count (most/least members).
  static final memberCount = FeedsSortField(
    'member_count',
    (data) => data.memberCount,
  );

  /// Sort by the number of followers the feed has.
  ///
  /// Allows sorting feeds by popularity (most/least followed).
  static final followerCount = FeedsSortField(
    'follower_count',
    (data) => data.followerCount,
  );

  /// Sort by the number of feeds this feed is following.
  ///
  /// Allows sorting feeds by how many feeds they follow.
  static final followingCount = FeedsSortField(
    'following_count',
    (data) => data.followingCount,
  );
}

// endregion

/// Extension that converts a [FeedsQuery] to a [QueryFeedsRequest].
extension FeedsQueryRequest on FeedsQuery {
  /// Converts the [FeedsQuery] to a [QueryFeedsRequest].
  ///
  /// This function maps the properties of the [FeedsQuery] to the corresponding fields in the
  /// [QueryFeedsRequest], allowing it to be used in API requests.
  ///
  /// @return A [QueryFeedsRequest] object with the properties from this query.
  QueryFeedsRequest toRequest() {
    return QueryFeedsRequest(
      limit: limit,
      next: next,
      prev: previous,
      watch: watch,
      sort: sort?.map((s) => s.toRequest()).toList(),
      filter: filter?.toRequest(),
    );
  }
}
