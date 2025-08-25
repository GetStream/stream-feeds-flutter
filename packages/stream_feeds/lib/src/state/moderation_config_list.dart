import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/moderation_config_data.dart';
import '../models/query_configuration.dart';
import '../repository/moderation_repository.dart';
import 'moderation_config_list_state.dart';
import 'query/moderation_configs_query.dart';

/// Represents a list of moderation configurations with a query and state.
///
/// The primary interface for working with moderation configuration lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of moderation configurations with pagination support.
///
/// Each moderation config list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The moderation config list state includes configurations and
/// pagination information.
class ModerationConfigList extends Disposable {
  ModerationConfigList({
    required this.query,
    required this.moderationRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = ModerationConfigListStateNotifier(
      initialState: const ModerationConfigListState(),
    );
  }

  final ModerationConfigsQuery query;
  final ModerationRepository moderationRepository;

  StateNotifier<ModerationConfigListState> get state => notifier;
  Stream<ModerationConfigListState> get stream => notifier.stream;

  @internal
  ModerationConfigListStateNotifier get notifier => _stateNotifier;
  late final ModerationConfigListStateNotifier _stateNotifier;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  /// Queries the initial list of moderation configurations based on the provided [ModerationConfigsQuery].
  ///
  /// Returns a [Result] containing a list of [ModerationConfigData] or an error.
  Future<Result<List<ModerationConfigData>>> get() => _queryConfigs(query);

  /// Queries more moderation configurations based on the current pagination state.
  ///
  /// If there are no more configurations available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// configurations to return.
  Future<Result<List<ModerationConfigData>>> queryMoreConfigs({
    int? limit,
  }) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.state.pagination?.next;

    // Early return if no more configs available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      next: next,
      limit: limit ?? query.limit,
    );

    return _queryConfigs(nextQuery);
  }

  // Internal method to query moderation configs and update state.
  Future<Result<List<ModerationConfigData>>> _queryConfigs(
    ModerationConfigsQuery query,
  ) async {
    final result = await moderationRepository.queryModerationConfigs(query);

    result.onSuccess(
      (configsData) {
        _stateNotifier.onQueryMoreConfigs(
          configsData,
          QueryConfiguration(
            filter: query.filter,
            sort: query.sort ?? ModerationConfigsSort.defaultSort,
          ),
        );
      },
    );

    return result.map((configsData) => configsData.items);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }
}
