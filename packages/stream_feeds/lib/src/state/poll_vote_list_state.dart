import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/pagination_data.dart';
import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import 'query/poll_votes_query.dart';

part 'poll_vote_list_state.freezed.dart';

/// Manages the state of a poll vote list and handles state updates.
///
/// Provides methods to update the poll vote list state in response to data changes
/// and real-time events from the Stream Feeds API.
class PollVoteListStateNotifier extends StateNotifier<PollVoteListState> {
  PollVoteListStateNotifier({
    required PollVoteListState initialState,
  }) : super(initialState);

  QueryConfiguration<PollVoteData>? queryConfig;
  List<Sort<PollVoteData>> get votesSort {
    return queryConfig?.sort ?? PollVotesSort.defaultSort;
  }

  /// Handles the result of a query for more poll votes.
  void onQueryMorePollVotes(
    PaginationResult<PollVoteData> result,
    QueryConfiguration<PollVoteData> queryConfig,
  ) {
    this.queryConfig = queryConfig;

    // Merge the new votes with the existing ones (keeping the sort order)
    final updatedVotes = state.votes.merge(
      result.items,
      key: (it) => it.id,
      compare: votesSort.compare,
    );

    state = state.copyWith(
      votes: updatedVotes,
      pagination: result.pagination,
    );
  }

  /// Handles the deletion of the poll.
  void onPollDeleted() {
    state = state.copyWith(
      votes: [], // Clear all votes when the poll is deleted
      pagination: null,
    );
  }

  /// Handles the addition or update of a poll vote.
  void onPollVoteUpserted(PollVoteData vote) {
    final updatedVotes = state.votes.sortedUpsert(
      vote,
      key: (it) => it.id,
      compare: votesSort.compare,
    );

    state = state.copyWith(votes: updatedVotes);
  }

  /// Handles the removal of a poll vote.
  void onPollVoteRemoved(String voteId) {
    final updatedVotes = state.votes.where((it) {
      return it.id != voteId;
    }).toList();

    state = state.copyWith(votes: updatedVotes);
  }
}

/// An observable state object that manages the current state of a poll vote list.
///
/// Maintains the current list of poll votes and pagination information for
/// efficient loading and navigation through poll vote collections.
@freezed
class PollVoteListState with _$PollVoteListState {
  const PollVoteListState({
    this.votes = const [],
    this.pagination,
  });

  /// All the paginated poll votes currently loaded.
  ///
  /// This list contains all votes that have been fetched across multiple
  /// pagination requests. The votes are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<PollVoteData> votes;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of poll votes.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more votes available to load.
  bool get canLoadMore => pagination?.next != null;
}
