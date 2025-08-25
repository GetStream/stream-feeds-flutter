import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../utils/filter.dart';

part 'comments_query.freezed.dart';

/// A query for retrieving comments with filtering, sorting, and pagination.
///
/// Supports intelligent ranking and filtering by content, users, and threads.
/// Includes Reddit-style sorting algorithms (top, best, controversial, hot),
/// thread management with depth control, and engagement metrics tracking.
///
/// ## Example
/// ```dart
/// final query = CommentsQuery(
///   filter: Filter.equal(CommentsFilterField.objectId, "activity123"),
///   sort: api.QueryCommentsRequestSortEnum.best,
///   limit: 20,
/// );
/// ```
@freezed
class CommentsQuery with _$CommentsQuery {
  const CommentsQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// Filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which comments are
  /// included in the query results based on field values and comparison operators.
  ///
  /// Use [CommentsFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// The sorting strategy for this query.
  ///
  /// Available options:
  /// - `.first` - Chronological order (oldest first)
  /// - `.last` - Reverse chronological order (newest first)
  /// - `.top` - By popularity (most upvotes first)
  /// - `.best` - By quality score (best quality first)
  /// - `.controversial` - By controversy level (most controversial first)
  @override
  final CommentsSort? sort;

  /// The maximum number of comments to return.
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

/// Represents a field that can be used in comments filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for comments queries.
extension type const CommentsFilterField(String field) implements String {
  /// Filter by the unique identifier of the comment.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const id = CommentsFilterField('id');

  /// Filter by the user ID who created the comment.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = CommentsFilterField('user_id');

  /// Filter by the type of object the comment belongs to (e.g., "activity", "post").
  ///
  /// **Supported operators:** `.equal`, `.notEqual`, `.in`
  static const objectType = CommentsFilterField('object_type');

  /// Filter by the ID of the object the comment belongs to.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const objectId = CommentsFilterField('object_id');

  /// Filter by the ID of the parent comment (for replies).
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const parentId = CommentsFilterField('parent_id');

  /// Filter by the text content of the comment.
  ///
  /// **Supported operators:** `.q` (full-text search)
  static const commentText = CommentsFilterField('comment_text');

  /// Filter by the status of the comment (e.g., "active", "deleted", "moderated").
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const status = CommentsFilterField('status');

  /// Filter by the number of upvotes the comment has received.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const upvoteCount = CommentsFilterField('upvote_count');

  /// Filter by the number of downvotes the comment has received.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const downvoteCount = CommentsFilterField('downvote_count');

  /// Filter by the number of replies the comment has received.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const replyCount = CommentsFilterField('reply_count');

  /// Filter by the score of the comment.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const score = CommentsFilterField('score');

  /// Filter by the confidence score of the comment.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const confidenceScore = CommentsFilterField('confidence_score');

  /// Filter by the controversy score of the comment.
  ///
  /// **Supported operators:** `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const controversyScore = CommentsFilterField('controversy_score');

  /// Filter by the creation timestamp of the comment.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = CommentsFilterField('created_at');
}

// endregion

// region Sort

/// Interface for comment data that can be sorted.
///
/// This defines the fields required for local sorting operations.
abstract interface class CommentsSortDataFields {
  DateTime get createdAt;
  double get confidenceScore;
  double? get controversyScore;
  int get score;
}

extension type const CommentsSortField(SortField<CommentsSortDataFields> field)
    implements SortField<CommentsSortDataFields> {
  /// Sort by the score of the comment.
  static final score = CommentsSortField(
    SortField('score', (data) => data.score),
  );

  /// Sort by the confidence score of the comment.
  static final confidenceScore = CommentsSortField(
    SortField('confidence_score', (data) => data.confidenceScore),
  );

  /// Sort by the controversy score of the comment.
  static final controversyScore = CommentsSortField(
    SortField('controversy_score', (data) => data.controversyScore),
  );

  /// Sort by the creation timestamp of the comment.
  static final createdAt = CommentsSortField(
    SortField('created_at', (data) => data.createdAt),
  );
}

/// Represents sorting options for comments queries.
extension type const CommentsSort(String sort) implements String {
  /// Sort by the quality score of the comment (best quality first).
  static const best = CommentsSort('best');

  /// Sort by the controversy level of the comment (most controversial first).
  static const controversial = CommentsSort('controversial');

  /// Sort by the chronological order of comments (oldest first).
  static const first = CommentsSort('first');

  /// Sort by the reverse chronological order of comments (newest first).
  static const last = CommentsSort('last');

  /// Sort by the popularity of the comment (most upvotes first).
  static const top = CommentsSort('top');
}

/// Extension for converting [CommentsSort] to a [api.QueryCommentsRequestSort].
extension CommentsSortExtension on CommentsSort {
  /// Converts the [CommentsSort] to the corresponding [api.QueryCommentsRequestSort].
  api.QueryCommentsRequestSort toRequest() {
    return switch (this) {
      CommentsSort.best => api.QueryCommentsRequestSort.best,
      CommentsSort.controversial => api.QueryCommentsRequestSort.controversial,
      CommentsSort.first => api.QueryCommentsRequestSort.first,
      CommentsSort.last => api.QueryCommentsRequestSort.last,
      CommentsSort.top => api.QueryCommentsRequestSort.top,
      _ => api.QueryCommentsRequestSort.unknown,
    };
  }

  /// Compares two [CommentsSortDataFields] instances based on the current sort criteria.
  ///
  /// Returns:
  /// - A negative integer if `a` should come before `b`
  /// - A positive integer if `a` should come after `b`
  /// - Zero if they are considered equal
  int compare(CommentsSortDataFields? a, CommentsSortDataFields? b) {
    final sortComparator = switch (this) {
      // Desc by score, then by creation date (newest first)
      CommentsSort.top => [
          Sort.desc(CommentsSortField.score),
          Sort.desc(CommentsSortField.createdAt),
        ],
      // Desc by confidence score, then by creation date (newest first)
      CommentsSort.best => [
          Sort.desc(CommentsSortField.confidenceScore),
          Sort.desc(CommentsSortField.createdAt),
        ],
      // Desc by controversy score, then by creation date (newest first)
      CommentsSort.controversial => [
          Sort.desc(
            CommentsSortField.controversyScore,
            nullOrdering: NullOrdering.nullsLast,
          ),
        ],
      // Asc by creation date (oldest first)
      CommentsSort.first => [Sort.asc(CommentsSortField.createdAt)],
      // Desc by creation date (newest first)
      CommentsSort.last || _ => [Sort.desc(CommentsSortField.createdAt)],
    };

    return sortComparator.compare(a, b);
  }
}

// endregion

/// Extension for converting a [CommentsQuery] to a [api.QueryCommentsRequest].
extension CommentsQueryRequest on CommentsQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryCommentsRequest] suitable for making API calls to retrieve comments.
  api.QueryCommentsRequest toRequest() {
    return api.QueryCommentsRequest(
      filter: filter?.toRequest() ?? {},
      sort: sort?.toRequest(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
