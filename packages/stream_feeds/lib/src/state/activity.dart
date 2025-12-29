import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart' as api;
import '../models/activity_data.dart';
import '../models/comment_data.dart';
import '../models/feed_id.dart';
import '../models/feeds_reaction_data.dart';
import '../models/poll_data.dart';
import '../models/poll_option_data.dart';
import '../models/poll_vote_data.dart';
import '../models/request/activity_add_comment_request.dart';
import '../models/request/activity_update_comment_request.dart';
import '../repository/activities_repository.dart';
import '../repository/capabilities_repository.dart';
import '../repository/comments_repository.dart';
import '../repository/polls_repository.dart';
import 'activity_comment_list.dart';
import 'activity_state.dart';
import 'event/fid_scope.dart';
import 'event/handler/activity_event_handler.dart';
import 'event/state_update_event.dart';
import 'query/activity_comments_query.dart';
import 'state_notifier_extension.dart';

/// Represents a single activity with its data and state.
///
/// The primary interface for working with individual activities in the Stream Feeds SDK that provides
/// functionality for managing activity data, comments, reactions, and polls with real-time updates.
///
/// Each activity instance is associated with a specific activity ID and feed ID, maintaining its own state
/// that can be observed for real-time updates. The activity state includes activity data, comments, and poll information.
class Activity with Disposable {
  @internal
  Activity({
    required this.activityId,
    required this.fid,
    required this.currentUserId,
    required this.activitiesRepository,
    required this.commentsRepository,
    required this.pollsRepository,
    required this.capabilitiesRepository,
    ActivityData? initialActivityData,
    required MutableSharedEmitter<StateUpdateEvent> eventsEmitter,
  }) : _eventsEmitter = eventsEmitter {
    _commentsList = ActivityCommentList(
      query: ActivityCommentsQuery(
        objectId: activityId,
        objectType: 'activity',
        depth: 3, // Default depth for threaded comments
      ),
      currentUserId: currentUserId,
      commentsRepository: commentsRepository,
      eventsEmitter: _eventsEmitter,
    );

    final initialActivityState = ActivityState(
      activity: initialActivityData,
    );

    _stateNotifier = ActivityStateNotifier(
      initialState: initialActivityState,
      currentUserId: currentUserId,
      commentList: _commentsList.notifier,
    );

    // Attach event handlers for real-time updates
    final handler = ActivityEventHandler(
      fid: fid,
      state: _stateNotifier,
      activityId: activityId,
      currentUserId: currentUserId,
    );

    _eventsSubscription = _eventsEmitter.listen(handler.handleEvent);
  }

  final String activityId;
  final FeedId fid;
  final String currentUserId;
  final ActivitiesRepository activitiesRepository;
  final CommentsRepository commentsRepository;
  final PollsRepository pollsRepository;
  final CapabilitiesRepository capabilitiesRepository;

  late final ActivityCommentList _commentsList;

  ActivityState get state => _stateNotifier.value;
  StateNotifier<ActivityState> get notifier => _stateNotifier;
  Stream<ActivityState> get stream => _stateNotifier.stream;
  late final ActivityStateNotifier _stateNotifier;

