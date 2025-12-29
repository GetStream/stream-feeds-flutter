import 'package:meta/meta.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/activity_pin_data.dart';
import '../../models/aggregated_activity_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/bookmark_folder_data.dart';
import '../../models/comment_data.dart';
import '../../models/feed_data.dart';
import '../../models/feed_member_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../../models/follow_data.dart';
import '../../models/mark_activity_data.dart';
import '../../models/model_updates.dart';
import '../../models/poll_data.dart';
import '../../models/poll_vote_data.dart';
import 'fid_scope.dart';

/// Represents an event that may trigger a state update.
///
/// These events are typically the result of receiving a WebSocket event or
/// having executed a successful API call that can modify the state.
@internal
sealed class StateUpdateEvent {
  const StateUpdateEvent();

  /// Creates a [StateUpdateEvent] from a [WsEvent].
  ///
  /// Maps WebSocket events to their corresponding state update events.
  /// Returns [UnknownStateUpdateEvent] for unhandled event types.
  factory StateUpdateEvent.fromWsEvent(WsEvent event) {
    // Activity Events
    if (event is api.ActivityAddedEvent) {
      final fid = FidScope.of(event.fid);
      final activity = event.activity.toModel();
      return ActivityAdded(scope: fid, activity: activity);
    }

    if (event is api.ActivityDeletedEvent) {
      final fid = FidScope.of(event.fid);
      final activityId = event.activity.id;
      return ActivityDeleted(scope: fid, activityId: activityId);
    }

    if (event is api.ActivityRemovedFromFeedEvent) {
      final fid = FidScope.of(event.fid);
      final activityId = event.activity.id;
      return ActivityRemovedFromFeed(scope: fid, activityId: activityId);
    }

    if (event is api.ActivityUpdatedEvent) {
      final fid = FidScope.of(event.fid);
      final activity = event.activity.toModel();
      return ActivityUpdated(scope: fid, activity: activity);
    }

    if (event is api.ActivityPinnedEvent) {
      final fid = FidScope.of(event.fid);
      final pinnedActivity = event.pinnedActivity.toModel();
      return ActivityPinned(scope: fid, pinnedActivity: pinnedActivity);
    }

    if (event is api.ActivityUnpinnedEvent) {
      final fid = FidScope.of(event.fid);
      final activityId = event.pinnedActivity.activity.id;
      return ActivityUnpinned(scope: fid, activityId: activityId);
    }

    if (event is api.ActivityFeedbackEvent) {
      final payload = event.activityFeedback;
      if (payload.action == api.ActivityFeedbackEventPayloadAction.hide) {
        final userId = payload.user.id;
        final activityId = payload.activityId;
        final hidden = payload.value == 'true';
        return ActivityHidden(
          userId: userId,
          activityId: activityId,
          hidden: hidden,
        );
      }

      return const UnknownStateUpdateEvent();
    }

    if (event is api.ActivityMarkEvent) {
      final fid = FidScope.of(event.fid);
      final markActivityData = event.toModel();
      return ActivityMarked(scope: fid, data: markActivityData);
    }

    // Activity Reaction Events
    if (event is api.ActivityReactionAddedEvent) {
      final fid = FidScope.of(event.fid);
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return ActivityReactionUpserted(
        scope: fid,
        activity: activity,
        reaction: reaction,
        enforceUnique: false,
      );
    }

    if (event is api.ActivityReactionDeletedEvent) {
      final fid = FidScope.of(event.fid);
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return ActivityReactionDeleted(
        scope: fid,
        activity: activity,
        reaction: reaction,
      );
    }

    if (event is api.ActivityReactionUpdatedEvent) {
      final fid = FidScope.of(event.fid);
      final activity = event.activity.toModel();
      final reaction = event.reaction.toModel();
      return ActivityReactionUpserted(
        scope: fid,
        activity: activity,
        reaction: reaction,
        enforceUnique: true,
      );
    }

    // Bookmark Events
    if (event is api.BookmarkAddedEvent) {
      final bookmark = event.bookmark.toModel();
      return BookmarkAdded(bookmark: bookmark);
    }

    if (event is api.BookmarkDeletedEvent) {
      final bookmark = event.bookmark.toModel();
      return BookmarkDeleted(bookmark: bookmark);
    }

    if (event is api.BookmarkUpdatedEvent) {
      final bookmark = event.bookmark.toModel();
      return BookmarkUpdated(bookmark: bookmark);
    }

    if (event is api.BookmarkFolderDeletedEvent) {
      final folderId = event.bookmarkFolder.id;
      return BookmarkFolderDeleted(folderId: folderId);
    }

    if (event is api.BookmarkFolderUpdatedEvent) {
      final folder = event.bookmarkFolder.toModel();
      return BookmarkFolderUpdated(folder: folder);
    }

    // Comment Events
    if (event is api.CommentAddedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      return CommentAdded(scope: fid, comment: comment);
    }

    if (event is api.CommentUpdatedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      return CommentUpdated(scope: fid, comment: comment);
    }

    if (event is api.CommentDeletedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      return CommentDeleted(scope: fid, comment: comment);
    }

    // Comment Reaction Events
    if (event is api.CommentReactionAddedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return CommentReactionUpserted(
        scope: fid,
        comment: comment,
        reaction: reaction,
        enforceUnique: false,
      );
    }

    if (event is api.CommentReactionDeletedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return CommentReactionDeleted(
        scope: fid,
        comment: comment,
        reaction: reaction,
      );
    }

    if (event is api.CommentReactionUpdatedEvent) {
      final fid = FidScope.of(event.fid);
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return CommentReactionUpserted(
        scope: fid,
        comment: comment,
        reaction: reaction,
        enforceUnique: true,
      );
    }

    // Feed Events
    if (event is api.FeedCreatedEvent) {
      final feed = event.feed.toModel();
      return FeedAdded(feed: feed);
    }

    if (event is api.FeedUpdatedEvent) {
      final feed = event.feed.toModel();
      return FeedUpdated(feed: feed);
    }

    if (event is api.FeedDeletedEvent) {
      final fid = event.fid;
      return FeedDeleted(fid: fid);
    }

    // Follow Events
    if (event is api.FollowCreatedEvent) {
      final follow = event.follow.toModel();
      return FollowAdded(follow: follow);
    }

    if (event is api.FollowUpdatedEvent) {
      final follow = event.follow.toModel();
      return FollowUpdated(follow: follow);
    }

    if (event is api.FollowDeletedEvent) {
      final follow = event.follow.toModel();
      return FollowDeleted(follow: follow);
    }

    // Special Feed Events
    if (event is api.NotificationFeedUpdatedEvent) {
      final fid = event.fid;
      final notificationStatus = event.notificationStatus;
      final aggregatedActivities = [
        ...?event.aggregatedActivities?.map((it) => it.toModel()),
      ];

      return NotificationFeedUpdated(
        fid: fid,
        notificationStatus: notificationStatus,
        aggregatedActivities: aggregatedActivities,
      );
    }

    if (event is api.StoriesFeedUpdatedEvent) {
      final fid = event.fid;
      final activities = [...?event.activities?.map((it) => it.toModel())];
      final aggregatedActivities = [
        ...?event.aggregatedActivities?.map((it) => it.toModel()),
      ];

      return StoriesFeedUpdated(
        fid: fid,
        activities: activities,
        aggregatedActivities: aggregatedActivities,
      );
    }

    // Feed Member Events
    if (event is api.FeedMemberAddedEvent) {
      final fid = event.fid;
      final member = event.member.toModel();
      return FeedMemberAdded(fid: fid, member: member);
    }

    if (event is api.FeedMemberRemovedEvent) {
      final fid = event.fid;
      final memberId = event.memberId;
      return FeedMemberRemoved(fid: fid, memberId: memberId);
    }

    if (event is api.FeedMemberUpdatedEvent) {
      final fid = event.fid;
      final member = event.member.toModel();
      return FeedMemberUpdated(fid: fid, member: member);
    }

    // Poll Events

    if (event is api.PollDeletedFeedEvent) {
      final pollId = event.poll.id;
      return PollDeleted(pollId: pollId);
    }

    if (event is api.PollClosedFeedEvent) {
      final poll = event.poll.toModel();
      return PollClosed(poll: poll);
    }

    if (event is api.PollUpdatedFeedEvent) {
      final poll = event.poll.toModel();
      return PollUpdated(poll: poll);
    }

    if (event is api.PollVoteCastedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return PollVoteCasted(poll: poll, vote: vote);
    }

    if (event is api.PollVoteChangedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return PollVoteChanged(poll: poll, vote: vote);
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      final poll = event.poll.toModel();
      final vote = event.pollVote.toModel();
      return PollVoteRemoved(poll: poll, vote: vote);
    }

    // Unknown event type
    return const UnknownStateUpdateEvent();
  }
}

