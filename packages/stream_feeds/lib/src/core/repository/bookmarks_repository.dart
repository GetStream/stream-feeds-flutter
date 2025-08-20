import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
import '../models/bookmark_data.dart';
import '../models/bookmark_folder_data.dart';
import '../models/pagination_data.dart';
import '../state/query/bookmark_folders_query.dart';
import '../state/query/bookmarks_query.dart';

/// Repository for managing bookmarks and bookmark folders.
///
/// Provides methods for creating, querying, updating, and deleting bookmarks
/// and bookmark folders. Users can save activities for later reference and
/// organize them into folders. All methods return [Result] objects for
/// explicit error handling.
class BookmarksRepository {
  /// Creates a new [BookmarksRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const BookmarksRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Queries bookmarks based on the provided [BookmarksQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [BookmarkData] or an error.
  Future<Result<PaginationResult<BookmarkData>>> queryBookmarks(
    BookmarksQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryBookmarks(
        queryBookmarksRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryBookmarks');
      }

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

  /// Adds a bookmark for a specific activity based on the provided [AddBookmarkRequest].
  ///
  /// Returns a [Result] containing the created [BookmarkData] or an error.
  Future<Result<BookmarkData>> addBookmark(
    String activityId,
    api.AddBookmarkRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.addBookmark(
        activityId: activityId,
        addBookmarkRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from addBookmark');
      }

      return response.bookmark.toModel();
    });
  }

  /// Deletes a bookmark for the specified activity.
  ///
  /// Returns a [Result] containing the deleted [BookmarkData] or an error.
  Future<Result<BookmarkData>> deleteBookmark({
    required String activityId,
    String? folderId,
  }) {
    return runSafely(() async {
      final response = await _apiClient.deleteBookmark(
        activityId: activityId,
        folderId: folderId,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from deleteBookmark');
      }

      return response.bookmark.toModel();
    });
  }

  /// Updates an existing bookmark based on the provided [UpdateBookmarkRequest].
  ///
  /// Returns a [Result] containing the updated [BookmarkData] or an error.
  Future<Result<BookmarkData>> updateBookmark(
    String activityId,
    api.UpdateBookmarkRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updateBookmark(
        activityId: activityId,
        updateBookmarkRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updateBookmark');
      }

      return response.bookmark.toModel();
    });
  }

  /// Queries bookmark folders based on the provided [BookmarkFoldersQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [BookmarkFolderData] or an error.
  Future<Result<PaginationResult<BookmarkFolderData>>> queryBookmarkFolders(
    BookmarkFoldersQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryBookmarkFolders(
        queryBookmarkFoldersRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from queryBookmarkFolders',
        );
      }

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
