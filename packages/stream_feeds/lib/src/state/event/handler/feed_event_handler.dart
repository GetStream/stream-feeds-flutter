import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/activity_data.dart';
import '../../../models/activity_pin_data.dart';
import '../../../models/aggregated_activity_data.dart';
import '../../../models/bookmark_data.dart';
import '../../../models/comment_data.dart';
import '../../../models/feed_data.dart';
import '../../../models/feeds_reaction_data.dart';
import '../../../models/follow_data.dart';
import '../../../models/mark_activity_data.dart';
import '../../../models/poll_data.dart';
import '../../../models/poll_vote_data.dart';
import '../../../repository/capabilities_repository.dart';
import '../../../resolvers/resolvers.dart';
import '../../../utils/filter.dart';
import '../../feed_state.dart';

import '../../query/feed_query.dart';
import '../on_activity_added.dart';
import 'feed_capabilities_mixin.dart';
import 'state_event_handler.dart';

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
  Future<void> handleEvent(WsEvent event) async {
    if (event is api.ActivityAddedEvent) {
      if (event.fid != query.fid.rawValue) return;
      final activity = event.activity.toModel();

      final insertionAction = onNewActivity(query, activity, currentUserId);
      state.onActivityAdded(activity, insertionAction: insertionAction);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is api.ActivityUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!activity.matches(query.activityFilter)) {
        // If the updated activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      return state.onActivityUpdated(updatedActivity ?? activity);
    }

    if (event is api.ActivityDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onActivityRemoved(event.activity.toModel());
    }

    if (event is api.ActivityRemovedFromFeedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onActivityRemoved(event.activity.toModel());
    }

    if (event is api.ActivityPinnedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onActivityPinned(event.pinnedActivity.toModel());
    }

    if (event is api.ActivityUnpinnedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onActivityUnpinned(event.pinnedActivity.activity.id);
    }

    if (event is api.ActivityFeedbackEvent) {
      final payload = event.activityFeedback;
      final userId = payload.user.id;

      // Only process events for the current user
      if (userId != currentUserId) return;

      // Only handle hide action for now
      if (payload.action == api.ActivityFeedbackEventPayloadAction.hide) {
        return state.onActivityHidden(
          activityId: payload.activityId,
          hidden: payload.value == 'true',
        );
      }
    }

    if (event is api.ActivityMarkEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onActivityMarked(event.toModel());
    }

    if (event is api.ActivityReactionAddedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionAdded(activity, reaction);
    }

    if (event is api.ActivityReactionUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionUpdated(activity, reaction);
    }

    if (event is api.ActivityReactionDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return state.onReactionRemoved(activity, reaction);
    }

    if (event is api.BookmarkAddedEvent) {
      return state.onBookmarkAdded(event.bookmark.toModel());
    }

    if (event is api.BookmarkUpdatedEvent) {
      return state.onBookmarkUpdated(event.bookmark.toModel());
    }

    if (event is api.BookmarkDeletedEvent) {
      return state.onBookmarkRemoved(event.bookmark.toModel());
    }

    if (event is api.CommentAddedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onCommentAdded(event.comment.toModel());
    }

    if (event is api.CommentUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onCommentUpdated(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onCommentRemoved(event.comment.toModel());
    }

    if (event is api.CommentReactionAddedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionAdded(comment, reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionUpdated(comment, reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;

      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionRemoved(comment, reaction);
    }

    if (event is api.FeedDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFeedDeleted();
    }

    if (event is api.FeedUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFeedUpdated(event.feed.toModel());
    }

    if (event is api.FollowCreatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFollowAdded(event.follow.toModel());
    }

    if (event is api.FollowDeletedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFollowRemoved(event.follow.toModel());
    }

    if (event is api.FollowUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onFollowUpdated(event.follow.toModel());
    }

    // Member events are already handled in MemberListEventHandler
    if (event is api.FeedMemberRemovedEvent) return;
    if (event is api.FeedMemberUpdatedEvent) return;

    if (event is api.NotificationFeedUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onNotificationFeedUpdated(
        event.notificationStatus,
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
      );
    }

    if (event is api.StoriesFeedUpdatedEvent) {
      if (event.fid != query.fid.rawValue) return;
      return state.onStoriesFeedUpdated(
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
      );
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

    // Handle other events if necessary
  }
}
