// ignore_for_file: public_member_api_docs, use_string_in_part_of_directives, prefer_single_quotes, require_trailing_commas

import '../models.dart';

sealed class WSEvent {
  const WSEvent();

  static WSEvent fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case "app.updated":
        return WSEventAppUpdatedEvent.fromJson(json);
      case "feeds.activity.added":
        return WSEventActivityAddedEvent.fromJson(json);
      case "feeds.activity.deleted":
        return WSEventActivityDeletedEvent.fromJson(json);
      case "feeds.activity.marked":
        return WSEventActivityMarkEvent.fromJson(json);
      case "feeds.activity.pinned":
        return WSEventActivityPinnedEvent.fromJson(json);
      case "feeds.activity.reaction.added":
        return WSEventActivityReactionAddedEvent.fromJson(json);
      case "feeds.activity.reaction.deleted":
        return WSEventActivityReactionDeletedEvent.fromJson(json);
      case "feeds.activity.reaction.updated":
        return WSEventActivityReactionUpdatedEvent.fromJson(json);
      case "feeds.activity.removed_from_feed":
        return WSEventActivityRemovedFromFeedEvent.fromJson(json);
      case "feeds.activity.unpinned":
        return WSEventActivityUnpinnedEvent.fromJson(json);
      case "feeds.activity.updated":
        return WSEventActivityUpdatedEvent.fromJson(json);
      case "feeds.bookmark.added":
        return WSEventBookmarkAddedEvent.fromJson(json);
      case "feeds.bookmark.deleted":
        return WSEventBookmarkDeletedEvent.fromJson(json);
      case "feeds.bookmark.updated":
        return WSEventBookmarkUpdatedEvent.fromJson(json);
      case "feeds.bookmark_folder.deleted":
        return WSEventBookmarkFolderDeletedEvent.fromJson(json);
      case "feeds.bookmark_folder.updated":
        return WSEventBookmarkFolderUpdatedEvent.fromJson(json);
      case "feeds.comment.added":
        return WSEventCommentAddedEvent.fromJson(json);
      case "feeds.comment.deleted":
        return WSEventCommentDeletedEvent.fromJson(json);
      case "feeds.comment.reaction.added":
        return WSEventCommentReactionAddedEvent.fromJson(json);
      case "feeds.comment.reaction.deleted":
        return WSEventCommentReactionDeletedEvent.fromJson(json);
      case "feeds.comment.reaction.updated":
        return WSEventCommentReactionUpdatedEvent.fromJson(json);
      case "feeds.comment.updated":
        return WSEventCommentUpdatedEvent.fromJson(json);
      case "feeds.feed.created":
        return WSEventFeedCreatedEvent.fromJson(json);
      case "feeds.feed.deleted":
        return WSEventFeedDeletedEvent.fromJson(json);
      case "feeds.feed.updated":
        return WSEventFeedUpdatedEvent.fromJson(json);
      case "feeds.feed_group.changed":
        return WSEventFeedGroupChangedEvent.fromJson(json);
      case "feeds.feed_group.deleted":
        return WSEventFeedGroupDeletedEvent.fromJson(json);
      case "feeds.feed_member.added":
        return WSEventFeedMemberAddedEvent.fromJson(json);
      case "feeds.feed_member.removed":
        return WSEventFeedMemberRemovedEvent.fromJson(json);
      case "feeds.feed_member.updated":
        return WSEventFeedMemberUpdatedEvent.fromJson(json);
      case "feeds.follow.created":
        return WSEventFollowCreatedEvent.fromJson(json);
      case "feeds.follow.deleted":
        return WSEventFollowDeletedEvent.fromJson(json);
      case "feeds.follow.updated":
        return WSEventFollowUpdatedEvent.fromJson(json);
      case "feeds.notification_feed.updated":
        return WSEventNotificationFeedUpdatedEvent.fromJson(json);
      case "feeds.poll.closed":
        return WSEventPollClosedFeedEvent.fromJson(json);
      case "feeds.poll.deleted":
        return WSEventPollDeletedFeedEvent.fromJson(json);
      case "feeds.poll.updated":
        return WSEventPollUpdatedFeedEvent.fromJson(json);
      case "feeds.poll.vote_casted":
        return WSEventPollVoteCastedFeedEvent.fromJson(json);
      case "feeds.poll.vote_changed":
        return WSEventPollVoteChangedFeedEvent.fromJson(json);
      case "feeds.poll.vote_removed":
        return WSEventPollVoteRemovedFeedEvent.fromJson(json);
      case "health.check":
        return WSEventHealthCheckEvent.fromJson(json);
      case "user.banned":
        return WSEventUserBannedEvent.fromJson(json);
      case "user.deactivated":
        return WSEventUserDeactivatedEvent.fromJson(json);
      case "user.muted":
        return WSEventUserMutedEvent.fromJson(json);
      case "user.reactivated":
        return WSEventUserReactivatedEvent.fromJson(json);
      case "user.updated":
        return WSEventUserUpdatedEvent.fromJson(json);
      default:
        throw Exception('Unknown video event type: ${json['type']}');
    }
  }
}

