import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import 'query/polls_query.dart';

part 'poll_list_state.freezed.dart';

/// Manages the state of a poll list and handles state updates.
///
/// Provides methods to update the poll list state in response to data changes
/// and real-time events from the Stream Feeds API.
class PollListStateNotifier extends StateNotifier<PollListState> {
  PollListStateNotifier({
    required this.currentUserId,
    required PollListState initialState,
  }) : super(initialState);

  final String currentUserId;

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

  /// Handles the closure of a poll by ID.
  void onPollClosed(String pollId) {
    final updatedPolls = state.polls.updateWhere(
      (it) => it.id == pollId,
      update: (it) => it.copyWith(isClosed: true),
      compare: pollsSort.compare,
    );

    state = state.copyWith(polls: updatedPolls);
  }

  /// Handles the update of a poll.
  void onPollUpdated(PollData poll) {
    final updatedPolls = state.polls.sortedUpsert(
      poll,
      key: (it) => it.id,
      compare: pollsSort.compare,
      update: (existing, updated) => existing.updateWith(updated),
    );

    state = state.copyWith(polls: updatedPolls);
  }

  /// Handles the removal of a poll by ID.
  void onPollRemoved(String pollId) {
    final updatedPolls = state.polls.where((it) {
      return it.id != pollId;
    }).toList();

    state = state.copyWith(polls: updatedPolls);
  }

  /// Handles the casting or updating of a vote in a poll.
  void onPollVoteUpserted(PollData poll, PollVoteData vote) {
    final updatedPolls = state.polls.updateWhere(
      (it) => it.id == poll.id,
      update: (it) => it.upsertVote(poll, vote, currentUserId),
      compare: pollsSort.compare,
    );

    state = state.copyWith(polls: updatedPolls);
  }

  /// Handles the removal of a vote in a poll.
  void onPollVoteRemoved(PollData poll, PollVoteData vote) {
    final updatedPolls = state.polls.updateWhere(
      (it) => it.id == poll.id,
      update: (it) => it.removeVote(poll, vote, currentUserId),
      compare: pollsSort.compare,
    );

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
