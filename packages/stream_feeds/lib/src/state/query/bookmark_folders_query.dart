import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/bookmark_folder_data.dart';
import '../../utils/filter.dart';
import '../../utils/sort.dart';

part 'bookmark_folders_query.freezed.dart';

/// A query for retrieving bookmark folders with filtering, sorting, and pagination.
///
/// Supports comprehensive bookmark folder discovery with flexible filtering options and efficient pagination.
///
/// ## Example
/// ```dart
/// final query = BookmarkFoldersQuery(
///   filter: Filter.equal(BookmarkFoldersFilterField.userId, "user123"),
///   sort: [BookmarkFoldersSort.desc(BookmarkFoldersSortFielddAt)],
///   limit: 20,
/// );
/// ```
@freezed
class BookmarkFoldersQuery with _$BookmarkFoldersQuery {
  const BookmarkFoldersQuery({
    this.filter,
    this.sort,
    this.limit,
    this.next,
    this.previous,
  });

  /// Optional filter criteria for this query.
  ///
  /// This filter can be a simple single filter or a complex combination of multiple filters
  /// using logical operators (`.and`, `.or`). The filter determines which bookmark folders
  /// are included in the query results based on field values and comparison operators.
  /// Use this to narrow down results based on specific criteria.
  ///
  /// Use [BookmarkFoldersFilterField] for type-safe field references.
  @override
  final Filter? filter;

  /// Array of sorting criteria for this query.
  ///
  /// Specifies how bookmark folders should be ordered in the response.
  /// If not provided, the API will use its default sorting (typically by
  /// creation time, newest first). Multiple sort fields can be specified.
  @override
  final List<BookmarkFoldersSort>? sort;

  /// The maximum number of bookmark folders to return.
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

/// Represents a field that can be used in bookmark folders filtering.
///
/// This extension type provides a type-safe way to specify which field should be used
/// when creating filters for bookmark folders queries.
extension type const BookmarkFoldersFilterField(String field)
    implements String {
  /// Filter by the unique identifier of the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const id = BookmarkFoldersFilterField('id');

  /// Filter by the name of the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.in`, `.q`, `.autocomplete`
  static const name = BookmarkFoldersFilterField('name');

  /// Filter by the user ID who created the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.in`
  static const userId = BookmarkFoldersFilterField('user_id');

  /// Filter by the creation timestamp of the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const createdAt = BookmarkFoldersFilterField('created_at');

  /// Filter by the last update timestamp of the bookmark folder.
  ///
  /// **Supported operators:** `.equal`, `.greaterThan`, `.lessThan`, `.greaterThanOrEqual`, `.lessThanOrEqual`
  static const updatedAt = BookmarkFoldersFilterField('updated_at');
}

// endregion

// region Sort

/// Represents a sorting operation for bookmark folders.
class BookmarkFoldersSort extends Sort<BookmarkFolderData> {
  const BookmarkFoldersSort.asc(
    BookmarkFoldersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsLast,
  }) : super.asc();

  const BookmarkFoldersSort.desc(
    BookmarkFoldersSortField super.field, {
    super.nullOrdering = NullOrdering.nullsFirst,
  }) : super.desc();

  /// The default sorting criteria for bookmark folders queries.
  /// Sorts by creation date in descending order (newest first).
  static final List<BookmarkFoldersSort> defaultSort = [
    BookmarkFoldersSort.desc(BookmarkFoldersSortField.createdAt),
  ];
}

/// Defines the fields by which bookmark folders can be sorted.
///
/// This extension type provides specific fields for sorting bookmark folder data.
extension type const BookmarkFoldersSortField(
        SortField<BookmarkFolderData> field)
    implements SortField<BookmarkFolderData> {
  /// Sort by the creation timestamp of the bookmark folder.
  /// This field allows sorting bookmark folders by when they were created (newest/oldest first).
  static final createdAt = BookmarkFoldersSortField(
    SortField('created_at', (data) => data.createdAt),
  );

  /// Sort by the last update timestamp of the bookmark folder.
  /// This field allows sorting bookmark folders by when they were last updated (newest/oldest first).
  static final updatedAt = BookmarkFoldersSortField(
    SortField('updated_at', (data) => data.updatedAt),
  );

  /// Sort by the name of the bookmark folder.
  /// This field allows sorting bookmark folders alphabetically by name.
  static final name = BookmarkFoldersSortField(
    SortField('name', (data) => data.name),
  );
}

// endregion

/// Extension for converting a [BookmarkFoldersQuery] to a [api.QueryBookmarkFoldersRequest].
extension BookmarkFoldersQueryRequest on BookmarkFoldersQuery {
  /// Converts this query to an API request format.
  ///
  /// Returns a [api.QueryBookmarkFoldersRequest] suitable for making API calls to retrieve bookmark folders.
  api.QueryBookmarkFoldersRequest toRequest() {
    return api.QueryBookmarkFoldersRequest(
      filter: filter?.toRequest(),
      sort: sort?.map((s) => s.toRequest()).toList(),
      limit: limit,
      next: next,
      prev: previous,
    );
  }
}
