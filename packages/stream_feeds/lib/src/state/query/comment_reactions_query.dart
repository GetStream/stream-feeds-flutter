import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/feeds_reaction_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'comment_reactions_query.freezed.dart';

/// A query for retrieving comment reactions with filtering, sorting, and pagination.
///
/// Configures how comment reactions should be fetched from the Stream Feeds API
/// including filters, sorting options, and pagination parameters. Supports efficient
/// pagination with cursors, configurable sorting options for reaction ordering,
/// and filtering by reaction type, user ID, and creation date.
///
/// ## Example
/// ```dart
/// final query = CommentReactionsQuery(
///   commentId: 'comment-123',
///   filter: Filter.equal(CommentReactionsFilterField.type, "like"),
///   sort: [CommentReactionsSort.desc(CommentReactionsSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class CommentReactionsQuery with _$CommentReactionsQuery {
  const CommentReactionsQuery({
    required this.commentId,
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The unique identifier of the comment to fetch reactions for.
  @override
  final String commentId;

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which comment reactions
  /// are included in the query results based on field values and comparison operators.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [CommentReactionsFilterField] for type-safe field references.
  @override
  final CommentReactionsFilter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how comment reactions should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<CommentReactionsSort>? sort;

  /// The maximum number of comment reactions to return.
  /// If not specified, the API will use its default limit.
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

/// Represents a filtering operation for comment reactions.
///
/// See [CommentReactionsFilterField] for available fields to filter on.
typedef CommentReactionsFilter = Filter<FeedsReactionData>;

/// Represents a field that can be used in comment reactions filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for comment reactions queries.
class CommentReactionsFilterField extends FilterField<FeedsReactionData> {
  /// Creates a new comment reactions filter field.
  CommentReactionsFilterField(super.remote, super.value);

  /// Filter by the reaction type (e.g., "like", "love", "angry").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final reactionType = CommentReactionsFilterField(
    'reaction_type',
    (data) => data.type,
  );

  /// Filter by the user ID who created the reaction.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static final userId = CommentReactionsFilterField(
    'user_id',
    (data) => data.user.id,
  );

  /// Filter by the creation timestamp of the reaction.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static final createdAt = CommentReactionsFilterField(
    'created_at',
    (data) => data.createdAt,
  );
}

// endregion

// region Sort

/// Represents a sorting operation for comment reactions.
class CommentReactionsSort extends Sort<FeedsReactionData> {
  const CommentReactionsSort.asc(
    CommentReactionsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const CommentReactionsSort.desc(
    CommentReactionsSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for comment reactions queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<CommentReactionsSort> defaultSort = [
    CommentReactionsSort.desc(CommentReactionsSortField.createdAt),
  ];
}

/// Defines the fields by which comment reactions can be sorted.
///
/// This extension type provides specific fields for sorting comment reaction data.
class CommentReactionsSortField extends SortField<FeedsReactionData> {
  /// Creates a new comment reactions sort field.
  CommentReactionsSortField(super.remote, super.localValue);

  /// Sort by the creation timestamp of the reaction.
  /// This field allows sorting reactions by when they were created (newest/oldest first).
  static final createdAt = CommentReactionsSortField(
    'created_at',
    (data) => data.createdAt,
  );
}

// endregion

/// Extension for converting a [CommentReactionsQuery] to a [api.QueryCommentReactionsRequest].
extension CommentReactionsQueryRequest on CommentReactionsQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryCommentReactionsRequest] suitable for making API calls to retrieve comment reactions.
  api.QueryCommentReactionsRequest toRequest() {
    return api.QueryCommentReactionsRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
