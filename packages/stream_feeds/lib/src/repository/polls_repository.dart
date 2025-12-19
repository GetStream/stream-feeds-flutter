import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_option_data.dart';
import '../models/poll_vote_data.dart';
import '../state/query/poll_votes_query.dart';
import '../state/query/polls_query.dart';

/// Repository for managing polls and poll votes.
///
/// Provides methods for creating, managing, and querying polls. Supports
/// voting functionality, option management, and vote tracking with real-time
/// updates.
///
/// All methods return [Result] objects for explicit error handling.
class PollsRepository {
  /// Creates a new [PollsRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const PollsRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Closes a poll.
  ///
  /// Marks the poll with [pollId] as closed, preventing further voting.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> closePoll(String pollId) async {
    const request = api.UpdatePollPartialRequest(
      set: {'is_closed': true},
    );

    final result = await _api.updatePollPartial(
      pollId: pollId,
      updatePollPartialRequest: request,
    );

    return result.map((response) => response.poll.toModel());
  }

  /// Creates a new poll.
  ///
  /// Creates a new poll using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> createPoll(api.CreatePollRequest request) async {
    final result = await _api.createPoll(
      createPollRequest: request,
    );

    return result.map((response) => response.poll.toModel());
  }

  /// Deletes a poll.
  ///
  /// Permanently removes the poll with [pollId] from the system.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePoll(String pollId) {
    return _api.deletePoll(pollId: pollId);
  }

  /// Retrieves a poll.
  ///
  /// Fetches the poll with [pollId] from the server.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> getPoll(String pollId) async {
    final result = await _api.getPoll(pollId: pollId);

    return result.map((response) => response.poll.toModel());
  }

  /// Updates a poll partially.
  ///
  /// Modifies specific fields of the poll [pollId] using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> updatePollPartial(
    String pollId,
    api.UpdatePollPartialRequest request,
  ) async {
    final result = await _api.updatePollPartial(
      pollId: pollId,
      updatePollPartialRequest: request,
    );

    return result.map((response) => response.poll.toModel());
  }

  /// Updates a poll.
  ///
  /// Modifies the poll using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> updatePoll(api.UpdatePollRequest request) async {
    final result = await _api.updatePoll(
      updatePollRequest: request,
    );

    return result.map((response) => response.poll.toModel());
  }

  /// Creates a new poll option.
  ///
  /// Adds a new option to the poll [pollId] using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> createPollOption(
    String pollId,
    api.CreatePollOptionRequest request,
  ) async {
    final result = await _api.createPollOption(
      pollId: pollId,
      createPollOptionRequest: request,
    );

    return result.map((response) => response.pollOption.toModel());
  }

  /// Deletes a poll option.
  ///
  /// Permanently removes the poll option with [optionId] from the poll [pollId].
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePollOption(
    String pollId,
    String optionId,
  ) {
    return _api.deletePollOption(
      pollId: pollId,
      optionId: optionId,
    );
  }

  /// Retrieves a poll option.
  ///
  /// Fetches the poll option with [optionId] from the poll [pollId].
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> getPollOption(
    String pollId,
    String optionId,
  ) async {
    final result = await _api.getPollOption(
      pollId: pollId,
      optionId: optionId,
    );

    return result.map((response) => response.pollOption.toModel());
  }

  /// Updates a poll option.
  ///
  /// Modifies the poll option of the poll [pollId] using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> updatePollOption(
    String pollId,
    api.UpdatePollOptionRequest request,
  ) async {
    final result = await _api.updatePollOption(
      pollId: pollId,
      updatePollOptionRequest: request,
    );

    return result.map((response) => response.pollOption.toModel());
  }

  /// Queries polls.
  ///
  /// Searches for polls using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [PollData] or an error.
  Future<Result<PaginationResult<PollData>>> queryPolls(
    PollsQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryPolls(queryPollsRequest: request);

    return result.map((response) {
      final polls = response.polls.map((p) => p.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: polls, pagination: pagination);
    });
  }

  /// Casts a vote in a poll.
  ///
  /// Records a vote for the poll [pollId] using the provided [request] data.
  ///
  /// Returns a [Result] containing [PollVoteData] or an error.
  Future<Result<PollVoteData?>> castPollVote(
    String activityId,
    String pollId,
    api.CastPollVoteRequest request,
  ) async {
    final result = await _api.castPollVote(
      activityId: activityId,
      pollId: pollId,
      castPollVoteRequest: request,
    );

    return result.map((response) => response.vote?.toModel());
  }

  /// Queries poll votes.
  ///
  /// Retrieves votes for a poll using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [PollVoteData] or an error.
  Future<Result<PaginationResult<PollVoteData>>> queryPollVotes(
    PollVotesQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryPollVotes(
      pollId: query.pollId,
      queryPollVotesRequest: request,
      userId: query.userId,
    );

    return result.map((response) {
      final votes = response.votes.map((v) => v.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: votes, pagination: pagination);
    });
  }

  /// Deletes a poll vote.
  ///
  /// Permanently removes the poll vote with [voteId] from the poll [pollId].
  ///
  /// Returns a [Result] containing [PollVoteData] or an error.
  Future<Result<PollVoteData?>> deletePollVote(
    String activityId,
    String pollId,
    String voteId,
  ) async {
    final result = await _api.deletePollVote(
      activityId: activityId,
      pollId: pollId,
      voteId: voteId,
    );

    return result.map((response) => response.vote?.toModel());
  }
}
