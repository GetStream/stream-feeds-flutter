import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/poll_data.dart';
import '../models/query_configuration.dart';
import '../repository/polls_repository.dart';
import 'event/poll_list_event_handler.dart';
import 'poll_list_state.dart';
import 'query/polls_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of polls with a query and state.
///
/// The primary interface for working with poll lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of polls with pagination support.
///
/// Each poll list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The poll list state includes polls and
/// pagination information.
class PollList with Disposable {
  @internal
  PollList({
    required this.query,
    required this.pollsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = PollListStateNotifier(
      initialState: const PollListState(),
    );

    // Attach event handlers for real-time updates
    final handler = PollListEventHandler(
      query: query,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final PollsQuery query;
  final PollsRepository pollsRepository;

  late final PollListStateNotifier _stateNotifier;

  PollListState get state => _stateNotifier.value;
  StateNotifier<PollListState> get notifier => _stateNotifier;
  Stream<PollListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of polls based on the provided query.
  ///
  /// Returns a [Result] containing a list of polls or an error.
  Future<Result<List<PollData>>> get() => _queryPolls(query);

  /// Loads more polls based on the current pagination state.
  ///
  /// If there are no more polls available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// polls to return.
  Future<Result<List<PollData>>> queryMorePolls({int? limit}) async {
    // Build the next query using the current pagination state
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more polls available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryPolls(nextQuery);
  }

  // Internal method to query polls and update state.
  Future<Result<List<PollData>>> _queryPolls(PollsQuery query) async {
    final result = await pollsRepository.queryPolls(query);

    result.onSuccess(
      (pollsData) => _stateNotifier.onQueryMorePolls(
        pollsData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((pollsData) => pollsData.items);
  }
}
