class EventTypes {
  static const String activityMarked = 'feeds.activity.marked';
  static const String activityReactionAdded = 'feeds.activity.reaction.added';
  static const String activityReactionDeleted =
      'feeds.activity.reaction.deleted';

  static const String commentAdded = 'feeds.comment.added';
  static const String commentUpdated = 'feeds.comment.updated';
  static const String commentDeleted = 'feeds.comment.deleted';
  static const String commentReactionAdded = 'feeds.comment.reaction.added';
  static const String commentReactionDeleted = 'feeds.comment.reaction.deleted';

  static const String followCreated = 'feeds.follow.created';
  static const String followDeleted = 'feeds.follow.deleted';
  static const String followUpdated = 'feeds.follow.updated';

  static const String pollClosed = 'feeds.poll.closed';
  static const String pollDeleted = 'feeds.poll.deleted';
  static const String pollUpdated = 'feeds.poll.updated';
  static const String pollVoteCasted = 'feeds.poll.vote_casted';
  static const String pollVoteRemoved = 'feeds.poll.vote_removed';

  static const String storiesFeedUpdated = 'feeds.stories_feed.updated';
}
