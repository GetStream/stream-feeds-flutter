import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/bookmark_data.dart';
import '../models/bookmark_folder_data.dart';
import '../models/pagination_data.dart';
import '../state/query/bookmark_folders_query.dart';
import '../state/query/bookmarks_query.dart';

/// Repository for managing bookmarks and bookmark folders.
///
/// Provides methods for creating, querying, updating, and deleting bookmarks
/// and bookmark folders. Users can save activities for later reference and
/// organize them into folders.
///
/// All methods return [Result] objects for explicit error handling.
class BookmarksRepository {
  /// Creates a new [BookmarksRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const BookmarksRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Queries bookmarks.
  ///
  /// Searches for bookmarks using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [BookmarkData] or an error.
  Future<Result<PaginationResult<BookmarkData>>> queryBookmarks(
    BookmarksQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryBookmarks(
      queryBookmarksRequest: request,
    );

    return result.map((response) {
      final bookmarks = response.bookmarks.map((b) => b.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(
        items: bookmarks,
        pagination: pagination,
      );
    });
  }

  /// Adds a bookmark for a specific activity.
  ///
  /// Creates a new bookmark for the activity with [activityId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the created [BookmarkData] or an error.
  Future<Result<BookmarkData>> addBookmark(
    String activityId,
    api.AddBookmarkRequest request,
  ) async {
    final result = await _api.addBookmark(
      activityId: activityId,
      addBookmarkRequest: request,
    );

    return result.map((response) => response.bookmark.toModel());
  }

  /// Deletes a bookmark for the specified activity.
  ///
  /// Removes the bookmark for the activity with [activityId]. When [folderId]
  /// is provided, deletes the bookmark from that specific folder.
  ///
  /// Returns a [Result] containing the deleted [BookmarkData] or an error.
  Future<Result<BookmarkData>> deleteBookmark({
    required String activityId,
    String? folderId,
  }) async {
    final result = await _api.deleteBookmark(
      activityId: activityId,
      folderId: folderId,
    );

    return result.map((response) => response.bookmark.toModel());
  }

  /// Updates an existing bookmark.
  ///
  /// Modifies the bookmark for the activity with [activityId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the updated [BookmarkData] or an error.
  Future<Result<BookmarkData>> updateBookmark(
    String activityId,
    api.UpdateBookmarkRequest request,
  ) async {
    final result = await _api.updateBookmark(
      activityId: activityId,
      updateBookmarkRequest: request,
    );

    return result.map((response) => response.bookmark.toModel());
  }

  /// Queries bookmark folders.
  ///
  /// Searches for bookmark folders using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [BookmarkFolderData] or an error.
  Future<Result<PaginationResult<BookmarkFolderData>>> queryBookmarkFolders(
    BookmarkFoldersQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryBookmarkFolders(
      queryBookmarkFoldersRequest: request,
    );

    return result.map((response) {
      final folders = response.bookmarkFolders.map((f) => f.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(
        items: folders,
        pagination: pagination,
      );
    });
  }
}
