import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/bookmark_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'bookmarks_query.freezed.dart';

/// A query for retrieving bookmarks with filtering, sorting, and pagination.
///
/// Supports comprehensive bookmark discovery with flexible filtering options and efficient pagination.
///
/// ## Example
/// ```dart
/// final query = BookmarksQuery(
///   filter: Filter.equal(BookmarksFilterField.userId, "user123"),
///   sort: [BookmarksSort.desc(BookmarksSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class BookmarksQuery with _$BookmarksQuery {
  const BookmarksQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// The filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which bookmarks are
  /// included in the query results based on field values and comparison operators.
  ///
  /// Use [BookmarksFilterField] for type-safe field references.
  @override
  final Filter<BookmarksFilterField>? filter;

  /// The sorting criteria for this query.
  ///
  /// Specifies how bookmarks should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<BookmarksSort>? sort;

  /// The maximum number of bookmarks to return.
  @override
  final int? limit;

  /// The next page cursor for pagination.
  ///
  /// This cursor is typically provided in the response of a previous request
  /// and should be used to fetch subsequent pages of bookmarks.
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

/// Represents a field that can be used in bookmarks filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for bookmarks queries.
extension type const BookmarksFilterField(String _) implements FilterField {
  /// Filter by the unique identifier of the activity that was bookmarked.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const activityId = BookmarksFilterField('activity_id');

  /// Filter by the unique identifier of the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.exists`
  static const folderId = BookmarksFilterField('folder_id');

  /// Filter by the user ID who created the bookmark.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = BookmarksFilterField('user_id');

  /// Filter by the creation timestamp of the bookmark.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = BookmarksFilterField('created_at');

  /// Filter by the last update timestamp of the bookmark.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = BookmarksFilterField('updated_at');
}

// endregion

// region Sort

/// Represents a sorting operation for bookmarks.
class BookmarksSort extends Sort<BookmarkData> {
  const BookmarksSort.asc(
    BookmarksSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const BookmarksSort.desc(
    BookmarksSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for bookmarks queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<BookmarksSort> defaultSort = [
    BookmarksSort.desc(BookmarksSortField.createdAt),
  ];
}

/// Defines the fields by which bookmarks can be sorted.
///
/// This extension type provides specific fields for sorting bookmark data.
extension type const BookmarksSortField(SortField<BookmarkData> _)
    implements SortField<BookmarkData> {
  /// Sort by the creation timestamp of the bookmark.
  /// This field allows sorting bookmarks by when they were created (newest/oldest first).
  static final createdAt = BookmarksSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the last update timestamp of the bookmark.
  /// This field allows sorting bookmarks by when they were last updated (newest/oldest first).
  static final updatedAt = BookmarksSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );
}

// endregion

/// Extension for converting a [BookmarksQuery] to a [api.QueryBookmarksRequest].
extension BookmarksQueryRequest on BookmarksQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryBookmarksRequest] suitable for making API calls to retrieve bookmarks.
  api.QueryBookmarksRequest toRequest() {
    return api.QueryBookmarksRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