class WSEventAppUpdatedEvent extends WSEvent {
  const WSEventAppUpdatedEvent(this.appUpdatedEvent);

  factory WSEventAppUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventAppUpdatedEvent(AppUpdatedEvent.fromJson(json)!);
  }

  final AppUpdatedEvent appUpdatedEvent;
}

class WSEventActivityAddedEvent extends WSEvent {
  const WSEventActivityAddedEvent(this.activityAddedEvent);

  factory WSEventActivityAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityAddedEvent(ActivityAddedEvent.fromJson(json)!);
  }

  final ActivityAddedEvent activityAddedEvent;
}

class WSEventActivityDeletedEvent extends WSEvent {
  const WSEventActivityDeletedEvent(this.activityDeletedEvent);

  factory WSEventActivityDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityDeletedEvent(ActivityDeletedEvent.fromJson(json)!);
  }

  final ActivityDeletedEvent activityDeletedEvent;
}

class WSEventActivityMarkEvent extends WSEvent {
  const WSEventActivityMarkEvent(this.activityMarkEvent);

  factory WSEventActivityMarkEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityMarkEvent(ActivityMarkEvent.fromJson(json)!);
  }

  final ActivityMarkEvent activityMarkEvent;
}

class WSEventActivityPinnedEvent extends WSEvent {
  const WSEventActivityPinnedEvent(this.activityPinnedEvent);

  factory WSEventActivityPinnedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityPinnedEvent(ActivityPinnedEvent.fromJson(json)!);
  }

  final ActivityPinnedEvent activityPinnedEvent;
}

class WSEventActivityReactionAddedEvent extends WSEvent {
  const WSEventActivityReactionAddedEvent(this.activityReactionAddedEvent);

  factory WSEventActivityReactionAddedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventActivityReactionAddedEvent(
        ActivityReactionAddedEvent.fromJson(json)!);
  }

  final ActivityReactionAddedEvent activityReactionAddedEvent;
}

class WSEventActivityReactionDeletedEvent extends WSEvent {
  const WSEventActivityReactionDeletedEvent(this.activityReactionDeletedEvent);

  factory WSEventActivityReactionDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventActivityReactionDeletedEvent(
        ActivityReactionDeletedEvent.fromJson(json)!);
  }

  final ActivityReactionDeletedEvent activityReactionDeletedEvent;
}

class WSEventActivityReactionUpdatedEvent extends WSEvent {
  const WSEventActivityReactionUpdatedEvent(this.activityReactionUpdatedEvent);

  factory WSEventActivityReactionUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventActivityReactionUpdatedEvent(
        ActivityReactionUpdatedEvent.fromJson(json)!);
  }

  final ActivityReactionUpdatedEvent activityReactionUpdatedEvent;
}

class WSEventActivityRemovedFromFeedEvent extends WSEvent {
  const WSEventActivityRemovedFromFeedEvent(this.activityRemovedFromFeedEvent);

  factory WSEventActivityRemovedFromFeedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventActivityRemovedFromFeedEvent(
        ActivityRemovedFromFeedEvent.fromJson(json)!);
  }

  final ActivityRemovedFromFeedEvent activityRemovedFromFeedEvent;
}

class WSEventActivityUnpinnedEvent extends WSEvent {
  const WSEventActivityUnpinnedEvent(this.activityUnpinnedEvent);

  factory WSEventActivityUnpinnedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityUnpinnedEvent(ActivityUnpinnedEvent.fromJson(json)!);
  }

  final ActivityUnpinnedEvent activityUnpinnedEvent;
}

