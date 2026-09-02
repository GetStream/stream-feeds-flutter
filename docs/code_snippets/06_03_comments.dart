import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> addingComments() async {
  // Adding a comment to an activity
  final comment = await feed.addComment(
    request: const ActivityAddCommentRequest(
      comment: 'So great!',
      custom: {'sentiment': 'positive'},
      activityId: 'activity_123',
      activityType: 'activity',
    ),
  );
  // Adding a reply to a comment
  final reply = await feed.addComment(
    request: const ActivityAddCommentRequest(
      comment: 'I agree!',
      activityId: 'activity_123',
      activityType: 'activity',
      parentId: 'comment_456',
    ),
  );
}

Future<void> updatingComments() async {
  // Updating a comment
  final updatedComment = await feed.updateComment(
    commentId: 'comment_123',
    request: const UpdateCommentRequest(
      comment: 'Not so great',
      custom: {'edited': true},
    ),
  );
}

Future<void> removingComments() async {
  await feed.deleteComment(commentId: 'comment_123');
}

Future<void> readingComments() async {
  await feed.getOrCreate();
  print(feed.state.activities[0].comments);
  // or
  final activity = client.activity(
    fid: const FeedId(group: 'user', id: 'john'),
    activityId: 'activity_123',
  );
  await activity.get();
  print(activity.state.comments);
}

Future<void> queryingComments() async {
  // Search in comment texts
  final list1 = client.commentList(
    CommentsQuery(
      filter: Filter.query(CommentsFilterField.commentText, 'oat'),
    ),
  );
  final comments1 = await list1.get();

  // All comments for an activity
  final list2 = client.commentList(
    CommentsQuery(
      filter: Filter.and([
        Filter.equal(CommentsFilterField.objectId, 'activity_123'),
        Filter.equal(CommentsFilterField.objectType, 'activity'),
      ]),
    ),
  );
  final comments2 = await list2.get();

  // Replies to a parent activity
  final list3 = client.commentList(
    CommentsQuery(
      filter: Filter.equal(CommentsFilterField.parentId, 'parent_id'),
    ),
  );
  final comments3 = await list3.get();

  // Comments from an user
  final list4 = client.commentList(
    CommentsQuery(
      filter: Filter.equal(CommentsFilterField.userId, 'jane'),
    ),
  );
  final comments4 = await list4.get();
}

Future<void> commentReactions() async {
  // Add a reaction to a comment
  await feed.addCommentReaction(
    commentId: 'comment_123',
    request: const AddCommentReactionRequest(
      type: 'like',
      // Optionally override existing reaction
      enforceUnique: true,
    ),
  );
  // Remove a reaction from a comment
  await feed.deleteCommentReaction(commentId: 'comment_123', type: 'like');
}

Future<void> commentThreading() async {
  final commentList = client.activityCommentList(
    const ActivityCommentsQuery(
      objectId: 'activity_123',
      objectType: 'activity',
      depth: 3,
      limit: 20,
    ),
  );
  final comments = await commentList.get();

  // Get replies of a specific parent comment
  final replyList = client.commentReplyList(
    const CommentRepliesQuery(commentId: 'parent_123'),
  );
  final replies = await replyList.get();
}

Future<void> restrictReplies() async {
  // Post an activity that restricts who can reply/comment.
  // Options: everyone (default), nobody, peopleIFollow.
  // Note: the activity author can always comment regardless of this setting.
  await feed.addActivity(
    request: const FeedAddActivityRequest(
      type: 'post',
      text: 'Only my followers can reply to this.',
      restrictReplies: ActivityRestrictReplies.peopleIFollow,
    ),
  );

  // To check whether the current user may comment on an activity whose
  // restrictReplies is peopleIFollow, the server must enrich the response with
  // the author's own_followings. Enable this via enrichmentOptions on the feed
  // query — it is not included in the default getOrCreate() response.
  final enrichedFeed = client.feedFromQuery(
    const FeedQuery(
      fid: FeedId(group: 'user', id: 'john'),
      enrichmentOptions: EnrichmentOptions(enrichOwnFollowings: true),
    ),
  );
  await enrichedFeed.getOrCreate();
  final activity = enrichedFeed.state.activities.firstOrNull;
  if (activity == null) return;

  switch (activity.restrictReplies) {
    case ActivityRestrictReplies.everyone:
      print('Anyone can comment');
    case ActivityRestrictReplies.nobody:
      print('Comments are disabled');
    case ActivityRestrictReplies.peopleIFollow:
      // own_followings lists follow relationships where the source feed is the
      // activity author's and the target is the current user's feed. A non-empty
      // list means the activity author follows the current user, so they may
      // comment.
      final ownFollowings = activity.currentFeed?.ownFollowings ?? [];
      final canComment = ownFollowings.isNotEmpty;
      print('Can current user comment? $canComment');
    default: // future/unknown values from the server
      print('Unknown restriction: ${activity.restrictReplies}');
  }
}

Future<void> updateRestrictReplies() async {
  // Update an existing activity's reply restriction after it was created.
  // restrictReplies is passed directly on the generated UpdateActivityRequest.
  await feed.updateActivity(
    id: 'activity-id',
    request: const UpdateActivityRequest(
      restrictReplies: UpdateActivityRequestRestrictReplies.nobody,
    ),
  );
}
