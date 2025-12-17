class EventTypes {
  // Activity events
  static const activityAdded = 'feeds.activity.added';
  static const activityDeleted = 'feeds.activity.deleted';
  static const activityMarked = 'feeds.activity.marked';
  static const activityPinned = 'feeds.activity.pinned';
  static const activityRemovedFromFeed = 'feeds.activity.removed_from_feed';
  static const activityUnpinned = 'feeds.activity.unpinned';
  static const activityUpdated = 'feeds.activity.updated';
  static const activityFeedback = 'feeds.activity.feedback';

  // Reaction events
  static const activityReactionAdded = 'feeds.activity.reaction.added';
  static const activityReactionDeleted = 'feeds.activity.reaction.deleted';
  static const activityReactionUpdated = 'feeds.activity.reaction.updated';

  // Bookmark events
  static const bookmarkAdded = 'feeds.bookmark.added';
  static const bookmarkDeleted = 'feeds.bookmark.deleted';
  static const bookmarkUpdated = 'feeds.bookmark.updated';

  // Bookmark folder events
  static const bookmarkFolderUpdated = 'feeds.bookmark_folder.updated';
  static const bookmarkFolderDeleted = 'feeds.bookmark_folder.deleted';

  // Feed events
  static const feedCreated = 'feeds.feed.created';
  static const feedUpdated = 'feeds.feed.updated';
  static const feedDeleted = 'feeds.feed.deleted';
  static const feedGroupChanged = 'feeds.feed_group.changed';
  static const feedGroupDeleted = 'feeds.feed_group.deleted';

  // Feed member events
  static const feedMemberAdded = 'feeds.feed_member.added';
  static const feedMemberUpdated = 'feeds.feed_member.updated';
  static const feedMemberRemoved = 'feeds.feed_member.removed';

  // Comment events
  static const commentAdded = 'feeds.comment.added';
  static const commentDeleted = 'feeds.comment.deleted';
  static const commentUpdated = 'feeds.comment.updated';
  static const commentReactionAdded = 'feeds.comment.reaction.added';
  static const commentReactionDeleted = 'feeds.comment.reaction.deleted';
  static const commentReactionUpdated = 'feeds.comment.reaction.updated';

  // Follow events
  static const followCreated = 'feeds.follow.created';
  static const followDeleted = 'feeds.follow.deleted';
  static const followUpdated = 'feeds.follow.updated';

  // Poll events
  static const pollClosed = 'feeds.poll.closed';
  static const pollDeleted = 'feeds.poll.deleted';
  static const pollUpdated = 'feeds.poll.updated';
  static const pollVoteCasted = 'feeds.poll.vote_casted';
  static const pollVoteChanged = 'feeds.poll.vote_changed';
  static const pollVoteRemoved = 'feeds.poll.vote_removed';

  // Stories events
  static const storiesFeedUpdated = 'feeds.stories_feed.updated';
}
