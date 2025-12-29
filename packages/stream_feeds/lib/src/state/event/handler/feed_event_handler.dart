import '../../../models/follow_data.dart';
import '../../../repository/capabilities_repository.dart';
import '../../../utils/filter.dart';
import '../../feed_state.dart';
import '../../query/feed_query.dart';
import '../on_activity_added.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';
import 'feed_capabilities_mixin.dart';

class FeedEventHandler with FeedCapabilitiesMixin implements StateEventHandler {
  const FeedEventHandler({
    required this.query,
    required this.state,
    required this.currentUserId,
    required this.onNewActivity,
    required this.capabilitiesRepository,
  });

  final FeedQuery query;
  final String currentUserId;
  final FeedStateNotifier state;
  final OnNewActivity onNewActivity;

  @override
  final CapabilitiesRepository capabilitiesRepository;

  @override
  Future<void> handleEvent(StateUpdateEvent event) async {
    if (event is ActivityAdded) {
      // We add activities only on strict matches, i.e. we're sure they belong to the feed
      if (!event.scope.strictlyMatches(query.fid)) return;

      final action = onNewActivity(query, event.activity, currentUserId);
      state.onActivityAdded(event.activity, insertionAction: action);

      final updatedActivity = await withUpdatedFeedCapabilities(event.activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is ActivityUpdated) {
      if (!event.scope.matches(query.fid)) return;

      if (!event.activity.matches(query.activityFilter)) {
        // If the updated activity no longer matches the filter, remove it
        return state.onActivityRemoved(event.activity.id);
      }

      final updatedActivity = await withUpdatedFeedCapabilities(event.activity);
      return state.onActivityUpdated(updatedActivity ?? event.activity);
    }

    if (event is ActivityDeleted) {
      if (!event.scope.matches(query.fid)) return;
      return state.onActivityRemoved(event.activityId);
    }

    if (event is ActivityRemovedFromFeed) {
      if (!event.scope.matches(query.fid)) return;
      return state.onActivityRemoved(event.activityId);
    }

    if (event is ActivityPinned) {
      if (!event.scope.matches(query.fid)) return;
      return state.onActivityPinned(event.pinnedActivity);
    }

    if (event is ActivityUnpinned) {
      if (!event.scope.matches(query.fid)) return;
      return state.onActivityUnpinned(event.activityId);
    }

    if (event is ActivityHidden) {
      // Only process events for the current user
      if (event.userId != currentUserId) return;

      return state.onActivityHidden(
        activityId: event.activityId,
        hidden: event.hidden,
      );
    }

    if (event is ActivityMarked) {
      if (!event.scope.matches(query.fid)) return;
      return state.onActivityMarked(event.data);
    }

    if (event is ActivityReactionUpserted) {
      if (!event.scope.matches(query.fid)) return;
      return state.onReactionUpserted(
        event.activity,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is ActivityReactionDeleted) {
      if (!event.scope.matches(query.fid)) return;
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
      if (!event.scope.matches(query.fid)) return;
      return state.onCommentUpserted(event.comment);
    }

    if (event is CommentUpdated) {
      if (!event.scope.matches(query.fid)) return;
      return state.onCommentUpserted(event.comment);
    }

    if (event is CommentDeleted) {
      if (!event.scope.matches(query.fid)) return;
      return state.onCommentRemoved(event.comment);
    }

    if (event is CommentReactionUpserted) {
      if (!event.scope.matches(query.fid)) return;
      return state.onCommentReactionUpserted(
        event.comment,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      if (!event.scope.matches(query.fid)) return;
      return state.onCommentReactionRemoved(event.comment, event.reaction);
    }

    if (event is FeedDeleted) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFeedDeleted();
    }

    if (event is FeedUpdated) {
      if (event.feed.fid.rawValue != query.fid.rawValue) return;
      return state.onFeedUpdated(event.feed);
    }

    if (event is FollowAdded) {
      if (!event.follow.matchesFeed(query.fid.rawValue)) return;
      return state.onFollowAdded(event.follow);
    }

    if (event is FollowDeleted) {
      if (!event.follow.matchesFeed(query.fid.rawValue)) return;
      return state.onFollowRemoved(event.follow);
    }

    if (event is FollowUpdated) {
      if (!event.follow.matchesFeed(query.fid.rawValue)) return;
      return state.onFollowUpdated(event.follow);
    }

    // Member events are already handled in MemberListEventHandler
    if (event is FeedMemberRemoved) return;
    if (event is FeedMemberUpdated) return;

    if (event is NotificationFeedUpdated) {
      if (event.fid != query.fid.rawValue) return;
      return state.onNotificationFeedUpdated(
        event.notificationStatus,
        event.aggregatedActivities,
      );
    }

    if (event is StoriesFeedUpdated) {
      if (event.fid != query.fid.rawValue) return;
      return state.onStoriesFeedUpdated(event.aggregatedActivities);
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

    // Handle other events if necessary
  }
}

extension on FollowData {
  bool matchesFeed(String fid) {
    final matchesSource = sourceFeed.fid.rawValue == fid;
    final matchesTarget = targetFeed.fid.rawValue == fid;
    return matchesSource || matchesTarget;
  }
}
