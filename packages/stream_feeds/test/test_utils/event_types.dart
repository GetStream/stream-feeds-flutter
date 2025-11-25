class EventTypes {
  // Activity events
  static const activityAdded = 'feeds.activity.added';
  static const activityMarked = 'feeds.activity.marked';
  static const activityUpdated = 'feeds.activity.updated';
  static const activityPinned = 'feeds.activity.pinned';
  static const activityUnpinned = 'feeds.activity.unpinned';
  static const activityFeedback = 'feeds.activity.feedback';

  // Reaction events
  static const activityReactionAdded = 'feeds.activity.reaction.added';
  static const activityReactionDeleted = 'feeds.activity.reaction.deleted';

  // Bookmark events
  static const bookmarkAdded = 'feeds.bookmark.added';
  static const bookmarkDeleted = 'feeds.bookmark.deleted';
  static const bookmarkUpdated = 'feeds.bookmark.updated';

  // Bookmark folder events
  static const bookmarkFolderUpdated = 'feeds.bookmark_folder.updated';

  // Comment events
  static const commentAdded = 'feeds.comment.added';

  // Follow events
  static const followCreated = 'feeds.follow.created';
  static const followDeleted = 'feeds.follow.deleted';
  static const followUpdated = 'feeds.follow.updated';

  // Poll events
  static const pollClosed = 'feeds.poll.closed';
  static const pollDeleted = 'feeds.poll.deleted';
  static const pollVoteCasted = 'feeds.poll.vote_casted';
  static const pollVoteRemoved = 'feeds.poll.vote_removed';

  // Stories events
  static const storiesFeedUpdated = 'feeds.stories_feed.updated';
}
