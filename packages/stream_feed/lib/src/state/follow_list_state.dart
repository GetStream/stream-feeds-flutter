import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/follow_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/follows_query.dart';

part 'follow_list_state.freezed.dart';

/// Manages the state of a follow list and handles state updates.
///
/// Provides methods to update the follow list state in response to data changes
/// and real-time events from the Stream Feeds API.
class FollowListStateNotifier extends StateNotifier<FollowListState> {
  FollowListStateNotifier({
    required FollowListState initialState,
  }) : super(initialState);

  QueryConfiguration<FollowsSort, FollowsFilterField>? queryConfig;
  List<FollowsSort> get followsSort {
    return queryConfig?.sort ?? FollowsSort.defaultSort;
  }

  /// Handles the result of a query for more follows.
  void onQueryMoreFollows(
    PaginationResult<FollowData> result,
    QueryConfiguration<FollowsSort, FollowsFilterField> queryConfig,
  ) {
    this.queryConfig = queryConfig;

    // Merge the new follows with the existing ones (keeping the sort order)
    final updatedFollows = state.follows.merge(
      result.items,
      key: (it) => it.id,
      compare: followsSort.compare,
    );

    state = state.copyWith(
      follows: updatedFollows,
      pagination: result.pagination,
    );
  }

  /// Handles the update of a follow data.
  void onFollowUpdated(FollowData follow) {
    final updatedFollows = state.follows.map((it) {
      if (it.id != follow.id) return it;
      return follow;
    }).toList();

    state = state.copyWith(follows: updatedFollows);
  }
}

/// An observable state object that manages the current state of a follow list.
///
/// Maintains the current list of follows and pagination information for
/// efficient loading and navigation through follow collections.
@freezed
class FollowListState with _$FollowListState {
  const FollowListState({
    this.follows = const [],
    this.pagination,
  });

  /// All the paginated follows currently loaded.
  ///
  /// This list contains all follows that have been fetched across multiple
  /// pagination requests. The follows are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<FollowData> follows;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of follows.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more follows available to load.
  bool get canLoadMore => pagination?.next != null;
}
