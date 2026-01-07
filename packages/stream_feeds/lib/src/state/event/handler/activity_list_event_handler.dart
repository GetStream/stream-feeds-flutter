import '../../../repository/capabilities_repository.dart';
import '../../../utils/filter.dart';
import '../../activity_list_state.dart';
import '../../query/activities_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';
import 'feed_capabilities_mixin.dart';

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
  Future<void> handleEvent(StateUpdateEvent event) async {
    if (event is ActivityAdded) {
      if (!event.activity.matches(query.filter)) return;

      state.onActivityUpdated(event.activity);

      final updatedActivity = await withUpdatedFeedCapabilities(event.activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is ActivityUpdated) {
      if (!event.activity.matches(query.filter)) {
        // If the updated activity no longer matches the filter, remove it
        return state.onActivityRemoved(event.activity.id);
      }

      state.onActivityUpdated(event.activity);

      final updatedActivity = await withUpdatedFeedCapabilities(event.activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is ActivityDeleted) {
      return state.onActivityRemoved(event.activityId);
    }

    if (event is ActivityHidden) {
      // Only process events for the current user
      if (event.userId != currentUserId) return;
      return state.onActivityHidden(
        activityId: event.activityId,
        hidden: event.hidden,
      );
    }

    if (event is ActivityReactionUpserted) {
      return state.onReactionUpserted(
        event.activity,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is ActivityReactionDeleted) {
      return state.onReactionRemoved(event.activity, event.reaction);
    }

    if (event is BookmarkAdded) {
      return state.onBookmarkUpserted(event.bookmark);
    }

    if (event is BookmarkUpdated) {
      return state.onBookmarkUpserted(event.bookmark);
    }

    if (event is BookmarkDeleted) {
      return state.onBookmarkRemoved(event.bookmark);
    }

    if (event is CommentAdded) {
      return state.onCommentUpserted(event.comment);
    }

    if (event is CommentUpdated) {
      return state.onCommentUpserted(event.comment);
    }

    if (event is CommentDeleted) {
      return state.onCommentRemoved(event.comment);
    }

    if (event is CommentReactionUpserted) {
      return state.onCommentReactionUpserted(
        event.comment,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      return state.onCommentReactionRemoved(event.comment, event.reaction);
    }

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

    // Handle other activity list events here as needed
  }
}
