import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/activity_reactions_query.dart';

part 'activity_reaction_list_state.freezed.dart';

/// Manages the state of an activity reaction list and handles state updates.
///
/// Provides methods to update the activity reaction list state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityReactionListStateNotifier
    extends StateNotifier<ActivityReactionListState> {
  ActivityReactionListStateNotifier({
    required ActivityReactionListState initialState,
  }) : super(initialState);

  QueryConfiguration<FeedsReactionData>? _queryConfig;
  List<Sort<FeedsReactionData>> get reactionsSort {
    return _queryConfig?.sort ?? ActivityReactionsSort.defaultSort;
  }

  /// Handles the result of a query for more activity reactions.
  void onQueryMoreActivityReactions(
    PaginationResult<FeedsReactionData> result,
    QueryConfiguration<FeedsReactionData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new reactions with the existing ones (keeping the sort order)
    final updatedReactions = state.reactions.merge(
      result.items,
      key: (it) => it.id,
      compare: reactionsSort.compare,
    );

    state = state.copyWith(
      reactions: updatedReactions,
      pagination: result.pagination,
    );
  }

  /// Handles the removal of a reaction by reaction data.
  void onReactionRemoved(FeedsReactionData reaction) {
    final updatedReactions = state.reactions.where((it) {
      return it.id != reaction.id;
    }).toList();

    state = state.copyWith(reactions: updatedReactions);
  }
}

/// An observable state object that manages the current state of an activity reaction list.
///
/// Maintains the current list of reactions and pagination information for
/// efficient loading and navigation through activity reaction collections.
@freezed
class ActivityReactionListState with _$ActivityReactionListState {
  const ActivityReactionListState({
    required this.query,
    this.reactions = const [],
    this.pagination,
  });

  /// The query configuration used to fetch activity reactions.
  @override
  final ActivityReactionsQuery query;

  /// All the paginated activity reactions currently loaded.
  ///
  /// This list contains all reactions that have been fetched across multiple
  /// pagination requests. The reactions are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<FeedsReactionData> reactions;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of activity reactions.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more reactions available to load.
  bool get canLoadMore => pagination?.next != null;
}
