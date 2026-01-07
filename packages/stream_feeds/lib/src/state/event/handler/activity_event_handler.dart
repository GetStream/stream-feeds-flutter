import '../../../models/feed_id.dart';
import '../../activity_state.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

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
  void handleEvent(StateUpdateEvent event) {
    if (event is ActivityUpdated) {
      // Only process events for this activity
      if (event.activity.id != activityId) return;
      return state.onActivityUpdated(event.activity);
    }

    if (event is ActivityDeleted) {
      // Only process events for this activity
      if (event.activityId != activityId) return;
      return state.onActivityDeleted();
    }

    if (event is ActivityHidden) {
      // Only process events for this activity and current user
      if (event.activityId != activityId) return;
      if (event.userId != currentUserId) return;
      return state.onActivityHidden(hidden: event.hidden);
    }

    if (event is ActivityReactionUpserted) {
      // Only process events for this activity
      if (event.activity.id != activityId) return;
      return state.onReactionUpserted(
        event.activity,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is ActivityReactionDeleted) {
      // Only process events for this activity
      if (event.activity.id != activityId) return;
      return state.onReactionRemoved(event.activity, event.reaction);
    }

    if (event is BookmarkAdded) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkUpserted(event.bookmark);
    }

    if (event is BookmarkUpdated) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkUpserted(event.bookmark);
    }

    if (event is BookmarkDeleted) {
      // Only process events for this activity
      if (event.bookmark.activity.id != activityId) return;
      return state.onBookmarkRemoved(event.bookmark);
    }

    // Comment events are already handled in the CommentListEventHandler
    if (event is CommentAdded) {}
    if (event is CommentUpdated) {}
    if (event is CommentDeleted) {}
    if (event is CommentReactionUpserted) {}
    if (event is CommentReactionDeleted) {}

    if (event is PollDeleted) {
      return state.onPollDeleted(event.pollId);
    }

    if (event is PollClosed) {
      return state.onPollClosed(event.poll.id);
    }

    if (event is PollUpdated) {
      return state.onPollUpdated(event.poll);
    }

    if (event is PollVoteCasted) {
      return state.onPollVoteUpserted(event.poll, event.vote);
    }

    if (event is PollVoteChanged) {
      return state.onPollVoteUpserted(event.poll, event.vote);
    }

    if (event is PollVoteRemoved) {
      return state.onPollVoteRemoved(event.poll, event.vote);
    }

    // Handle other activity events here as needed
  }
}
