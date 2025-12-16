import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/activity_data.dart';
import '../../../models/bookmark_data.dart';
import '../../../models/feed_id.dart';
import '../../../models/feeds_reaction_data.dart';
import '../../../models/poll_data.dart';
import '../../../models/poll_vote_data.dart';
import '../../../resolvers/poll/poll_answer_casted.dart';
import '../../../resolvers/poll/poll_answer_removed.dart';
import '../../activity_state.dart';
import 'state_event_handler.dart';

/// Event handler for activity real-time updates.
///
/// Processes WebSocket events related to polls and their associated voting
/// and updates the activity state accordingly.
class ActivityEventHandler implements StateEventHandler {
  const ActivityEventHandler({
    required this.fid,
    required this.state,
    required this.activityId,
    required this.currentUserId,
  });

  final FeedId fid;
  final String activityId;
  final String currentUserId;
  final ActivityStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.ActivityUpdatedEvent) {
      // Only process events for this activity
      if (event.activity.id != activityId) return;
      return state.onActivityUpdated(event.activity.toModel());
    }

    if (event is api.ActivityDeletedEvent) {
      // Only process events for this activity
      if (event.activity.id != activityId) return;
      return state.onActivityDeleted();
    }

    if (event is api.ActivityFeedbackEvent) {
      final payload = event.activityFeedback;

      // Only process events for this activity and current user
      if (payload.activityId != activityId) return;
      if (payload.user.id != currentUserId) return;

      // Only handle hide action for now
      if (payload.action == api.ActivityFeedbackEventPayloadAction.hide) {
        return state.onActivityHidden(hidden: payload.value == 'true');
      }
    }

    if (event is api.ActivityReactionAddedEvent) {
      final activity = event.activity.toModel();
      // Only process events for this activity
      if (activity.id != activityId) return;

      final reaction = event.reaction.toModel();
      return state.onReactionAdded(activity, reaction);
    }

    if (event is api.ActivityReactionUpdatedEvent) {
      final activity = event.activity.toModel();
      // Only process events for this activity
      if (activity.id != activityId) return;

      final reaction = event.reaction.toModel();
      return state.onReactionUpdated(activity, reaction);
    }

    if (event is api.ActivityReactionDeletedEvent) {
      final activity = event.activity.toModel();
      // Only process events for this activity
      if (activity.id != activityId) return;

      final reaction = event.reaction.toModel();
      return state.onReactionRemoved(activity, reaction);
    }

    if (event is api.BookmarkAddedEvent) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkAdded(event.bookmark.toModel());
    }

    if (event is api.BookmarkUpdatedEvent) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkUpdated(event.bookmark.toModel());
    }

    if (event is api.BookmarkDeletedEvent) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkRemoved(event.bookmark.toModel());
    }

    // Comment events are not handled in the CommentListEventHandler
    if (event is api.CommentAddedEvent) {}
    if (event is api.CommentUpdatedEvent) {}
    if (event is api.CommentDeletedEvent) {}
    if (event is api.CommentReactionAddedEvent) {}
    if (event is api.CommentReactionUpdatedEvent) {}
    if (event is api.CommentReactionDeletedEvent) {}

    if (event is api.PollClosedFeedEvent) {
      return state.onPollClosed(event.poll.id);
    }

    if (event is api.PollDeletedFeedEvent) {
      return state.onPollDeleted(event.poll.id);
    }

    if (event is api.PollUpdatedFeedEvent) {
      return state.onPollUpdated(event.poll.toModel());
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

    // Handle other activity events here as needed
  }
}
