// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

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
    const CommentsQuery(
      filter: Filter.query(CommentsFilterField.commentText, 'oat'),
    ),
  );
  final comments1 = await list1.get();

  // All comments for an activity
  final list2 = client.commentList(
    const CommentsQuery(
      filter: Filter.and([
        Filter.equal(CommentsFilterField.objectId, 'activity_123'),
        Filter.equal(CommentsFilterField.objectType, 'activity'),
      ]),
    ),
  );
  final comments2 = await list2.get();

  // Replies to a parent activity
  final list3 = client.commentList(
    const CommentsQuery(
      filter: Filter.equal(CommentsFilterField.parentId, 'parent_id'),
    ),
  );
  final comments3 = await list3.get();

  // Comments from an user
  final list4 = client.commentList(
    const CommentsQuery(
      filter: Filter.equal(CommentsFilterField.userId, 'jane'),
    ),
  );
  final comments4 = await list4.get();
}

Future<void> commentReactions() async {
  // Add a reaction to a comment
  await feed.addCommentReaction(
    commentId: 'comment_123',
    request: const AddCommentReactionRequest(type: 'like'),
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
