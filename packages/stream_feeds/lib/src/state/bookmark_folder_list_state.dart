import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/bookmark_folder_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/bookmark_folders_query.dart';

part 'bookmark_folder_list_state.freezed.dart';

/// Manages the state of a bookmark folder list and handles state updates.
///
/// Provides methods to update the bookmark folder list state in response to data changes
/// and real-time events from the Stream Feeds API.
class BookmarkFolderListStateNotifier
    extends StateNotifier<BookmarkFolderListState> {
  BookmarkFolderListStateNotifier({
    required BookmarkFolderListState initialState,
  }) : super(initialState);

  QueryConfiguration<BookmarkFoldersSort>? _queryConfig;
  List<BookmarkFoldersSort> get foldersSort {
    return _queryConfig?.sort ?? BookmarkFoldersSort.defaultSort;
  }

  /// Handles the result of a query for more bookmark folders.
  void onQueryMoreBookmarkFolders(
    PaginationResult<BookmarkFolderData> result,
    QueryConfiguration<BookmarkFoldersSort> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new folders with the existing ones (keeping the sort order)
    final updatedFolders = state.bookmarkFolders.merge(
      result.items,
      key: (it) => it.id,
      compare: foldersSort.compare,
    );

    state = state.copyWith(
      bookmarkFolders: updatedFolders,
      pagination: result.pagination,
    );
  }

  /// Handles updates to a specific bookmark folder.
  void onBookmarkFolderUpdated(BookmarkFolderData folder) {
    final updatedFolders = state.bookmarkFolders.map((it) {
      if (it.id != folder.id) return it;
      return folder;
    }).toList();

    state = state.copyWith(bookmarkFolders: updatedFolders);
  }

  /// Handles the removal of a bookmark folder by ID.
  void onBookmarkFolderRemoved(String folderId) {
    final updatedFolders = state.bookmarkFolders.where((it) {
      return it.id != folderId;
    }).toList();

    state = state.copyWith(bookmarkFolders: updatedFolders);
  }
}

/// An observable state object that manages the current state of a bookmark folder list.
///
/// Maintains the current list of folders and pagination information for
/// efficient loading and navigation through bookmark folder collections.
@freezed
class BookmarkFolderListState with _$BookmarkFolderListState {
  const BookmarkFolderListState({
    required this.query,
    this.bookmarkFolders = const [],
    this.pagination,
  });

  /// The query configuration used to fetch bookmark folders.
  @override
  final BookmarkFoldersQuery query;

  /// All the paginated bookmark folders currently loaded.
  ///
  /// This list contains all folders that have been fetched across multiple
  /// pagination requests. The folders are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<BookmarkFolderData> bookmarkFolders;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of bookmark folders.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more folders available to load.
  bool get canLoadMore => pagination?.next != null;
}
