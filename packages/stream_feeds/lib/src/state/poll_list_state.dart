import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/query_configuration.dart';
import 'query/polls_query.dart';

part 'poll_list_state.freezed.dart';

/// Manages the state of a poll list and handles state updates.
///
/// Provides methods to update the poll list state in response to data changes
/// and real-time events from the Stream Feeds API.
class PollListStateNotifier extends StateNotifier<PollListState> {
  PollListStateNotifier({
    required PollListState initialState,
  }) : super(initialState);

  QueryConfiguration<PollData>? queryConfig;
  List<Sort<PollData>> get pollsSort {
    return queryConfig?.sort ?? PollsSort.defaultSort;
  }

  /// Handles the result of a query for more polls.
  void onQueryMorePolls(
    PaginationResult<PollData> result,
    QueryConfiguration<PollData> queryConfig,
  ) {
    this.queryConfig = queryConfig;

    // Merge the new polls with the existing ones (keeping the sort order)
    final updatedPolls = state.polls.merge(
      result.items,
      key: (it) => it.id,
      compare: pollsSort.compare,
    );

    state = state.copyWith(
      polls: updatedPolls,
      pagination: result.pagination,
    );
  }

  /// Handles the update of a poll.
  void onPollUpdated(PollData poll) {
    final updatedPolls = state.polls.map((it) {
      if (it.id != poll.id) return it;
      return poll;
    }).toList();

    state = state.copyWith(polls: updatedPolls);
  }
}

/// An observable state object that manages the current state of a poll list.
///
/// Maintains the current list of polls and pagination information for
/// efficient loading and navigation through poll collections.
@freezed
class PollListState with _$PollListState {
  const PollListState({
    this.polls = const [],
    this.pagination,
  });

  /// All the paginated polls currently loaded.
  ///
  /// This list contains all polls that have been fetched across multiple
  /// pagination requests. The polls are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<PollData> polls;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of polls.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more polls available to load.
  bool get canLoadMore => pagination?.next != null;
}
