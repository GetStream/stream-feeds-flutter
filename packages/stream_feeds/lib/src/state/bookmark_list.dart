import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/bookmark_data.dart';
import '../models/query_configuration.dart';
import '../repository/bookmarks_repository.dart';
import 'bookmark_list_state.dart';
import 'event/bookmark_list_event_handler.dart';
import 'query/bookmarks_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of bookmarks with a query and state.
///
/// The primary interface for working with bookmark lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of bookmarks with pagination support.
///
/// Each bookmark list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The bookmark list state includes bookmarks and
/// pagination information.
class BookmarkList with Disposable {
  @internal
  BookmarkList({
    required this.query,
    required this.bookmarksRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = BookmarkListStateNotifier(
      initialState: const BookmarkListState(),
    );

    // Attach event handlers for real-time updates
    final handler = BookmarkListEventHandler(
      query: query,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final BookmarksQuery query;
  final BookmarksRepository bookmarksRepository;

  late final BookmarkListStateNotifier _stateNotifier;

  BookmarkListState get state => _stateNotifier.value;
  StateNotifier<BookmarkListState> get notifier => _stateNotifier;
  Stream<BookmarkListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of bookmarks based on the provided query.
  ///
  /// Returns a [Result] containing a list of bookmarks or an error.
  Future<Result<List<BookmarkData>>> get() => _queryBookmarks(query);

  /// Loads more bookmarks based on the current pagination state.
  ///
  /// If there are no more bookmarks available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// bookmarks to return.
  Future<Result<List<BookmarkData>>> queryMoreBookmarks({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more bookmarks available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryBookmarks(nextQuery);
  }

  // Internal method to query bookmarks and update state.
  Future<Result<List<BookmarkData>>> _queryBookmarks(
    BookmarksQuery query,
  ) async {
    final result = await bookmarksRepository.queryBookmarks(query);

    result.onSuccess(
      (bookmarksData) => _stateNotifier.onQueryMoreBookmarks(
        bookmarksData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((bookmarksData) => bookmarksData.items);
  }
}