// region Activity Events

/// An activity was added to a feed.
class ActivityAdded extends StateUpdateEvent {
  const ActivityAdded({
    required this.scope,
    required this.activity,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The activity that was added.
  final ActivityData activity;
}

/// An activity was deleted.
class ActivityDeleted extends StateUpdateEvent {
  const ActivityDeleted({
    required this.scope,
    required this.activityId,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The ID of the activity that was deleted.
  final String activityId;
}

/// An activity was removed from a specific feed.
class ActivityRemovedFromFeed extends StateUpdateEvent {
  const ActivityRemovedFromFeed({
    required this.scope,
    required this.activityId,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The ID of the activity that was removed.
  final String activityId;
}

/// An activity was updated.
class ActivityUpdated extends StateUpdateEvent {
  const ActivityUpdated({
    required this.scope,
    required this.activity,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The updated activity data.
  final ActivityData activity;
}

/// An activity was pinned to a feed.
class ActivityPinned extends StateUpdateEvent {
  const ActivityPinned({
    required this.scope,
    required this.pinnedActivity,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The pinned activity data.
  final ActivityPinData pinnedActivity;
}

/// An activity was unpinned from a feed.
class ActivityUnpinned extends StateUpdateEvent {
  const ActivityUnpinned({
    required this.scope,
    required this.activityId,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The ID of the activity that was unpinned.
  final String activityId;
}

/// An activity was hidden or unhidden by a user.
class ActivityHidden extends StateUpdateEvent {
  const ActivityHidden({
    required this.userId,
    required this.activityId,
    required this.hidden,
  });

  /// The ID of the user who performed the action.
  final String userId;

  /// The ID of the activity that was hidden or unhidden.
  final String activityId;

  /// Whether the activity is now hidden.
  final bool hidden;
}

/// An activity was marked as read, seen, or watched.
class ActivityMarked extends StateUpdateEvent {
  const ActivityMarked({
    required this.scope,
    required this.data,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The marked activity data.
  final MarkActivityData data;
}

// endregion

// region Activity Reaction Events

/// A reaction was deleted from an activity.
class ActivityReactionDeleted extends StateUpdateEvent {
  const ActivityReactionDeleted({
    required this.scope,
    required this.activity,
    required this.reaction,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The activity the reaction was deleted from.
  final ActivityData activity;

  /// The reaction that was deleted.
  final FeedsReactionData reaction;
}

/// A reaction was added or updated on an activity.
class ActivityReactionUpserted extends StateUpdateEvent {
  const ActivityReactionUpserted({
    required this.scope,
    required this.activity,
    required this.reaction,
    required this.enforceUnique,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The activity the reaction was added to or updated on.
  final ActivityData activity;

  /// The reaction that was added or updated.
  final FeedsReactionData reaction;

  /// Whether this reaction should be unique (replacing existing reactions of the same type).
  final bool enforceUnique;
}

// endregion

// region Bookmark Events

/// A bookmark was added.
class BookmarkAdded extends StateUpdateEvent {
  const BookmarkAdded({required this.bookmark});

  /// The bookmark that was added.
  final BookmarkData bookmark;
}

/// A bookmark was deleted.
class BookmarkDeleted extends StateUpdateEvent {
  const BookmarkDeleted({required this.bookmark});

  /// The bookmark that was deleted.
  final BookmarkData bookmark;
}

/// A bookmark was updated.
class BookmarkUpdated extends StateUpdateEvent {
  const BookmarkUpdated({required this.bookmark});

  /// The updated bookmark data.
  final BookmarkData bookmark;
}

/// A bookmark folder was deleted.
class BookmarkFolderDeleted extends StateUpdateEvent {
  const BookmarkFolderDeleted({required this.folderId});

  /// The ID of the folder that was deleted.
  final String folderId;
}

/// A bookmark folder was updated.
class BookmarkFolderUpdated extends StateUpdateEvent {
  const BookmarkFolderUpdated({required this.folder});

  /// The updated folder data.
  final BookmarkFolderData folder;
}

// endregion

// region Comment Events

/// A comment was added to an activity.
class CommentAdded extends StateUpdateEvent {
  const CommentAdded({
    required this.scope,
    required this.comment,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The comment that was added.
  final CommentData comment;
}

/// A comment was deleted.
class CommentDeleted extends StateUpdateEvent {
  const CommentDeleted({
    required this.scope,
    required this.comment,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The comment that was deleted.
  final CommentData comment;
}

/// A comment was updated.
class CommentUpdated extends StateUpdateEvent {
  const CommentUpdated({
    required this.scope,
    required this.comment,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The updated comment data.
  final CommentData comment;
}

// endregion

// region Comment Reaction Events

/// A reaction was deleted from a comment.
class CommentReactionDeleted extends StateUpdateEvent {
  const CommentReactionDeleted({
    required this.scope,
    required this.comment,
    required this.reaction,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The comment the reaction was deleted from.
  final CommentData comment;

  /// The reaction that was deleted.
  final FeedsReactionData reaction;
}

/// A reaction was added or updated on a comment.
class CommentReactionUpserted extends StateUpdateEvent {
  const CommentReactionUpserted({
    required this.scope,
    required this.comment,
    required this.reaction,
    required this.enforceUnique,
  });

  /// The feed scope this event applies to.
  final FidScope scope;

  /// The comment the reaction was added to or updated on.
  final CommentData comment;

  /// The reaction that was added or updated.
  final FeedsReactionData reaction;

  /// Whether this reaction should be unique (replacing existing reactions of the same type).
  final bool enforceUnique;
}

// endregion

// region Feed Events

/// A feed was created.
class FeedAdded extends StateUpdateEvent {
  const FeedAdded({required this.feed});

  /// The feed that was created.
  final FeedData feed;
}

/// A feed was deleted.
class FeedDeleted extends StateUpdateEvent {
  const FeedDeleted({required this.fid});

  /// The ID of the feed that was deleted.
  final String fid;
}

/// A feed was updated.
class FeedUpdated extends StateUpdateEvent {
  const FeedUpdated({required this.feed});

  /// The updated feed data.
  final FeedData feed;
}

// endregion

// region Feed Member Events

/// A member was added to a feed.
class FeedMemberAdded extends StateUpdateEvent {
  const FeedMemberAdded({
    required this.fid,
    required this.member,
  });

  /// The ID of the feed the member was added to.
  final String fid;

  /// The member that was added.
  final FeedMemberData member;
}

/// A member was removed from a feed.
class FeedMemberRemoved extends StateUpdateEvent {
  const FeedMemberRemoved({
    required this.fid,
    required this.memberId,
  });

  /// The ID of the feed the member was removed from.
  final String fid;

  /// The ID of the member that was removed.
  final String memberId;
}

/// A feed member was updated.
class FeedMemberUpdated extends StateUpdateEvent {
  const FeedMemberUpdated({
    required this.fid,
    required this.member,
  });

  /// The ID of the feed containing the updated member.
  final String fid;

  /// The updated member data.
  final FeedMemberData member;
}

/// Multiple feed members were updated in a batch.
class FeedMemberBatchUpdate extends StateUpdateEvent {
  const FeedMemberBatchUpdate({
    required this.fid,
    required this.updates,
  });

  /// The ID of the feed containing the updated members.
  final String fid;

  /// The batch updates to apply.
  final ModelUpdates<FeedMemberData> updates;
}

// endregion

// region Follow Events

/// A follow relationship was created.
class FollowAdded extends StateUpdateEvent {
  const FollowAdded({required this.follow});

  /// The follow relationship that was created.
  final FollowData follow;
}

/// A follow relationship was deleted.
class FollowDeleted extends StateUpdateEvent {
  const FollowDeleted({required this.follow});

  /// The follow relationship that was deleted.
  final FollowData follow;
}

/// A follow relationship was updated.
class FollowUpdated extends StateUpdateEvent {
  const FollowUpdated({required this.follow});

  /// The updated follow relationship.
  final FollowData follow;
}

// endregion

// region Special Feed Events

/// A notification feed was updated with new aggregated activities.
class NotificationFeedUpdated extends StateUpdateEvent {
  const NotificationFeedUpdated({
    required this.fid,
    required this.notificationStatus,
    required this.aggregatedActivities,
  });

  /// The ID of the notification feed that was updated.
  final String fid;

  /// The updated notification status.
  final api.NotificationStatusResponse? notificationStatus;

  /// The new aggregated activities.
  final List<AggregatedActivityData> aggregatedActivities;
}

/// A stories feed was updated with new activities.
class StoriesFeedUpdated extends StateUpdateEvent {
  const StoriesFeedUpdated({
    required this.fid,
    required this.activities,
    required this.aggregatedActivities,
  });

  /// The ID of the stories feed that was updated.
  final String fid;

  /// The new activities.
  final List<ActivityData> activities;

  /// The new aggregated activities.
  final List<AggregatedActivityData> aggregatedActivities;
}

// endregion

// region Poll Events

/// A poll was deleted.
class PollDeleted extends StateUpdateEvent {
  const PollDeleted({required this.pollId});

  /// The ID of the poll that was deleted.
  final String pollId;
}

/// A poll was closed.
class PollClosed extends StateUpdateEvent {
  const PollClosed({required this.poll});

  /// The closed poll data.
  final PollData poll;
}

/// A poll was updated or closed.
class PollUpdated extends StateUpdateEvent {
  const PollUpdated({required this.poll});

  /// The updated poll data.
  final PollData poll;
}

/// A vote was removed from a poll.
class PollVoteRemoved extends StateUpdateEvent {
  const PollVoteRemoved({
    required this.poll,
    required this.vote,
  });

  /// The poll the vote was removed from.
  final PollData poll;

  /// The vote that was removed.
  final PollVoteData vote;
}

/// A vote was cast on a poll.
class PollVoteCasted extends StateUpdateEvent {
  const PollVoteCasted({
    required this.poll,
    required this.vote,
  });

  /// The poll the vote was cast on.
  final PollData poll;

  /// The vote that was cast.
  final PollVoteData vote;
}

/// A vote was changed on a poll.
class PollVoteChanged extends StateUpdateEvent {
  const PollVoteChanged({
    required this.poll,
    required this.vote,
  });

  /// The poll the vote was changed on.
  final PollData poll;

  /// The updated vote data.
  final PollVoteData vote;
}

// endregion

/// An unknown state update event.
class UnknownStateUpdateEvent extends StateUpdateEvent {
  const UnknownStateUpdateEvent();
}
