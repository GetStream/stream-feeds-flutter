import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'activities_query.freezed.dart';

/// A query for retrieving activities with filtering, sorting, and pagination.
///
/// Supports comprehensive activity discovery by content, time ranges, and social metrics.
/// Includes flexible filtering options and efficient pagination.
///
/// ## Example
/// ```dart
/// final query = ActivitiesQuery(
///   filter: Filter.equal(ActivitiesFilterField.type, "post"),
///   sort: [ActivitiesSort.desc(ActivitiesSortField.createdAt)],
///   limit: 20,
/// );
/// ```
@freezed
class ActivitiesQuery with _$ActivitiesQuery {
  const ActivitiesQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The filter criteria for this query.
  ///
  /// Use [ActivitiesFilterField] for type-safe field references.
  @override
  final ActivitiesFilter? filter;

  /// The sorting criteria for this query.
  @override
  final List<ActivitiesSort>? sort;

  /// The maximum number of activities to return.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  @override
  final String? next;

  /// The previous page cursor for pagination.
  @override
  final String? previous;
}

// region Filter

/// Represents a filtering operation for activities.
///
/// See [ActivitiesFilterField] for available fields to filter on.
typedef ActivitiesFilter = Filter<ActivityData>;

/// Represents a field that can be used in activities filtering.
class ActivitiesFilterField extends FilterField<ActivityData> {
  /// Creates a new activities filter field.
  ActivitiesFilterField(super.remote, super.value);

  /// Filter by the creation timestamp of the activity.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = ActivitiesFilterField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Filter by the expiration timestamp of the activity.
  ///
  /// **Supported operators:** `.exists`
  static final expiresAt = ActivitiesFilterField(
    'expires_at',
    (data) => data.expiresAt,
  );

  /// Filter by the unique identifier of the activity.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final id = ActivitiesFilterField(
    'id',
    (data) => data.id,
  );

  /// Filter by the filter tags associated with the activity.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.customContains`
  static final filterTags = ActivitiesFilterField(
    'filter_tags',
    (data) => data.filterTags,
  );

  /// Filter by the popularity score of the activity.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final popularity = ActivitiesFilterField(
    'popularity',
    (data) => data.popularity,
  );

  /// Filter by the search data content of the activity.
  ///
  /// **Supported operators:** `.equal`, `.customQ`, `.customAutocomplete`
  static final searchData = ActivitiesFilterField(
    'search_data',
    (data) => data.searchData,
  );

  /// Filter by the text content of the activity.
  ///
  /// **Supported operators:** `.equal`, `.customQ`, `.customAutocomplete`
  static final text = ActivitiesFilterField(
    'text',
    (data) => data.text,
  );

  /// Filter by the type of activity (e.g., "post", "comment", "reaction").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final type = ActivitiesFilterField(
    'type',
    (data) => data.type,
  );

  /// Filter by the user ID who created the activity.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final userId = ActivitiesFilterField(
    'user_id',
    (data) => data.user.id,
  );

  /// Filter by the proximity to a specific location.
  ///
  /// Note: This requires an object with latitude ('lat'), longitude ('lng')
  /// and distance in km ('distance).
  ///
  /// **Supported operators:** `.equal`
  static final near = ActivitiesFilterField(
    'near',
    (data) => data.location,
  );

  /// Filter by activities within specific geographical bounds.
  ///
  /// Note: This requires an object with 'sw_lat', 'sw_lng' (southwest corner)
  /// and 'ne_lat', 'ne_lng' (northeast) corner keys.
  ///
  /// **Supported operators:** `.equal`
  static final withinBounds = ActivitiesFilterField(
    'within_bounds',
    (data) => data.location,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for activities.
///
/// This class extends the base Sort functionality and provides specific
/// sorting capabilities for activity data with default configurations.
class ActivitiesSort extends Sort<ActivityData> {
  /// Creates a new activities sort with ascending direction.
  const ActivitiesSort.asc(
    ActivitiesSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  /// Creates a new activities sort with descending direction.
  const ActivitiesSort.desc(
    ActivitiesSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// Default sorting configuration for activities.
  ///
  /// This uses the `createdAt` field in reverse order, meaning the most recent activities
  /// will appear first.
  static final List<ActivitiesSort> defaultSort = [
    ActivitiesSort.desc(ActivitiesSortField.createdAt),
  ];
}

/// Defines the fields by which activities can be sorted.
///
/// This extension type provides specific fields for sorting activity data.
/// Each field corresponds to a property of the ActivityData model, allowing for flexible
/// sorting options when querying activities.
class ActivitiesSortField extends SortField<ActivityData> {
  /// Creates a new activities sort field.
  ActivitiesSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the activity.
  /// This field allows sorting activities by when they were created (newest/oldest first).
  static final createdAt = ActivitiesSortField(
    'created_at',
    (data) => data.createdAt,
  );

  /// Sort by the popularity score of the activity.
  /// This field allows sorting activities by popularity (most/least popular first).
  static final popularity = ActivitiesSortField(
    'popularity',
    (data) => data.popularity,
  );
}

// endregion

/// Extension for converting an [ActivitiesQuery] to a [api.QueryActivitiesRequest].
extension ActivitiesQueryRequest on ActivitiesQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryActivitiesRequest] suitable for making API calls to retrieve activities.
  api.QueryActivitiesRequest toRequest() {
    return api.QueryActivitiesRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
