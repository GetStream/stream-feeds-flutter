import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/activity_data.dart';
import '../../../models/bookmark_data.dart';
import '../../../models/comment_data.dart';
import '../../../models/feeds_reaction_data.dart';
import '../../../models/poll_data.dart';
import '../../../models/poll_vote_data.dart';
import '../../../repository/capabilities_repository.dart';
import '../../../resolvers/resolvers.dart';
import '../../../utils/filter.dart';
import '../../activity_list_state.dart';
import '../../query/activities_query.dart';
import 'feed_capabilities_mixin.dart';
import 'state_event_handler.dart';

/// Event handler for activity list real-time updates.
///
/// Processes WebSocket events related to activities and their associated content
/// (reactions, comments, bookmarks) and updates the activity list state accordingly.
class ActivityListEventHandler
    with FeedCapabilitiesMixin
    implements StateEventHandler {
  const ActivityListEventHandler({
    required this.query,
    required this.state,
    required this.currentUserId,
    required this.capabilitiesRepository,
  });

  final ActivitiesQuery query;
  final ActivityListStateNotifier state;
  final String currentUserId;

  @override
  final CapabilitiesRepository capabilitiesRepository;

  @override
  Future<void> handleEvent(WsEvent event) async {
    if (event is api.ActivityAddedEvent) {
      final activity = event.activity.toModel();
      if (!activity.matches(query.filter)) return;

      state.onActivityUpdated(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is api.ActivityUpdatedEvent) {
      final activity = event.activity.toModel();
      if (!activity.matches(query.filter)) {
        // If the updated activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity.id);
      }

      state.onActivityUpdated(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is api.ActivityDeletedEvent) {
      return state.onActivityRemoved(event.activity.id);
    }

    if (event is api.ActivityFeedbackEvent) {
      final payload = event.activityFeedback;

      // Only process events for the current user
      if (payload.user.id != currentUserId) return;

      // Only handle hide action for now
      if (payload.action == api.ActivityFeedbackEventPayloadAction.hide) {
        return state.onActivityHidden(
          activityId: payload.activityId,
          hidden: payload.value == 'true',
        );
      }
    }

    if (event is api.ActivityReactionAddedEvent) {
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionAdded(activity, reaction);
    }

    if (event is api.ActivityReactionUpdatedEvent) {
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionUpdated(activity, reaction);
    }

    if (event is api.ActivityReactionDeletedEvent) {
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionRemoved(activity, reaction);
    }

    if (event is api.BookmarkAddedEvent) {
      final bookmark = event.bookmark.toModel();
      return state.onBookmarkAdded(bookmark);
    }

    if (event is api.BookmarkUpdatedEvent) {
      final bookmark = event.bookmark.toModel();
      return state.onBookmarkUpdated(bookmark);
    }

    if (event is api.BookmarkDeletedEvent) {
      final bookmark = event.bookmark.toModel();
      return state.onBookmarkRemoved(bookmark);
    }

    if (event is api.CommentAddedEvent) {
      final comment = event.comment.toModel();
      return state.onCommentAdded(comment);
    }

    if (event is api.CommentUpdatedEvent) {
      final comment = event.comment.toModel();
      return state.onCommentUpdated(comment);
    }

    if (event is api.CommentDeletedEvent) {
      final comment = event.comment.toModel();
      return state.onCommentRemoved(comment);
    }

    if (event is api.CommentReactionAddedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionAdded(comment, reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionUpdated(comment, reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionRemoved(comment, reaction);
    }

    if (event is api.PollClosedFeedEvent) {
      return state.onPollClosed(event.poll.id);
    }

    if (event is api.PollDeletedFeedEvent) {
      return state.onPollDeleted(event.poll.id);
    }

    if (event is api.PollUpdatedFeedEvent) {
      final poll = event.poll.toModel();
      return state.onPollUpdated(poll);
    }

    if (event is PollAnswerCastedFeedEvent) {
      final poll = event.poll.toModel();
      final answer = event.pollVote.toModel();
      return state.onPollAnswerCasted(poll, answer);
    }

    if (event is api.PollVoteCastedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return state.onPollVoteCasted(poll, vote);
    }

    if (event is api.PollVoteChangedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return state.onPollVoteChanged(poll, vote);
    }

    if (event is PollAnswerRemovedFeedEvent) {
      final poll = event.poll.toModel();
      final answer = event.pollVote.toModel();
      return state.onPollAnswerRemoved(poll, answer);
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return state.onPollVoteRemoved(poll, vote);
    }

    // Handle other activity list events here as needed
  }
}
