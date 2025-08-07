// ignore_for_file: public_member_api_docs, use_string_in_part_of_directives, prefer_single_quotes, require_trailing_commas

// coverage:ignore-file

import '../models.dart';

sealed class WSClientEvent {
  const WSClientEvent();

  // String get connectionId;

  static WSClientEvent fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case "app.updated":
        return WSClientEventAppUpdatedEvent.fromJson(json);
      case "feeds.activity.added":
        return WSClientEventActivityAddedEvent.fromJson(json);
      case "feeds.activity.deleted":
        return WSClientEventActivityDeletedEvent.fromJson(json);
      case "feeds.activity.marked":
        return WSClientEventActivityMarkEvent.fromJson(json);
      case "feeds.activity.pinned":
        return WSClientEventActivityPinnedEvent.fromJson(json);
      case "feeds.activity.reaction.added":
        return WSClientEventActivityReactionAddedEvent.fromJson(json);
      case "feeds.activity.reaction.deleted":
        return WSClientEventActivityReactionDeletedEvent.fromJson(json);
      case "feeds.activity.reaction.updated":
        return WSClientEventActivityReactionUpdatedEvent.fromJson(json);
      case "feeds.activity.removed_from_feed":
        return WSClientEventActivityRemovedFromFeedEvent.fromJson(json);
      case "feeds.activity.unpinned":
        return WSClientEventActivityUnpinnedEvent.fromJson(json);
      case "feeds.activity.updated":
        return WSClientEventActivityUpdatedEvent.fromJson(json);
      case "feeds.bookmark.added":
        return WSClientEventBookmarkAddedEvent.fromJson(json);
      case "feeds.bookmark.deleted":
        return WSClientEventBookmarkDeletedEvent.fromJson(json);
      case "feeds.bookmark.updated":
        return WSClientEventBookmarkUpdatedEvent.fromJson(json);
      case "feeds.bookmark_folder.deleted":
        return WSClientEventBookmarkFolderDeletedEvent.fromJson(json);
      case "feeds.bookmark_folder.updated":
        return WSClientEventBookmarkFolderUpdatedEvent.fromJson(json);
      case "feeds.comment.added":
        return WSClientEventCommentAddedEvent.fromJson(json);
      case "feeds.comment.deleted":
        return WSClientEventCommentDeletedEvent.fromJson(json);
      case "feeds.comment.reaction.added":
        return WSClientEventCommentReactionAddedEvent.fromJson(json);
      case "feeds.comment.reaction.deleted":
        return WSClientEventCommentReactionDeletedEvent.fromJson(json);
      case "feeds.comment.reaction.updated":
        return WSClientEventCommentReactionUpdatedEvent.fromJson(json);
      case "feeds.comment.updated":
        return WSClientEventCommentUpdatedEvent.fromJson(json);
      case "feeds.feed.created":
        return WSClientEventFeedCreatedEvent.fromJson(json);
      case "feeds.feed.deleted":
        return WSClientEventFeedDeletedEvent.fromJson(json);
      case "feeds.feed.updated":
        return WSClientEventFeedUpdatedEvent.fromJson(json);
      case "feeds.feed_group.changed":
        return WSClientEventFeedGroupChangedEvent.fromJson(json);
      case "feeds.feed_group.deleted":
        return WSClientEventFeedGroupDeletedEvent.fromJson(json);
      case "feeds.feed_member.added":
        return WSClientEventFeedMemberAddedEvent.fromJson(json);
      case "feeds.feed_member.removed":
        return WSClientEventFeedMemberRemovedEvent.fromJson(json);
      case "feeds.feed_member.updated":
        return WSClientEventFeedMemberUpdatedEvent.fromJson(json);
      case "feeds.follow.created":
        return WSClientEventFollowCreatedEvent.fromJson(json);
      case "feeds.follow.deleted":
        return WSClientEventFollowDeletedEvent.fromJson(json);
      case "feeds.follow.updated":
        return WSClientEventFollowUpdatedEvent.fromJson(json);
      case "feeds.notification_feed.updated":
        return WSClientEventNotificationFeedUpdatedEvent.fromJson(json);
      case "feeds.poll.closed":
        return WSClientEventPollClosedFeedEvent.fromJson(json);
      case "feeds.poll.deleted":
        return WSClientEventPollDeletedFeedEvent.fromJson(json);
      case "feeds.poll.updated":
        return WSClientEventPollUpdatedFeedEvent.fromJson(json);
      case "feeds.poll.vote_casted":
        return WSClientEventPollVoteCastedFeedEvent.fromJson(json);
      case "feeds.poll.vote_changed":
        return WSClientEventPollVoteChangedFeedEvent.fromJson(json);
      case "feeds.poll.vote_removed":
        return WSClientEventPollVoteRemovedFeedEvent.fromJson(json);
      case "health.check":
        return WSClientEventHealthCheckEvent.fromJson(json);
      case "user.updated":
        return WSClientEventUserUpdatedEvent.fromJson(json);
      default:
        throw Exception('Unknown video event type: ${json['type']}');
    }
  }
}