class WSEventActivityUpdatedEvent extends WSEvent {
  const WSEventActivityUpdatedEvent(this.activityUpdatedEvent);

  factory WSEventActivityUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventActivityUpdatedEvent(ActivityUpdatedEvent.fromJson(json)!);
  }

  final ActivityUpdatedEvent activityUpdatedEvent;
}

class WSEventBookmarkAddedEvent extends WSEvent {
  const WSEventBookmarkAddedEvent(this.bookmarkAddedEvent);

  factory WSEventBookmarkAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventBookmarkAddedEvent(BookmarkAddedEvent.fromJson(json)!);
  }

  final BookmarkAddedEvent bookmarkAddedEvent;
}

class WSEventBookmarkDeletedEvent extends WSEvent {
  const WSEventBookmarkDeletedEvent(this.bookmarkDeletedEvent);

  factory WSEventBookmarkDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventBookmarkDeletedEvent(BookmarkDeletedEvent.fromJson(json)!);
  }

  final BookmarkDeletedEvent bookmarkDeletedEvent;
}

class WSEventBookmarkUpdatedEvent extends WSEvent {
  const WSEventBookmarkUpdatedEvent(this.bookmarkUpdatedEvent);

  factory WSEventBookmarkUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventBookmarkUpdatedEvent(BookmarkUpdatedEvent.fromJson(json)!);
  }

  final BookmarkUpdatedEvent bookmarkUpdatedEvent;
}

class WSEventBookmarkFolderDeletedEvent extends WSEvent {
  const WSEventBookmarkFolderDeletedEvent(this.bookmarkFolderDeletedEvent);

  factory WSEventBookmarkFolderDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventBookmarkFolderDeletedEvent(
        BookmarkFolderDeletedEvent.fromJson(json)!);
  }

  final BookmarkFolderDeletedEvent bookmarkFolderDeletedEvent;
}

class WSEventBookmarkFolderUpdatedEvent extends WSEvent {
  const WSEventBookmarkFolderUpdatedEvent(this.bookmarkFolderUpdatedEvent);

  factory WSEventBookmarkFolderUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventBookmarkFolderUpdatedEvent(
        BookmarkFolderUpdatedEvent.fromJson(json)!);
  }

  final BookmarkFolderUpdatedEvent bookmarkFolderUpdatedEvent;
}

class WSEventCommentAddedEvent extends WSEvent {
  const WSEventCommentAddedEvent(this.commentAddedEvent);

  factory WSEventCommentAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventCommentAddedEvent(CommentAddedEvent.fromJson(json)!);
  }

  final CommentAddedEvent commentAddedEvent;
}

class WSEventCommentDeletedEvent extends WSEvent {
  const WSEventCommentDeletedEvent(this.commentDeletedEvent);

  factory WSEventCommentDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventCommentDeletedEvent(CommentDeletedEvent.fromJson(json)!);
  }

  final CommentDeletedEvent commentDeletedEvent;
}

class WSEventCommentReactionAddedEvent extends WSEvent {
  const WSEventCommentReactionAddedEvent(this.commentReactionAddedEvent);

  factory WSEventCommentReactionAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventCommentReactionAddedEvent(
        CommentReactionAddedEvent.fromJson(json)!);
  }

  final CommentReactionAddedEvent commentReactionAddedEvent;
}

class WSEventCommentReactionDeletedEvent extends WSEvent {
  const WSEventCommentReactionDeletedEvent(this.commentReactionDeletedEvent);

  factory WSEventCommentReactionDeletedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventCommentReactionDeletedEvent(
        CommentReactionDeletedEvent.fromJson(json)!);
  }

  final CommentReactionDeletedEvent commentReactionDeletedEvent;
}

class WSEventCommentReactionUpdatedEvent extends WSEvent {
  const WSEventCommentReactionUpdatedEvent(this.commentReactionUpdatedEvent);

  factory WSEventCommentReactionUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventCommentReactionUpdatedEvent(
        CommentReactionUpdatedEvent.fromJson(json)!);
  }

  final CommentReactionUpdatedEvent commentReactionUpdatedEvent;
}

class WSEventCommentUpdatedEvent extends WSEvent {
  const WSEventCommentUpdatedEvent(this.commentUpdatedEvent);

  factory WSEventCommentUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventCommentUpdatedEvent(CommentUpdatedEvent.fromJson(json)!);
  }

  final CommentUpdatedEvent commentUpdatedEvent;
}

