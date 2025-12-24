import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/activity_data.dart';
import '../models/query_configuration.dart';
import '../repository/activities_repository.dart';
import '../repository/capabilities_repository.dart';
import 'activity_list_state.dart';
import 'event/handler/activity_list_event_handler.dart';
import 'event/state_update_event.dart';
import 'query/activities_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of activities with a query and state.
///
/// The primary interface for working with activity lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of activities with pagination support.
///
/// Each activity list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The activity list state includes activities and
/// pagination information.
class ActivityList with Disposable {
  @internal
  ActivityList({
    required this.query,
    required this.currentUserId,
    required this.activitiesRepository,
    required this.capabilitiesRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = ActivityListStateNotifier(
      initialState: const ActivityListState(),
      currentUserId: currentUserId,
    );

    // Attach event handlers for real-time updates
    final handler = ActivityListEventHandler(
      query: query,
      state: _stateNotifier,
      currentUserId: currentUserId,
      capabilitiesRepository: capabilitiesRepository,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final ActivitiesQuery query;
  final String currentUserId;
  final ActivitiesRepository activitiesRepository;
  final CapabilitiesRepository capabilitiesRepository;

  late final ActivityListStateNotifier _stateNotifier;

  ActivityListState get state => notifier.value;
  StateNotifier<ActivityListState> get notifier => _stateNotifier;
  Stream<ActivityListState> get stream => _stateNotifier.stream;

  final SharedEmitter<StateUpdateEvent> eventsEmitter;
  StreamSubscription<StateUpdateEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of activities based on the provided query.
  ///
  /// Returns a [Result] containing a list of activities or an error.
  Future<Result<List<ActivityData>>> get() => _queryActivities(query);

  /// Loads more activities based on the current pagination state.
  ///
  /// If there are no more activities available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// activities to return.
  Future<Result<List<ActivityData>>> queryMoreActivities({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more activities available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryActivities(nextQuery);
  }

  // Internal method to query activities and update state.
  Future<Result<List<ActivityData>>> _queryActivities(
    ActivitiesQuery query,
  ) async {
    final result = await activitiesRepository.queryActivities(query);

    result.onSuccess(
      (activitiesData) {
        _stateNotifier.onQueryMoreActivities(
          activitiesData,
          QueryConfiguration(filter: query.filter, sort: query.sort),
        );

        capabilitiesRepository.cacheCapabilitiesForFeeds(
          activitiesData.items
              .map((activity) => activity.currentFeed)
              .nonNulls
              .toList(),
        );
      },
    );

    return result.map((activitiesData) => activitiesData.items);
  }
}