class WSClientEventAppUpdatedEvent extends WSClientEvent {
  const WSClientEventAppUpdatedEvent(this.appUpdatedEvent);

  factory WSClientEventAppUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventAppUpdatedEvent(
      AppUpdatedEvent.fromJson(json),
    );
  }

  final AppUpdatedEvent appUpdatedEvent;
}

class WSClientEventActivityAddedEvent extends WSClientEvent {
  const WSClientEventActivityAddedEvent(this.activityAddedEvent);

  factory WSClientEventActivityAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventActivityAddedEvent(
      ActivityAddedEvent.fromJson(json),
    );
  }

  final ActivityAddedEvent activityAddedEvent;
}

class WSClientEventActivityDeletedEvent extends WSClientEvent {
  const WSClientEventActivityDeletedEvent(this.activityDeletedEvent);

  factory WSClientEventActivityDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityDeletedEvent(
      ActivityDeletedEvent.fromJson(json),
    );
  }

  final ActivityDeletedEvent activityDeletedEvent;
}

class WSClientEventActivityMarkEvent extends WSClientEvent {
  const WSClientEventActivityMarkEvent(this.activityMarkEvent);

  factory WSClientEventActivityMarkEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventActivityMarkEvent(
      ActivityMarkEvent.fromJson(json),
    );
  }

  final ActivityMarkEvent activityMarkEvent;
}

class WSClientEventActivityPinnedEvent extends WSClientEvent {
  const WSClientEventActivityPinnedEvent(this.activityPinnedEvent);

  factory WSClientEventActivityPinnedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventActivityPinnedEvent(
      ActivityPinnedEvent.fromJson(json),
    );
  }

  final ActivityPinnedEvent activityPinnedEvent;
}

class WSClientEventActivityReactionAddedEvent extends WSClientEvent {
  const WSClientEventActivityReactionAddedEvent(
      this.activityReactionAddedEvent);

  factory WSClientEventActivityReactionAddedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityReactionAddedEvent(
      ActivityReactionAddedEvent.fromJson(json),
    );
  }

  final ActivityReactionAddedEvent activityReactionAddedEvent;
}

class WSClientEventActivityReactionDeletedEvent extends WSClientEvent {
  const WSClientEventActivityReactionDeletedEvent(
      this.activityReactionDeletedEvent);

  factory WSClientEventActivityReactionDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityReactionDeletedEvent(
      ActivityReactionDeletedEvent.fromJson(json),
    );
  }

  final ActivityReactionDeletedEvent activityReactionDeletedEvent;
}

class WSClientEventActivityReactionUpdatedEvent extends WSClientEvent {
  const WSClientEventActivityReactionUpdatedEvent(
      this.activityReactionUpdatedEvent);

  factory WSClientEventActivityReactionUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityReactionUpdatedEvent(
      ActivityReactionUpdatedEvent.fromJson(json),
    );
  }

  final ActivityReactionUpdatedEvent activityReactionUpdatedEvent;
}

class WSClientEventActivityRemovedFromFeedEvent extends WSClientEvent {
  const WSClientEventActivityRemovedFromFeedEvent(
      this.activityRemovedFromFeedEvent);

  factory WSClientEventActivityRemovedFromFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityRemovedFromFeedEvent(
      ActivityRemovedFromFeedEvent.fromJson(json),
    );
  }

  final ActivityRemovedFromFeedEvent activityRemovedFromFeedEvent;
}

class WSClientEventActivityUnpinnedEvent extends WSClientEvent {
  const WSClientEventActivityUnpinnedEvent(this.activityUnpinnedEvent);

  factory WSClientEventActivityUnpinnedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityUnpinnedEvent(
      ActivityUnpinnedEvent.fromJson(json),
    );
  }

  final ActivityUnpinnedEvent activityUnpinnedEvent;
}

class WSClientEventActivityUpdatedEvent extends WSClientEvent {
  const WSClientEventActivityUpdatedEvent(this.activityUpdatedEvent);

  factory WSClientEventActivityUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventActivityUpdatedEvent(
      ActivityUpdatedEvent.fromJson(json),
    );
  }

  final ActivityUpdatedEvent activityUpdatedEvent;
}

class WSClientEventBookmarkAddedEvent extends WSClientEvent {
  const WSClientEventBookmarkAddedEvent(this.bookmarkAddedEvent);

  factory WSClientEventBookmarkAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventBookmarkAddedEvent(
      BookmarkAddedEvent.fromJson(json),
    );
  }

  final BookmarkAddedEvent bookmarkAddedEvent;
}

class WSClientEventBookmarkDeletedEvent extends WSClientEvent {
  const WSClientEventBookmarkDeletedEvent(this.bookmarkDeletedEvent);

  factory WSClientEventBookmarkDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventBookmarkDeletedEvent(
      BookmarkDeletedEvent.fromJson(json),
    );
  }

  final BookmarkDeletedEvent bookmarkDeletedEvent;
}

class WSClientEventBookmarkUpdatedEvent extends WSClientEvent {
  const WSClientEventBookmarkUpdatedEvent(this.bookmarkUpdatedEvent);

  factory WSClientEventBookmarkUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventBookmarkUpdatedEvent(
      BookmarkUpdatedEvent.fromJson(json),
    );
  }

  final BookmarkUpdatedEvent bookmarkUpdatedEvent;
}

class WSClientEventBookmarkFolderDeletedEvent extends WSClientEvent {
  const WSClientEventBookmarkFolderDeletedEvent(
      this.bookmarkFolderDeletedEvent);

  factory WSClientEventBookmarkFolderDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventBookmarkFolderDeletedEvent(
      BookmarkFolderDeletedEvent.fromJson(json),
    );
  }

  final BookmarkFolderDeletedEvent bookmarkFolderDeletedEvent;
}

class WSClientEventBookmarkFolderUpdatedEvent extends WSClientEvent {
  const WSClientEventBookmarkFolderUpdatedEvent(
      this.bookmarkFolderUpdatedEvent);

  factory WSClientEventBookmarkFolderUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventBookmarkFolderUpdatedEvent(
      BookmarkFolderUpdatedEvent.fromJson(json),
    );
  }

  final BookmarkFolderUpdatedEvent bookmarkFolderUpdatedEvent;
}

class WSClientEventCommentAddedEvent extends WSClientEvent {
  const WSClientEventCommentAddedEvent(this.commentAddedEvent);

  factory WSClientEventCommentAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventCommentAddedEvent(
      CommentAddedEvent.fromJson(json),
    );
  }

  final CommentAddedEvent commentAddedEvent;
}

class WSClientEventCommentDeletedEvent extends WSClientEvent {
  const WSClientEventCommentDeletedEvent(this.commentDeletedEvent);

  factory WSClientEventCommentDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventCommentDeletedEvent(
      CommentDeletedEvent.fromJson(json),
    );
  }

  final CommentDeletedEvent commentDeletedEvent;
}

class WSClientEventCommentReactionAddedEvent extends WSClientEvent {
  const WSClientEventCommentReactionAddedEvent(this.commentReactionAddedEvent);

  factory WSClientEventCommentReactionAddedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventCommentReactionAddedEvent(
      CommentReactionAddedEvent.fromJson(json),
    );
  }

  final CommentReactionAddedEvent commentReactionAddedEvent;
}

class WSClientEventCommentReactionDeletedEvent extends WSClientEvent {
  const WSClientEventCommentReactionDeletedEvent(
      this.commentReactionDeletedEvent);

  factory WSClientEventCommentReactionDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventCommentReactionDeletedEvent(
      CommentReactionDeletedEvent.fromJson(json),
    );
  }

  final CommentReactionDeletedEvent commentReactionDeletedEvent;
}

