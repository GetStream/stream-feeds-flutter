import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feed_data.dart';
import '../models/query_configuration.dart';
import '../repository/feeds_repository.dart';
import 'event/feed_list_event_handler.dart';
import 'feed_list_state.dart';
import 'query/feeds_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of feeds with a query and state.
///
/// The primary interface for working with feed lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of feeds with pagination support.
///
/// Each feed list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The feed list state includes feeds and
/// pagination information.
class FeedList with Disposable {
  @internal
  FeedList({
    required this.query,
    required this.feedsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = FeedListStateNotifier(
      initialState: const FeedListState(),
    );

    // Attach event handlers for the feed list events
    final handler = FeedListEventHandler(state: _stateNotifier);
    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final FeedsQuery query;
  final FeedsRepository feedsRepository;

  late final FeedListStateNotifier _stateNotifier;

  FeedListState get state => notifier.value;
  StateNotifier<FeedListState> get notifier => _stateNotifier;
  Stream<FeedListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of feeds based on the provided [FeedsQuery].
  ///
  /// Returns a [Result] containing a list of [FeedData] or an error.
  Future<Result<List<FeedData>>> get() => _queryFeeds(query);

  /// Queries more feeds based on the current pagination state.
  ///
  /// If there are no more feeds available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// feeds to return.
  Future<Result<List<FeedData>>> queryMoreFeeds({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more feeds available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryFeeds(nextQuery);
  }

  // Internal method to query feeds and update state.
  Future<Result<List<FeedData>>> _queryFeeds(FeedsQuery query) async {
    final result = await feedsRepository.queryFeeds(query);

    result.onSuccess(
      (feedsData) => _stateNotifier.onQueryMoreFeeds(
        feedsData,
        QueryConfiguration(
          filter: query.filter,
          sort: query.sort ?? FeedsSort.defaultSort,
        ),
      ),
    );

    return result.map((feedsData) => feedsData.items);
  }
}