class WSEventFeedCreatedEvent extends WSEvent {
  const WSEventFeedCreatedEvent(this.feedCreatedEvent);

  factory WSEventFeedCreatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedCreatedEvent(FeedCreatedEvent.fromJson(json)!);
  }

  final FeedCreatedEvent feedCreatedEvent;
}

class WSEventFeedDeletedEvent extends WSEvent {
  const WSEventFeedDeletedEvent(this.feedDeletedEvent);

  factory WSEventFeedDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedDeletedEvent(FeedDeletedEvent.fromJson(json)!);
  }

  final FeedDeletedEvent feedDeletedEvent;
}

class WSEventFeedUpdatedEvent extends WSEvent {
  const WSEventFeedUpdatedEvent(this.feedUpdatedEvent);

  factory WSEventFeedUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedUpdatedEvent(FeedUpdatedEvent.fromJson(json)!);
  }

  final FeedUpdatedEvent feedUpdatedEvent;
}

class WSEventFeedGroupChangedEvent extends WSEvent {
  const WSEventFeedGroupChangedEvent(this.feedGroupChangedEvent);

  factory WSEventFeedGroupChangedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedGroupChangedEvent(FeedGroupChangedEvent.fromJson(json)!);
  }

  final FeedGroupChangedEvent feedGroupChangedEvent;
}

class WSEventFeedGroupDeletedEvent extends WSEvent {
  const WSEventFeedGroupDeletedEvent(this.feedGroupDeletedEvent);

  factory WSEventFeedGroupDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedGroupDeletedEvent(FeedGroupDeletedEvent.fromJson(json)!);
  }

  final FeedGroupDeletedEvent feedGroupDeletedEvent;
}

class WSEventFeedMemberAddedEvent extends WSEvent {
  const WSEventFeedMemberAddedEvent(this.feedMemberAddedEvent);

  factory WSEventFeedMemberAddedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedMemberAddedEvent(FeedMemberAddedEvent.fromJson(json)!);
  }

  final FeedMemberAddedEvent feedMemberAddedEvent;
}

class WSEventFeedMemberRemovedEvent extends WSEvent {
  const WSEventFeedMemberRemovedEvent(this.feedMemberRemovedEvent);

  factory WSEventFeedMemberRemovedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedMemberRemovedEvent(
        FeedMemberRemovedEvent.fromJson(json)!);
  }

  final FeedMemberRemovedEvent feedMemberRemovedEvent;
}

class WSEventFeedMemberUpdatedEvent extends WSEvent {
  const WSEventFeedMemberUpdatedEvent(this.feedMemberUpdatedEvent);

  factory WSEventFeedMemberUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFeedMemberUpdatedEvent(
        FeedMemberUpdatedEvent.fromJson(json)!);
  }

  final FeedMemberUpdatedEvent feedMemberUpdatedEvent;
}

class WSEventFollowCreatedEvent extends WSEvent {
  const WSEventFollowCreatedEvent(this.followCreatedEvent);

  factory WSEventFollowCreatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFollowCreatedEvent(FollowCreatedEvent.fromJson(json)!);
  }

  final FollowCreatedEvent followCreatedEvent;
}

class WSEventFollowDeletedEvent extends WSEvent {
  const WSEventFollowDeletedEvent(this.followDeletedEvent);

  factory WSEventFollowDeletedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFollowDeletedEvent(FollowDeletedEvent.fromJson(json)!);
  }

  final FollowDeletedEvent followDeletedEvent;
}

class WSEventFollowUpdatedEvent extends WSEvent {
  const WSEventFollowUpdatedEvent(this.followUpdatedEvent);

  factory WSEventFollowUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventFollowUpdatedEvent(FollowUpdatedEvent.fromJson(json)!);
  }

  final FollowUpdatedEvent followUpdatedEvent;
}

class WSEventNotificationFeedUpdatedEvent extends WSEvent {
  const WSEventNotificationFeedUpdatedEvent(this.notificationFeedUpdatedEvent);

  factory WSEventNotificationFeedUpdatedEvent.fromJson(
      Map<String, dynamic> json) {
    return WSEventNotificationFeedUpdatedEvent(
        NotificationFeedUpdatedEvent.fromJson(json)!);
  }

