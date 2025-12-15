import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/bookmark_data.dart';
import '../models/bookmark_folder_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/bookmarks_query.dart';

part 'bookmark_list_state.freezed.dart';

/// Manages the state of a bookmark list and handles state updates.
///
/// Provides methods to update the bookmark list state in response to data changes
/// and real-time events from the Stream Feeds API.
class BookmarkListStateNotifier extends StateNotifier<BookmarkListState> {
  BookmarkListStateNotifier({
    required BookmarkListState initialState,
  }) : super(initialState);

  QueryConfiguration<BookmarkData>? _queryConfig;
  List<Sort<BookmarkData>> get bookmarkSort {
    return _queryConfig?.sort ?? BookmarksSort.defaultSort;
  }

  /// Handles the result of a query for more bookmarks.
  void onQueryMoreBookmarks(
    PaginationResult<BookmarkData> result,
    QueryConfiguration<BookmarkData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new bookmarks with the existing ones (keeping the sort order)
    final updatedBookmarks = state.bookmarks.merge(
      result.items,
      key: (it) => it.id,
      compare: bookmarkSort.compare,
    );

    state = state.copyWith(
      bookmarks: updatedBookmarks,
      pagination: result.pagination,
    );
  }

  /// Handles the removal of a bookmark folder by ID.
  void onBookmarkFolderRemoved(String folderId) {
    final updatedBookmarks = state.bookmarks.map((bookmark) {
      if (bookmark.folder?.id != folderId) return bookmark;
      // Remove the folder reference from the bookmark
      return bookmark.copyWith(folder: null);
    }).toList();

    state = state.copyWith(bookmarks: updatedBookmarks);
  }

  /// Handles the update of a bookmark folder.
  void onBookmarkFolderUpdated(BookmarkFolderData folder) {
    final updatedBookmarks = state.bookmarks.map((bookmark) {
      if (bookmark.folder?.id != folder.id) return bookmark;
      // Update the folder reference in the bookmark
      return bookmark.copyWith(folder: folder);
    }).toList();

    state = state.copyWith(bookmarks: updatedBookmarks);
  }

  /// Handles the addition of a new bookmark.
  void onBookmarkAdded(BookmarkData bookmark) {
    final updatedBookmarks = state.bookmarks.sortedUpsert(
      bookmark,
      key: (it) => it.id,
      compare: bookmarkSort.compare,
    );

    state = state.copyWith(bookmarks: updatedBookmarks);
  }

  /// Handles the update of an existing bookmark.
  void onBookmarkUpdated(BookmarkData bookmark) {
    final updatedBookmarks = state.bookmarks.sortedUpsert(
      bookmark,
      key: (it) => it.id,
      compare: bookmarkSort.compare,
    );

    state = state.copyWith(bookmarks: updatedBookmarks);
  }

  /// Handles the removal of a bookmark by ID.
  void onBookmarkRemoved(String bookmarkId) {
    final updatedBookmarks = state.bookmarks.where((it) {
      return it.id != bookmarkId;
    }).toList();

    state = state.copyWith(bookmarks: updatedBookmarks);
  }
}

/// An observable state object that manages the current state of a bookmark list.
///
/// Maintains the current list of bookmarks and pagination information for
/// efficient loading and navigation through bookmark collections.
@freezed
class BookmarkListState with _$BookmarkListState {
  const BookmarkListState({
    this.bookmarks = const [],
    this.pagination,
  });

  /// All the paginated bookmarks currently loaded.
  ///
  /// This list contains all bookmarks that have been fetched across multiple
  /// pagination requests. The bookmarks are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<BookmarkData> bookmarks;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of bookmarks.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more bookmarks available to load.
  bool get canLoadMore => pagination?.next != null;
}