class WSClientEventCommentReactionUpdatedEvent extends WSClientEvent {
  const WSClientEventCommentReactionUpdatedEvent(
      this.commentReactionUpdatedEvent);

  factory WSClientEventCommentReactionUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventCommentReactionUpdatedEvent(
      CommentReactionUpdatedEvent.fromJson(json),
    );
  }

  final CommentReactionUpdatedEvent commentReactionUpdatedEvent;
}

class WSClientEventCommentUpdatedEvent extends WSClientEvent {
  const WSClientEventCommentUpdatedEvent(this.commentUpdatedEvent);

  factory WSClientEventCommentUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventCommentUpdatedEvent(
      CommentUpdatedEvent.fromJson(json),
    );
  }

  final CommentUpdatedEvent commentUpdatedEvent;
}

class WSClientEventFeedCreatedEvent extends WSClientEvent {
  const WSClientEventFeedCreatedEvent(this.feedCreatedEvent);

  factory WSClientEventFeedCreatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFeedCreatedEvent(
      FeedCreatedEvent.fromJson(json),
    );
  }

  final FeedCreatedEvent feedCreatedEvent;
}

class WSClientEventFeedDeletedEvent extends WSClientEvent {
  const WSClientEventFeedDeletedEvent(this.feedDeletedEvent);

  factory WSClientEventFeedDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFeedDeletedEvent(
      FeedDeletedEvent.fromJson(json),
    );
  }

  final FeedDeletedEvent feedDeletedEvent;
}

class WSClientEventFeedUpdatedEvent extends WSClientEvent {
  const WSClientEventFeedUpdatedEvent(this.feedUpdatedEvent);

  factory WSClientEventFeedUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFeedUpdatedEvent(
      FeedUpdatedEvent.fromJson(json),
    );
  }

  final FeedUpdatedEvent feedUpdatedEvent;
}

class WSClientEventFeedGroupChangedEvent extends WSClientEvent {
  const WSClientEventFeedGroupChangedEvent(this.feedGroupChangedEvent);

  factory WSClientEventFeedGroupChangedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventFeedGroupChangedEvent(
      FeedGroupChangedEvent.fromJson(json),
    );
  }

  final FeedGroupChangedEvent feedGroupChangedEvent;
}

class WSClientEventFeedGroupDeletedEvent extends WSClientEvent {
  const WSClientEventFeedGroupDeletedEvent(this.feedGroupDeletedEvent);

  factory WSClientEventFeedGroupDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventFeedGroupDeletedEvent(
      FeedGroupDeletedEvent.fromJson(json),
    );
  }

  final FeedGroupDeletedEvent feedGroupDeletedEvent;
}

class WSClientEventFeedMemberAddedEvent extends WSClientEvent {
  const WSClientEventFeedMemberAddedEvent(this.feedMemberAddedEvent);

  factory WSClientEventFeedMemberAddedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventFeedMemberAddedEvent(
      FeedMemberAddedEvent.fromJson(json),
    );
  }

  final FeedMemberAddedEvent feedMemberAddedEvent;
}

class WSClientEventFeedMemberRemovedEvent extends WSClientEvent {
  const WSClientEventFeedMemberRemovedEvent(this.feedMemberRemovedEvent);

  factory WSClientEventFeedMemberRemovedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventFeedMemberRemovedEvent(
      FeedMemberRemovedEvent.fromJson(json),
    );
  }

  final FeedMemberRemovedEvent feedMemberRemovedEvent;
}

class WSClientEventFeedMemberUpdatedEvent extends WSClientEvent {
  const WSClientEventFeedMemberUpdatedEvent(this.feedMemberUpdatedEvent);

  factory WSClientEventFeedMemberUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventFeedMemberUpdatedEvent(
      FeedMemberUpdatedEvent.fromJson(json),
    );
  }

  final FeedMemberUpdatedEvent feedMemberUpdatedEvent;
}

class WSClientEventFollowCreatedEvent extends WSClientEvent {
  const WSClientEventFollowCreatedEvent(this.followCreatedEvent);

  factory WSClientEventFollowCreatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFollowCreatedEvent(
      FollowCreatedEvent.fromJson(json),
    );
  }

  final FollowCreatedEvent followCreatedEvent;
}

class WSClientEventFollowDeletedEvent extends WSClientEvent {
  const WSClientEventFollowDeletedEvent(this.followDeletedEvent);