  final NotificationFeedUpdatedEvent notificationFeedUpdatedEvent;
}

class WSEventPollClosedFeedEvent extends WSEvent {
  const WSEventPollClosedFeedEvent(this.pollClosedFeedEvent);

  factory WSEventPollClosedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollClosedFeedEvent(PollClosedFeedEvent.fromJson(json)!);
  }

  final PollClosedFeedEvent pollClosedFeedEvent;
}

class WSEventPollDeletedFeedEvent extends WSEvent {
  const WSEventPollDeletedFeedEvent(this.pollDeletedFeedEvent);

  factory WSEventPollDeletedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollDeletedFeedEvent(PollDeletedFeedEvent.fromJson(json)!);
  }

  final PollDeletedFeedEvent pollDeletedFeedEvent;
}

class WSEventPollUpdatedFeedEvent extends WSEvent {
  const WSEventPollUpdatedFeedEvent(this.pollUpdatedFeedEvent);

  factory WSEventPollUpdatedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollUpdatedFeedEvent(PollUpdatedFeedEvent.fromJson(json)!);
  }

  final PollUpdatedFeedEvent pollUpdatedFeedEvent;
}

class WSEventPollVoteCastedFeedEvent extends WSEvent {
  const WSEventPollVoteCastedFeedEvent(this.pollVoteCastedFeedEvent);

  factory WSEventPollVoteCastedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollVoteCastedFeedEvent(
        PollVoteCastedFeedEvent.fromJson(json)!);
  }

  final PollVoteCastedFeedEvent pollVoteCastedFeedEvent;
}

class WSEventPollVoteChangedFeedEvent extends WSEvent {
  const WSEventPollVoteChangedFeedEvent(this.pollVoteChangedFeedEvent);

  factory WSEventPollVoteChangedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollVoteChangedFeedEvent(
        PollVoteChangedFeedEvent.fromJson(json)!);
  }

  final PollVoteChangedFeedEvent pollVoteChangedFeedEvent;
}

class WSEventPollVoteRemovedFeedEvent extends WSEvent {
  const WSEventPollVoteRemovedFeedEvent(this.pollVoteRemovedFeedEvent);

  factory WSEventPollVoteRemovedFeedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventPollVoteRemovedFeedEvent(
        PollVoteRemovedFeedEvent.fromJson(json)!);
  }

  final PollVoteRemovedFeedEvent pollVoteRemovedFeedEvent;
}

class WSEventHealthCheckEvent extends WSEvent {
  const WSEventHealthCheckEvent(this.healthCheckEvent);

  factory WSEventHealthCheckEvent.fromJson(Map<String, dynamic> json) {
    return WSEventHealthCheckEvent(HealthCheckEvent.fromJson(json)!);
  }

  final HealthCheckEvent healthCheckEvent;
}

class WSEventUserBannedEvent extends WSEvent {
  const WSEventUserBannedEvent(this.userBannedEvent);

  factory WSEventUserBannedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventUserBannedEvent(UserBannedEvent.fromJson(json)!);
  }

  final UserBannedEvent userBannedEvent;
}

class WSEventUserDeactivatedEvent extends WSEvent {
  const WSEventUserDeactivatedEvent(this.userDeactivatedEvent);

  factory WSEventUserDeactivatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventUserDeactivatedEvent(UserDeactivatedEvent.fromJson(json)!);
  }

  final UserDeactivatedEvent userDeactivatedEvent;
}

class WSEventUserMutedEvent extends WSEvent {
  const WSEventUserMutedEvent(this.userMutedEvent);

  factory WSEventUserMutedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventUserMutedEvent(UserMutedEvent.fromJson(json)!);
  }

  final UserMutedEvent userMutedEvent;
}

class WSEventUserReactivatedEvent extends WSEvent {
  const WSEventUserReactivatedEvent(this.userReactivatedEvent);

  factory WSEventUserReactivatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventUserReactivatedEvent(UserReactivatedEvent.fromJson(json)!);
  }

  final UserReactivatedEvent userReactivatedEvent;
}

class WSEventUserUpdatedEvent extends WSEvent {
  const WSEventUserUpdatedEvent(this.userUpdatedEvent);

  factory WSEventUserUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return WSEventUserUpdatedEvent(UserUpdatedEvent.fromJson(json)!);
  }

  final UserUpdatedEvent userUpdatedEvent;
}
