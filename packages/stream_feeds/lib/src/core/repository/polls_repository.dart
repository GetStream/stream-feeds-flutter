import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
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
/// updates. All methods return [Result] objects for explicit error handling.
class PollsRepository {
  /// Creates a new [PollsRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const PollsRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Closes a poll by ID.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> closePoll(String pollId) {
    return runSafely(() async {
      const request = api.UpdatePollPartialRequest(
        set: {'is_closed': true},
      );
      final response = await _apiClient.updatePollPartial(
        pollId: pollId,
        updatePollPartialRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from closePoll');
      }

      return response.poll.toModel();
    });
  }

  /// Creates a new poll based on the provided [CreatePollRequest].
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> createPoll(api.CreatePollRequest request) {
    return runSafely(() async {
      final response = await _apiClient.createPoll(
        createPollRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from createPoll');
      }

      return response.poll.toModel();
    });
  }

  /// Deletes a poll by ID.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePoll(String pollId, String? userId) {
    return runSafely(() async {
      await _apiClient.deletePoll(
        pollId: pollId,
        userId: userId,
      );
    });
  }

  /// Retrieves a poll by ID.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> getPoll(String pollId, String? userId) {
    return runSafely(() async {
      final response = await _apiClient.getPoll(
        pollId: pollId,
        userId: userId,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from getPoll');
      }

      return response.poll.toModel();
    });
  }

  /// Updates a poll partially based on the provided [UpdatePollPartialRequest].
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> updatePollPartial(
    String pollId,
    api.UpdatePollPartialRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updatePollPartial(
        pollId: pollId,
        updatePollPartialRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from updatePollPartial',
        );
      }

      return response.poll.toModel();
    });
  }

  /// Updates a poll based on the provided [UpdatePollRequest].
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> updatePoll(api.UpdatePollRequest request) {
    return runSafely(() async {
      final response = await _apiClient.updatePoll(
        updatePollRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updatePoll');
      }

      return response.poll.toModel();
    });
  }

  /// Creates a new poll option based on the provided [CreatePollOptionRequest].
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> createPollOption(
    String pollId,
    api.CreatePollOptionRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.createPollOption(
        pollId: pollId,
        createPollOptionRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from createPollOption');
      }

      return response.pollOption.toModel();
    });
  }

  /// Deletes a poll option by ID.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePollOption(
    String pollId,
    String optionId,
    String? userId,
  ) {
    return runSafely(() async {
      await _apiClient.deletePollOption(
        pollId: pollId,
        optionId: optionId,
        userId: userId,
      );
    });
  }

  /// Retrieves a poll option by ID.
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> getPollOption(
    String pollId,
    String optionId,
    String? userId,
  ) {
    return runSafely(() async {
      final response = await _apiClient.getPollOption(
        pollId: pollId,
        optionId: optionId,
        userId: userId,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from getPollOption');
      }

      return response.pollOption.toModel();
    });
  }

  /// Updates a poll option based on the provided [UpdatePollOptionRequest].
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> updatePollOption(
    String pollId,
    api.UpdatePollOptionRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updatePollOption(
        pollId: pollId,
        updatePollOptionRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from updatePollOption',
        );
      }

      return response.pollOption.toModel();
    });
  }

  /// Queries polls based on the provided [PollsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [PollData] or an error.
  Future<Result<PaginationResult<PollData>>> queryPolls(PollsQuery query) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryPolls(
        queryPollsRequest: request,
        userId: null,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryPolls');
      }

      final polls = response.polls.map((p) => p.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: polls, pagination: pagination);
    });
  }

  /// Casts a vote in a poll based on the provided [CastPollVoteRequest].
  ///
  /// Returns a [Result] containing [PollVoteData] or an error.
  Future<Result<PollVoteData?>> castPollVote(
    String activityId,
    String pollId,
    api.CastPollVoteRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.castPollVote(
        activityId: activityId,
        pollId: pollId,
        castPollVoteRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from castPollVote');
      }

      return response.vote?.toModel();
    });
  }

  /// Queries poll votes based on the provided [PollVotesQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [PollVoteData] or an error.
  Future<Result<PaginationResult<PollVoteData>>> queryPollVotes(
    PollVotesQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryPollVotes(
        pollId: query.pollId,
        queryPollVotesRequest: request,
        userId: query.userId,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryPollVotes');
      }

      final votes = response.votes.map((v) => v.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: votes, pagination: pagination);
    });
  }

  /// Deletes a poll vote by ID.
  ///
  /// Returns a [Result] containing [PollVoteData] or an error.
  Future<Result<PollVoteData?>> deletePollVote(
    String activityId,
    String pollId,
    String voteId, {
    String? userId,
  }) {
    return runSafely(() async {
      final response = await _apiClient.deletePollVote(
        activityId: activityId,
        pollId: pollId,
        voteId: voteId,
        userId: userId,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from deletePollVote');
      }

      return response.vote?.toModel();
    });
  }
}
