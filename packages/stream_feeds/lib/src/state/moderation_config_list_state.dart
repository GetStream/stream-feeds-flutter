import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/moderation_config_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/moderation_configs_query.dart';

part 'moderation_config_list_state.freezed.dart';

/// Manages the state of a moderation config list and handles state updates.
///
/// Provides methods to update the moderation config list state in response to data changes
/// and real-time events from the Stream Feeds API.
class ModerationConfigListStateNotifier
    extends StateNotifier<ModerationConfigListState> {
  ModerationConfigListStateNotifier({
    required ModerationConfigListState initialState,
  }) : super(initialState);

  QueryConfiguration<ModerationConfigsSort>? _queryConfig;
  List<ModerationConfigsSort> get configsSort {
    return _queryConfig?.sort ?? ModerationConfigsSort.defaultSort;
  }

  /// Handles the result of a query for more moderation configs.
  void onQueryMoreConfigs(
    PaginationResult<ModerationConfigData> result,
    QueryConfiguration<ModerationConfigsSort> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new configs with the existing ones (keeping the sort order)
    final updatedConfigs = state.configs.merge(
      result.items,
      key: (it) => it.id,
      compare: configsSort.compare,
    );

    state = state.copyWith(
      configs: updatedConfigs,
      pagination: result.pagination,
    );
  }
}

/// An observable state object that manages the current state of a moderation config list.
///
/// Maintains the current list of moderation configurations and pagination information for
/// efficient loading and navigation through moderation config collections.
@freezed
class ModerationConfigListState with _$ModerationConfigListState {
  const ModerationConfigListState({
    this.configs = const [],
    this.pagination,
  });

  /// All the paginated moderation configurations currently loaded.
  ///
  /// This list contains all configurations that have been fetched across multiple
  /// pagination requests. The configurations are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<ModerationConfigData> configs;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of moderation configurations.
  @override
  final PaginationData? pagination;

  /// Indicates whether more moderation configurations can be loaded.
  bool get canLoadMore => pagination?.next != null;
}