  factory WSClientEventFollowDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFollowDeletedEvent(
      FollowDeletedEvent.fromJson(json),
    );
  }

  final FollowDeletedEvent followDeletedEvent;
}

class WSClientEventFollowUpdatedEvent extends WSClientEvent {
  const WSClientEventFollowUpdatedEvent(this.followUpdatedEvent);

  factory WSClientEventFollowUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventFollowUpdatedEvent(
      FollowUpdatedEvent.fromJson(json),
    );
  }

  final FollowUpdatedEvent followUpdatedEvent;
}

class WSClientEventNotificationFeedUpdatedEvent extends WSClientEvent {
  const WSClientEventNotificationFeedUpdatedEvent(
      this.notificationFeedUpdatedEvent);

  factory WSClientEventNotificationFeedUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventNotificationFeedUpdatedEvent(
      NotificationFeedUpdatedEvent.fromJson(json),
    );
  }

  final NotificationFeedUpdatedEvent notificationFeedUpdatedEvent;
}

class WSClientEventPollClosedFeedEvent extends WSClientEvent {
  const WSClientEventPollClosedFeedEvent(this.pollClosedFeedEvent);

  factory WSClientEventPollClosedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventPollClosedFeedEvent(
      PollClosedFeedEvent.fromJson(json),
    );
  }

  final PollClosedFeedEvent pollClosedFeedEvent;
}

class WSClientEventPollDeletedFeedEvent extends WSClientEvent {
  const WSClientEventPollDeletedFeedEvent(this.pollDeletedFeedEvent);

  factory WSClientEventPollDeletedFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventPollDeletedFeedEvent(
      PollDeletedFeedEvent.fromJson(json),
    );
  }

  final PollDeletedFeedEvent pollDeletedFeedEvent;
}

class WSClientEventPollUpdatedFeedEvent extends WSClientEvent {
  const WSClientEventPollUpdatedFeedEvent(this.pollUpdatedFeedEvent);

  factory WSClientEventPollUpdatedFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventPollUpdatedFeedEvent(
      PollUpdatedFeedEvent.fromJson(json),
    );
  }

  final PollUpdatedFeedEvent pollUpdatedFeedEvent;
}

class WSClientEventPollVoteCastedFeedEvent extends WSClientEvent {
  const WSClientEventPollVoteCastedFeedEvent(this.pollVoteCastedFeedEvent);

  factory WSClientEventPollVoteCastedFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventPollVoteCastedFeedEvent(
      PollVoteCastedFeedEvent.fromJson(json),
    );
  }

  final PollVoteCastedFeedEvent pollVoteCastedFeedEvent;
}

class WSClientEventPollVoteChangedFeedEvent extends WSClientEvent {
  const WSClientEventPollVoteChangedFeedEvent(this.pollVoteChangedFeedEvent);

  factory WSClientEventPollVoteChangedFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventPollVoteChangedFeedEvent(
      PollVoteChangedFeedEvent.fromJson(json),
    );
  }

  final PollVoteChangedFeedEvent pollVoteChangedFeedEvent;
}

class WSClientEventPollVoteRemovedFeedEvent extends WSClientEvent {
  const WSClientEventPollVoteRemovedFeedEvent(this.pollVoteRemovedFeedEvent);

  factory WSClientEventPollVoteRemovedFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSClientEventPollVoteRemovedFeedEvent(
      PollVoteRemovedFeedEvent.fromJson(json),
    );
  }

  final PollVoteRemovedFeedEvent pollVoteRemovedFeedEvent;
}

class WSClientEventHealthCheckEvent extends WSClientEvent {
  const WSClientEventHealthCheckEvent(this.healthCheckEvent);

  factory WSClientEventHealthCheckEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventHealthCheckEvent(
      HealthCheckEvent.fromJson(json),
    );
  }

  final HealthCheckEvent healthCheckEvent;
}

class WSClientEventUserUpdatedEvent extends WSClientEvent {
  const WSClientEventUserUpdatedEvent(this.userUpdatedEvent);

  factory WSClientEventUserUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSClientEventUserUpdatedEvent(
      UserUpdatedEvent.fromJson(json),
    );
  }

  final UserUpdatedEvent userUpdatedEvent;
}