  final MutableSharedEmitter<StateUpdateEvent> _eventsEmitter;
  StreamSubscription<StateUpdateEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    _commentsList.dispose();
    super.dispose();
  }

  /// Fetches the activity data from the server.
  ///
  /// Returns a [Result] containing [ActivityData] or an error.
  Future<Result<ActivityData>> get() async {
    final result = await activitiesRepository.getActivity(activityId);

    result.onSuccess((activity) {
      _eventsEmitter.tryEmit(
        ActivityUpdated(scope: FidScope.unknown, activity: activity),
      );

      if (activity.currentFeed case final feed?) {
        capabilitiesRepository.cacheCapabilitiesForFeeds([feed]);
      }
    });

    // Query the comments as well (state will be updated automatically)
    await queryComments();

    return result;
  }

  /// Submits feedback for this activity.
  ///
  /// Submits feedback for this activity using the provided [activityFeedbackRequest].
  ///
  /// Returns a [Result] indicating success or failure of the operation.
  Future<Result<void>> activityFeedback({
    required api.ActivityFeedbackRequest activityFeedbackRequest,
  }) async {
    final result = await activitiesRepository.activityFeedback(
      activityId,
      activityFeedbackRequest,
    );

    result.onSuccess(
      (_) => activityFeedbackRequest.hide?.let(
        (hidden) => _eventsEmitter.tryEmit(
          ActivityHidden(
            activityId: activityId,
            userId: currentUserId,
            hidden: hidden,
          ),
        ),
      ),
    );

    return result;
  }

  /// Queries the comments for this activity.
  ///
  /// Returns a [Result] containing a list of [CommentData] or an error.
  Future<Result<List<CommentData>>> queryComments() {
    return _commentsList.get();
  }

  /// Loads more comments for this activity.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// comments to return.
  Future<Result<List<CommentData>>> queryMoreComments({int? limit}) {
    return _commentsList.queryMoreComments(limit: limit);
  }

  /// Fetches a specific comment by its ID.
  ///
  /// Returns a [Result] containing [CommentData] or an error.
  Future<Result<CommentData>> getComment(String commentId) async {
    final result = await commentsRepository.getComment(commentId);

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentUpdated(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Adds a comment to this activity.
  ///
  /// Returns a [Result] containing the created [CommentData] or an error.
  Future<Result<CommentData>> addComment({
    required ActivityAddCommentRequest request,
  }) async {
    final result = await commentsRepository.addComment(request);

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentAdded(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Adds multiple comments to this activity in a batch.
  ///
  /// Returns a [Result] containing a list of created [CommentData] or an error.
  Future<Result<List<CommentData>>> addCommentsBatch(
    List<ActivityAddCommentRequest> requests,
  ) async {
    final result = await commentsRepository.addCommentsBatch(requests);

    result.onSuccess(
      (comments) {
        for (final comment in comments) {
          _eventsEmitter.tryEmit(
            CommentAdded(scope: FidScope.unknown, comment: comment),
          );
        }
      },
    );

    return result;
  }

  /// Deletes a comment by its ID.
  ///
  /// When [hardDelete] is true, permanently deletes the comment; otherwise marks it as deleted.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteComment(
    String commentId, {
    bool? hardDelete,
  }) async {
    final result = await commentsRepository.deleteComment(
      commentId,
      hardDelete: hardDelete,
    );

    result.onSuccess(
      (pair) {
        _eventsEmitter.tryEmit(
          CommentDeleted(scope: FidScope.unknown, comment: pair.comment),
        );

        _eventsEmitter.tryEmit(
          ActivityUpdated(scope: FidScope.unknown, activity: pair.activity),
        );
      },
    );

    return result;
  }

  /// Updates a comment by its ID.
  ///
  /// Returns a [Result] containing the updated [CommentData] or an error.
  Future<Result<CommentData>> updateComment(
    String commentId,
    ActivityUpdateCommentRequest request,
  ) async {
    final result = await commentsRepository.updateComment(
      commentId,
      request.toRequest(),
    );

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentUpdated(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Adds a reaction to a comment.
  ///
  /// Returns a [Result] containing the created [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> addCommentReaction({
    required String commentId,
    required api.AddCommentReactionRequest request,
  }) async {
    final result = await commentsRepository.addCommentReaction(
      commentId,
      request,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        CommentReactionUpserted(
          scope: FidScope.unknown,
          comment: pair.comment,
          reaction: pair.reaction,
          enforceUnique: request.enforceUnique ?? false,
        ),
      ),
    );

    return result.map((pair) => pair.reaction);
  }

  /// Removes a reaction from a comment.
  ///
  /// Returns a [Result] containing the removed [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> deleteCommentReaction(
    String commentId,
    String type,
  ) async {
    final result = await commentsRepository.deleteCommentReaction(
      commentId,
      type,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        CommentReactionDeleted(
          scope: FidScope.unknown,
          comment: pair.comment,
          reaction: pair.reaction,
        ),
      ),
    );

    return result.map((pair) => pair.reaction);
  }

  /// Pins this activity.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> pin() async {
    final result = await activitiesRepository.pin(activityId, fid);

    result.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityUpdated(scope: FidScope.unknown, activity: activity),
      ),
    );

    return result;
  }

  /// Unpins this activity.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> unpin() async {
    final result = await activitiesRepository.unpin(activityId, fid);

    result.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityUpdated(scope: FidScope.unknown, activity: activity),
      ),
    );

    return result;
  }

  /// Closes the poll associated with this activity.
  ///
  /// Returns a [Result] containing the updated [PollData] or an error.
  Future<Result<PollData>> closePoll() async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync(pollsRepository.closePoll);

    result.onSuccess((poll) => _eventsEmitter.tryEmit(PollClosed(poll: poll)));

    return result;
  }

  /// Deletes the poll associated with this activity.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePoll() async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync(pollsRepository.deletePoll);

    result.onSuccess(
      (_) => _eventsEmitter.tryEmit(
        PollDeleted(pollId: pollIdResult.getOrThrow()),
      ),
    );

    return result;
  }

  /// Fetches the poll associated with this activity.
  ///
  /// Returns a [Result] containing [PollData] or an error.
  Future<Result<PollData>> getPoll() async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync(pollsRepository.getPoll);

    result.onSuccess((poll) => _eventsEmitter.tryEmit(PollUpdated(poll: poll)));

    return result;
  }

  /// Updates the poll partially.
  ///
  /// Returns a [Result] containing the updated [PollData] or an error.
  Future<Result<PollData>> updatePollPartial(
    api.UpdatePollPartialRequest request,
  ) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.updatePollPartial(pollId, request);
    });

    result.onSuccess((poll) => _eventsEmitter.tryEmit(PollUpdated(poll: poll)));

    return result;
  }

  /// Updates the poll.
  ///
  /// Returns a [Result] containing the updated [PollData] or an error.
  Future<Result<PollData>> updatePoll(api.UpdatePollRequest request) async {
    final result = await pollsRepository.updatePoll(request);

    result.onSuccess((poll) => _eventsEmitter.tryEmit(PollUpdated(poll: poll)));

    return result;
  }

  /// Creates a new poll option.
  ///
  /// Returns a [Result] containing the created [PollOptionData] or an error.
  Future<Result<PollOptionData>> createPollOption(
    api.CreatePollOptionRequest request,
  ) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.createPollOption(pollId, request);
    });

    return result;
  }

  /// Deletes a poll option by its ID.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deletePollOption({required String optionId}) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.deletePollOption(pollId, optionId);
    });

    return result;
  }

  /// Fetches a poll option by its ID.
  ///
  /// Returns a [Result] containing [PollOptionData] or an error.
  Future<Result<PollOptionData>> getPollOption(String optionId) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.getPollOption(pollId, optionId);
    });

    return result;
  }

  /// Updates a poll option.
  ///
  /// Returns a [Result] containing the updated [PollOptionData] or an error.
  Future<Result<PollOptionData>> updatePollOption(
    api.UpdatePollOptionRequest request,
  ) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.updatePollOption(pollId, request);
    });

    return result;
  }

  /// Casts a vote on the poll.
  ///
  /// Returns a [Result] containing the created [PollVoteData] or an error.
  Future<Result<PollVoteData?>> castPollVote(
    api.CastPollVoteRequest request,
  ) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.castPollVote(activityId, pollId, request);
    });

    return result;
  }

  /// Deletes a poll vote by its ID.
  ///
  /// Returns a [Result] containing the deleted [PollVoteData] or an error.
  Future<Result<PollVoteData?>> deletePollVote({required String voteId}) async {
    final pollIdResult = await _pollId();
    final result = await pollIdResult.flatMapAsync((pollId) {
      return pollsRepository.deletePollVote(activityId, pollId, voteId);
    });

    return result;
  }

  // region Internal helper methods

  Future<Result<ActivityData>> _ensureActivityLoaded() async {
    final activity = _stateNotifier.value.activity;
    if (activity != null) return Result.success(activity);
    return get();
  }

  Future<Result<String>> _pollId() async {
    final activityResult = await _ensureActivityLoaded();
    final poll = activityResult.getOrNull()?.poll;
    if (poll != null) return Result.success(poll.id);

    return Result.failure(StateError('Activity does not have a poll'));
  }

  // endregion
}
