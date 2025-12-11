import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/follow_data.dart';
import '../models/query_configuration.dart';
import '../repository/feeds_repository.dart';
import 'event/handler/follow_list_event_handler.dart';
import 'follow_list_state.dart';
import 'query/follows_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of follows with a query and state.
///
/// The primary interface for working with follow lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of follow relationships with pagination support.
///
/// Each follow list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The follow list state includes follows and
/// pagination information.
class FollowList with Disposable {
  @internal
  FollowList({
    required this.query,
    required this.feedsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = FollowListStateNotifier(
      initialState: const FollowListState(),
    );

    // Attach event handlers for real-time updates
    final handler = FollowListEventHandler(
      query: query,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final FollowsQuery query;
  final FeedsRepository feedsRepository;

  late final FollowListStateNotifier _stateNotifier;

  FollowListState get state => _stateNotifier.value;
  StateNotifier<FollowListState> get notifier => _stateNotifier;
  Stream<FollowListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of follows based on the provided query.
  ///
  /// Returns a [Result] containing a list of follows or an error.
  Future<Result<List<FollowData>>> get() => _queryFollows(query);

  /// Loads more follows based on the current pagination state.
  ///
  /// If there are no more follows available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// follows to return.
  Future<Result<List<FollowData>>> queryMoreFollows({int? limit}) async {
    // Build the next query using the current pagination state
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more follows available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryFollows(nextQuery);
  }

  // Internal method to query follows and update state.
  Future<Result<List<FollowData>>> _queryFollows(FollowsQuery query) async {
    final result = await feedsRepository.queryFollows(query.toRequest());

    result.onSuccess(
      (followsData) => _stateNotifier.onQueryMoreFollows(
        followsData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((followsData) => followsData.items);
  }
}
