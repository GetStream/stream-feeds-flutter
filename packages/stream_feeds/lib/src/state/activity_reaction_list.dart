import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feeds_reaction_data.dart';
import '../models/query_configuration.dart';
import '../repository/activities_repository.dart';
import 'activity_reaction_list_state.dart';
import 'event/activity_reaction_list_event_handler.dart';
import 'query/activity_reactions_query.dart';

/// Represents a list of activity reactions with a query and state.
///
/// The primary interface for working with activity reaction lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of activity reactions with pagination support.
///
/// Each activity reaction list instance is associated with a specific activity and maintains its own state
/// that can be observed for real-time updates. The activity reaction list state includes reactions and
/// pagination information.
class ActivityReactionList extends Disposable {
  @internal
  ActivityReactionList({
    required this.query,
    required this.activitiesRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = ActivityReactionListStateNotifier(
      initialState: ActivityReactionListState(query: query),
    );

    // Attach event handlers for real-time updates
    final handler = ActivityReactionListEventHandler(
      activityId: query.activityId,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final ActivityReactionsQuery query;
  final ActivitiesRepository activitiesRepository;

  StateNotifier<ActivityReactionListState> get state => notifier;
  Stream<ActivityReactionListState> get stream => notifier.stream;

  @internal
  ActivityReactionListStateNotifier get notifier => _stateNotifier;
  late final ActivityReactionListStateNotifier _stateNotifier;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  /// Queries the initial list of activity reactions based on the provided [ActivityReactionsQuery].
  ///
  /// Returns a [Result] containing a list of [FeedsReactionData] or an error.
  Future<Result<List<FeedsReactionData>>> get() =>
      _queryActivityReactions(query);

  /// Loads more activity reactions based on the current pagination state.
  ///
  /// If there are no more reactions available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// reactions to return.
  Future<Result<List<FeedsReactionData>>> queryMoreReactions({
    int? limit,
  }) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.state.pagination?.next;

    // Early return if no more reactions available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryActivityReactions(nextQuery);
  }

  // Internal method to query reactions and update state.
  Future<Result<List<FeedsReactionData>>> _queryActivityReactions(
    ActivityReactionsQuery query,
  ) async {
    final result = await activitiesRepository.queryActivityReactions(
      query.activityId,
      query.toRequest(),
    );

    result.onSuccess(
      (reactionsData) => _stateNotifier.onQueryMoreActivityReactions(
        reactionsData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((reactionsData) => reactionsData.items);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }
}
