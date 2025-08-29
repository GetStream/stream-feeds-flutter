import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/feeds_reaction_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'activity_reactions_query.freezed.dart';

/// A query for retrieving activity reactions with filtering, sorting, and pagination.
///
/// Supports comprehensive reaction discovery by activity, user, and reaction type.
/// Includes flexible filtering options and efficient pagination.
///
/// ## Example
/// ```dart
/// final query = ActivityReactionsQuery(
///   activityId: "activity123",
///   filter: Filter.equal(ActivityReactionsFilterField.reactionType, "like"),
///   sort: [ActivityReactionsSort.desc(ActivityReactionsSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class ActivityReactionsQuery with _$ActivityReactionsQuery {
  const ActivityReactionsQuery({
    required this.activityId,
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The unique identifier of the activity to fetch reactions for.
  @override
  final String activityId;

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which activity reactions
  /// are included in the query results based on field values and comparison operators.
  ///
  /// Use [ActivityReactionsFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how activity reactions should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<ActivityReactionsSort>? sort;

  /// The maximum number of activity reactions to return.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  ///
  /// This cursor is typically provided in the response of a previous request
  /// and should be used to fetch subsequent pages of activity reactions.
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

/// Represents a field that can be used in activity reactions filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for activity reactions queries.
extension type const ActivityReactionsFilterField(String field)
    implements String {
  /// Filter by the reaction type (e.g., "like", "love", "angry").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const reactionType = ActivityReactionsFilterField('reaction_type');

  /// Filter by the user ID who created the reaction.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = ActivityReactionsFilterField('user_id');

  /// Filter by the creation timestamp of the reaction.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = ActivityReactionsFilterField('created_at');
}

// endregion

// region Sort

/// Represents a sorting operation for activity reactions.
class ActivityReactionsSort extends Sort<FeedsReactionData> {
  const ActivityReactionsSort.asc(
    ActivityReactionsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const ActivityReactionsSort.desc(
    ActivityReactionsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for activity reactions queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<ActivityReactionsSort> defaultSort = [
    ActivityReactionsSort.desc(ActivityReactionsSortField.createdAt),
  ];
}

/// Defines the fields by which activity reactions can be sorted.
///
/// This extension type provides specific fields for sorting activity reaction data.
extension type const ActivityReactionsSortField(
        SortField<FeedsReactionData> field)
    implements SortField<FeedsReactionData> {
  /// Sort by the creation timestamp of the reaction.
  /// This field allows sorting reactions by when they were created (newest/oldest first).
  static final createdAt = ActivityReactionsSortField(
    SortField('created_at', (data) => data.createdAt),
  );
}

// endregion

/// Extensions for converting [ActivityReactionsQuery] to API requests.
extension ActivityReactionsQueryRequest on ActivityReactionsQuery {
  /// Converts this query to an API request format.
  ///
  /// Transforms the query parameters into the format expected by the
  /// Stream Feeds API. Filters are converted to their JSON representation,
  /// sort criteria are mapped to API sort objects, and pagination parameters
  /// are passed through directly.
  ///
  /// Returns a [api.QueryActivityReactionsRequest] ready for API transmission.
  api.QueryActivityReactionsRequest toRequest() {
    return api.QueryActivityReactionsRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
