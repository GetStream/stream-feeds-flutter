import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import '../repository/polls_repository.dart';
import 'event/handler/poll_vote_list_event_handler.dart';
import 'poll_vote_list_state.dart';
import 'query/poll_votes_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of poll votes with a query and state.
///
/// The primary interface for working with poll vote lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of poll votes with pagination support.
///
/// Each poll vote list instance is associated with a specific poll and maintains its own state
/// that can be observed for real-time updates. The poll vote list state includes votes and
/// pagination information.
class PollVoteList with Disposable {
  @internal
  PollVoteList({
    required this.query,
    required this.pollsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = PollVoteListStateNotifier(
      initialState: const PollVoteListState(),
    );

    // Attach event handlers for real-time updates
    final handler = PollVoteListEventHandler(
      query: query,
      state: _stateNotifier,
    );
    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final PollVotesQuery query;
  final PollsRepository pollsRepository;

  late final PollVoteListStateNotifier _stateNotifier;

  PollVoteListState get state => _stateNotifier.value;
  StateNotifier<PollVoteListState> get notifier => _stateNotifier;
  Stream<PollVoteListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of poll votes based on the provided query.
  ///
  /// Returns a [Result] containing a list of poll votes or an error.
  Future<Result<List<PollVoteData>>> get() => _queryPollVotes(query);

  /// Loads more poll votes based on the current pagination state.
  ///
  /// If there are no more votes available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// votes to return.
  Future<Result<List<PollVoteData>>> queryMorePollVotes({int? limit}) async {
    // Build the next query using the current pagination state
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more votes available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryPollVotes(nextQuery);
  }

  // Internal method to query poll votes and update state.
  Future<Result<List<PollVoteData>>> _queryPollVotes(
    PollVotesQuery query,
  ) async {
    final result = await pollsRepository.queryPollVotes(query);

    result.onSuccess(
      (votesData) => _stateNotifier.onQueryMorePollVotes(
        votesData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((votesData) => votesData.items);
  }
}
