import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/bookmark_folder_data.dart';
import '../models/query_configuration.dart';
import '../repository/bookmarks_repository.dart';
import 'bookmark_folder_list_state.dart';
import 'event/bookmark_folder_list_event_handler.dart';
import 'query/bookmark_folders_query.dart';

/// Represents a list of bookmark folders with a query and state.
///
/// The primary interface for working with bookmark folder lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of bookmark folders with pagination support.
///
/// Each bookmark folder list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The bookmark folder list state includes folders and
/// pagination information.
class BookmarkFolderList extends Disposable {
  @internal
  BookmarkFolderList({
    required this.query,
    required this.bookmarksRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = BookmarkFolderListStateNotifier(
      initialState: BookmarkFolderListState(query: query),
    );

    // Attach event handlers for real-time updates
    final handler = BookmarkFolderListEventHandler(state: _stateNotifier);

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final BookmarkFoldersQuery query;
  final BookmarksRepository bookmarksRepository;

  StateNotifier<BookmarkFolderListState> get state => notifier;
  Stream<BookmarkFolderListState> get stream => notifier.stream;

  @internal
  BookmarkFolderListStateNotifier get notifier => _stateNotifier;
  late final BookmarkFolderListStateNotifier _stateNotifier;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  /// Queries the initial list of bookmark folders based on the provided [BookmarkFoldersQuery].
  ///
  /// Returns a [Result] containing a list of [BookmarkFolderData] or an error.
  Future<Result<List<BookmarkFolderData>>> get() => _queryBookmarkFolders(query);

  /// Loads more bookmark folders based on the current pagination state.
  ///
  /// If there are no more folders available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// folders to return.
  Future<Result<List<BookmarkFolderData>>> queryMoreBookmarkFolders({
    int? limit,
  }) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.state.pagination?.next;

    // Early return if no more folders available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryBookmarkFolders(nextQuery);
  }

  // Internal method to query folders and update state.
  Future<Result<List<BookmarkFolderData>>> _queryBookmarkFolders(
    BookmarkFoldersQuery query,
  ) async {
    final result = await bookmarksRepository.queryBookmarkFolders(query);

    result.onSuccess(
      (foldersData) => _stateNotifier.onQueryMoreBookmarkFolders(
        foldersData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((foldersData) => foldersData.items);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }
}
