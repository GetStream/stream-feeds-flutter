// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

GetCommentsResponse createDefaultCommentsResponse({
  String? next,
  String? prev,
  List<ThreadedCommentResponse> comments = const [],
}) {
  return GetCommentsResponse(
    next: next,
    prev: prev,
    comments: comments,
    duration: '10ms',
  );
}

GetCommentRepliesResponse createDefaultCommentRepliesResponse({
  String? next,
  String? prev,
  List<ThreadedCommentResponse> comments = const [],
}) {
  return GetCommentRepliesResponse(
    next: next,
    prev: prev,
    comments: comments,
    duration: '10ms',
  );
}

QueryActivitiesResponse createDefaultQueryActivitiesResponse({
  String? next,
  String? prev,
  List<ActivityResponse> activities = const [],
}) {
  return QueryActivitiesResponse(
    next: next,
    prev: prev,
    activities: activities,
    duration: '10ms',
  );
}

UserResponse createDefaultUserResponse({
  String id = 'id',
  String name = 'name',
  String role = 'role',
}) {
  return UserResponse(
    id: id,
    name: name,
    banned: false,
    blockedUserIds: const [],
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    language: 'language',
    online: false,
    role: role,
    teams: const [],
    updatedAt: DateTime(2021, 2, 1),
  );
}

GetActivityResponse createDefaultGetActivityResponse({
  String id = 'id',
  String type = 'post',
  PollResponseData? poll,
  List<String> feeds = const [],
  bool hidden = false,
}) {
  return GetActivityResponse(
    activity: createDefaultActivityResponse(
      id: id,
      type: type,
      poll: poll,
      feeds: feeds,
      hidden: hidden,
    ),
    duration: '10ms',
  );
}

ActivityResponse createDefaultActivityResponse({
  String id = 'id',
  String type = 'post',
  String userId = 'user-1',
  List<String> feeds = const [],
  PollResponseData? poll,
  bool hidden = false,
  bool? isWatched,
  List<BookmarkResponse> ownBookmarks = const [],
  List<FeedsReactionResponse> ownReactions = const [],
  Map<String, ReactionGroupResponse> reactionGroups = const {},
  List<CommentResponse> comments = const [],
}) {
  return ActivityResponse(
    id: id,
    attachments: const [],
    bookmarkCount: ownBookmarks.length,
    collections: const {},
    commentCount: comments.length,
    comments: comments,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    feeds: feeds,
    filterTags: const [],
    hidden: hidden,
    interestTags: const [],
    latestReactions: const [],
    mentionedUsers: const [],
    moderation: null,
    notificationContext: null,
    ownBookmarks: ownBookmarks,
    ownReactions: ownReactions,
    parent: null,
    poll: poll,
    popularity: 0,
    preview: false,
    reactionCount: reactionGroups.values.sumOf((group) => group.count),
    reactionGroups: reactionGroups,
    restrictReplies: 'everyone',
    score: 0,
    searchData: const {},
    shareCount: 0,
    text: null,
    type: type,
    isWatched: isWatched,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(id: userId),
    visibility: ActivityResponseVisibility.public,
    visibilityTag: null,
  );
}

PollResponseData createDefaultPollResponse({
  String id = 'poll-id',
  List<PollOptionResponseData>? options,
  List<PollVoteResponseData> latestAnswers = const [],
  Map<String, List<PollVoteResponseData>> latestVotesByOption = const {},
}) {
  options ??= [
    createDefaultPollOptionResponse(id: 'option-1', text: 'Option 1'),
    createDefaultPollOptionResponse(id: 'option-2', text: 'Option 2'),
  ];

  return PollResponseData(
    id: id,
    name: 'name',
    allowAnswers: true,
    allowUserSuggestedOptions: true,
    answersCount: latestAnswers.length,
    createdAt: DateTime.now(),
    createdById: 'id',
    custom: const {},
    description: 'description',
    enforceUniqueVote: true,
    latestAnswers: latestAnswers,
    latestVotesByOption: latestVotesByOption,
    ownVotes: const [],
    updatedAt: DateTime.now(),
    voteCount: latestVotesByOption.values.sumOf((it) => it.length),
    voteCountsByOption: latestVotesByOption.map(
      (k, e) => MapEntry(k, e.length),
    ),
    votingVisibility: 'visibility',
    options: options,
  );
}

PollOptionResponseData createDefaultPollOptionResponse({
  String id = 'option-id',
  String text = 'Option Text',
}) {
  return PollOptionResponseData(
    id: id,
    text: text,
    custom: const {},
  );
}

GetOrCreateFeedResponse createDefaultGetOrCreateFeedResponse({
  int followerCount = 0,
  int followingCount = 0,
  List<AggregatedActivityResponse> aggregatedActivities = const [],
  List<ActivityResponse> activities = const [],
  String? prevPagination,
  String? nextPagination,
}) {
  return GetOrCreateFeedResponse(
    feed: createDefaultFeedResponse(
      followerCount: followerCount,
      followingCount: followingCount,
    ),
    activities: activities,
    aggregatedActivities: aggregatedActivities,
    created: true,
    duration: '',
    followers: const [],
    following: const [],
    members: const [],
    pinnedActivities: const [],
    next: nextPagination,
    prev: prevPagination,
  );
}

FeedResponse createDefaultFeedResponse({
  String id = 'id',
  String groupId = 'group',
  int followerCount = 0,
  int followingCount = 0,
  List<FeedOwnCapability>? ownCapabilities,
  FeedMemberResponse? ownMembership,
  List<FollowResponse>? ownFollows,
}) {
  return FeedResponse(
    id: id,
    groupId: groupId,
    feed: FeedId(group: groupId, id: id).toString(),
    name: 'name',
    description: 'description',
    visibility: FeedVisibility.public,
    createdAt: DateTime(2021, 1, 1),
    createdBy: createDefaultUserResponse(),
    followerCount: followerCount,
    followingCount: followingCount,
    memberCount: 0,
    pinCount: 0,
    updatedAt: DateTime.now(),
    ownCapabilities: ownCapabilities,
    ownMembership: ownMembership,
    ownFollows: ownFollows,
  );
}

CommentResponse createDefaultCommentResponse({
  String id = 'id',
  required String objectId,
  String objectType = 'post',
  String? text,
  String? userId,
  String? parentId,
}) {
  return CommentResponse(
    id: id,
    confidenceScore: 0,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    downvoteCount: 0,
    mentionedUsers: const [],
    objectId: objectId,
    objectType: objectType,
    ownReactions: const [],
    parentId: parentId,
    reactionCount: 0,
    replyCount: 0,
    score: 0,
    status: 'status',
    text: text,
    updatedAt: DateTime(2021, 2, 1),
    upvoteCount: 0,
    user: createDefaultUserResponse(id: userId ?? 'user-1'),
  );
}

ThreadedCommentResponse createDefaultThreadedCommentResponse({
  String id = 'id',
  required String objectId,
  String objectType = 'post',
  String? text,
  String? userId,
  List<FeedsReactionResponse>? ownReactions,
  List<ThreadedCommentResponse> replies = const [],
}) {
  return ThreadedCommentResponse(
    id: id,
    confidenceScore: 0,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    downvoteCount: 0,
    mentionedUsers: const [],
    objectId: objectId,
    objectType: objectType,
    ownReactions: ownReactions ?? const [],
    reactionCount: 0,
    replyCount: replies.length,
    replies: replies.isEmpty ? null : replies,
    score: 0,
    status: 'status',
    text: text,
    updatedAt: DateTime(2021, 2, 1),
    upvoteCount: 0,
    user: createDefaultUserResponse(id: userId ?? 'user-1'),
  );
}

AddCommentResponse createDefaultAddCommentResponse({
  String commentId = 'comment-1',
  required String objectId,
  String objectType = 'activity',
  String? text,
  String? userId,
}) {
  return AddCommentResponse(
    comment: createDefaultCommentResponse(
      id: commentId,
      objectId: objectId,
      objectType: objectType,
      text: text,
      userId: userId,
    ),
    duration: '10ms',
  );
}

UpdateCommentResponse createDefaultUpdateCommentResponse({
  String commentId = 'comment-1',
  required String objectId,
  String objectType = 'activity',
  String? text,
  String? userId,
}) {
  return UpdateCommentResponse(
    comment: createDefaultCommentResponse(
      id: commentId,
      objectId: objectId,
      objectType: objectType,
      text: text,
      userId: userId,
    ),
    duration: '10ms',
  );
}

DeleteCommentResponse createDefaultDeleteCommentResponse({
  String commentId = 'comment-1',
  required String activityId,
  required String objectId,
  String objectType = 'activity',
  String? userId,
}) {
  return DeleteCommentResponse(
    activity: createDefaultActivityResponse(id: activityId),
    comment: createDefaultCommentResponse(
      id: commentId,
      objectId: objectId,
      objectType: objectType,
      userId: userId ?? 'user-1',
    ),
    duration: '10ms',
  );
}

AddCommentReactionResponse createDefaultAddCommentReactionResponse({
  String commentId = 'comment-1',
  required String objectId,
  String objectType = 'activity',
  String userId = 'user-1',
  String reactionType = 'like',
}) {
  return AddCommentReactionResponse(
    comment: createDefaultCommentResponse(
      id: commentId,
      objectId: objectId,
      objectType: objectType,
      userId: userId,
    ),
    duration: '10ms',
    reaction: FeedsReactionResponse(
      activityId: objectId,
      commentId: commentId,
      type: reactionType,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
      user: createDefaultUserResponse(id: userId),
    ),
  );
}

DeleteCommentReactionResponse createDefaultDeleteCommentReactionResponse({
  String commentId = 'comment-1',
  required String objectId,
  String objectType = 'activity',
  String userId = 'user-1',
  String reactionType = 'like',
}) {
  return DeleteCommentReactionResponse(
    comment: createDefaultCommentResponse(
      id: commentId,
      objectId: objectId,
      objectType: objectType,
      userId: userId,
    ),
    duration: '10ms',
    reaction: FeedsReactionResponse(
      activityId: objectId,
      commentId: commentId,
      type: reactionType,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
      user: createDefaultUserResponse(id: userId),
    ),
  );
}

PinActivityResponse createDefaultPinActivityResponse({
  String activityId = 'activity-id',
  String type = 'post',
}) {
  return PinActivityResponse(
    activity: createDefaultActivityResponse(
      id: activityId,
      type: type,
    ),
    createdAt: DateTime(2021, 1, 1),
    duration: 'duration',
    feed: 'user:id',
    userId: 'user-id',
  );
}

BookmarkResponse createDefaultBookmarkResponse({
  String userId = 'user-id',
  String activityId = 'activity-id',
  String activityType = 'post',
  String folderId = 'folder-id',
}) {
  return BookmarkResponse(
    activity: createDefaultActivityResponse(id: activityId, type: activityType),
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    folder: createDefaultBookmarkFolderResponse(id: folderId),
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(id: userId),
  );
}

AddBookmarkResponse createDefaultAddBookmarkResponse({
  String userId = 'user-id',
  String activityId = 'activity-id',
  String folderId = 'folder-id',
}) {
  return AddBookmarkResponse(
    bookmark: createDefaultBookmarkResponse(
      userId: userId,
      activityId: activityId,
      folderId: folderId,
    ),
    duration: '10ms',
  );
}

UpdateBookmarkResponse createDefaultUpdateBookmarkResponse({
  String userId = 'user-id',
  String activityId = 'activity-id',
  String folderId = 'folder-id',
}) {
  return UpdateBookmarkResponse(
    bookmark: createDefaultBookmarkResponse(
      userId: userId,
      activityId: activityId,
      folderId: folderId,
    ),
    duration: '10ms',
  );
}

DeleteBookmarkResponse createDefaultDeleteBookmarkResponse({
  String userId = 'user-id',
  String activityId = 'activity-id',
  String folderId = 'folder-id',
}) {
  return DeleteBookmarkResponse(
    bookmark: createDefaultBookmarkResponse(
      userId: userId,
      activityId: activityId,
      folderId: folderId,
    ),
    duration: '10ms',
  );
}

AddReactionResponse createDefaultAddReactionResponse({
  String activityId = 'activity-id',
  String userId = 'user-id',
  String reactionType = 'like',
}) {
  return AddReactionResponse(
    activity: createDefaultActivityResponse(id: activityId),
    duration: '10ms',
    reaction: FeedsReactionResponse(
      activityId: activityId,
      type: reactionType,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
      user: createDefaultUserResponse(id: userId),
    ),
  );
}

DeleteActivityReactionResponse createDefaultDeleteReactionResponse({
  String activityId = 'activity-id',
  String userId = 'user-id',
  String reactionType = 'like',
}) {
  return DeleteActivityReactionResponse(
    activity: createDefaultActivityResponse(id: activityId),
    duration: '10ms',
    reaction: FeedsReactionResponse(
      activityId: activityId,
      type: reactionType,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
      user: createDefaultUserResponse(id: userId),
    ),
  );
}

FeedMemberResponse createDefaultFeedMemberResponse({
  String id = 'member-id',
  String role = 'member',
}) {
  return FeedMemberResponse(
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    role: role,
    status: FeedMemberResponseStatus.member,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(id: id),
  );
}

FollowResponse createDefaultFollowResponse({
  String id = 'follow-id',
  FollowResponseStatus status = FollowResponseStatus.accepted,
}) {
  return FollowResponse(
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    followerRole: 'follower',
    pushPreference: FollowResponsePushPreference.all,
    sourceFeed: createDefaultFeedResponse(id: 'source-$id'),
    status: status,
    targetFeed: createDefaultFeedResponse(id: 'target-$id'),
    updatedAt: DateTime(2021, 2, 1),
  );
}

BookmarkFolderResponse createDefaultBookmarkFolderResponse({
  String id = 'folder-id',
}) {
  return BookmarkFolderResponse(
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    id: id,
    name: 'My Folder',
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(),
  );
}

PollVoteResponseData createDefaultPollVoteResponse({
  String id = 'vote-id',
  String pollId = 'poll-id',
  String optionId = 'option-id',
}) {
  return PollVoteResponseData(
    createdAt: DateTime(2021, 1, 1),
    id: id,
    optionId: optionId,
    pollId: pollId,
    isAnswer: false,
    updatedAt: DateTime(2021, 2, 1),
  );
}

PollVoteResponseData createDefaultPollAnswerResponse({
  String id = 'answer-id',
  String pollId = 'poll-id',
  String answerText = 'My Answer',
}) {
  return PollVoteResponseData(
    createdAt: DateTime(2021, 1, 1),
    id: id,
    optionId: '',
    pollId: pollId,
    isAnswer: true,
    answerText: answerText,
    updatedAt: DateTime(2021, 2, 1),
  );
}

AggregatedActivityResponse createDefaultAggregatedActivityResponse({
  List<ActivityResponse>? activities,
  String group = 'group',
}) {
  activities ??= [createDefaultActivityResponse()];
  return AggregatedActivityResponse(
    activities: activities,
    activityCount: activities.length,
    createdAt: DateTime(2021, 2, 1),
    group: group,
    score: 0,
    updatedAt: DateTime(2021, 2, 1),
    userCount: 1,
    userCountTruncated: false,
  );
}

FeedSuggestionResponse createDefaultFeedSuggestionResponse({
  String id = 'suggestion-id',
  String groupId = 'user',
  String feedId = 'john',
  Map<String, double>? algorithmScores,
  String? reason,
  double? recommendationScore,
}) {
  return FeedSuggestionResponse(
    id: id,
    groupId: groupId,
    feed: FeedId(group: groupId, id: feedId).toString(),
    name: 'Suggested Feed',
    description: 'A suggested feed for you',
    visibility: FeedVisibility.public,
    createdAt: DateTime(2021, 1, 1),
    createdBy: createDefaultUserResponse(),
    followerCount: 100,
    followingCount: 50,
    memberCount: 10,
    pinCount: 0,
    updatedAt: DateTime(2021, 2, 1),
    algorithmScores: algorithmScores,
    reason: reason,
    recommendationScore: recommendationScore,
  );
}

GetFollowSuggestionsResponse createDefaultGetFollowSuggestionsResponse({
  List<FeedSuggestionResponse>? suggestions,
}) {
  return GetFollowSuggestionsResponse(
    duration: '10ms',
    suggestions: suggestions ?? [createDefaultFeedSuggestionResponse()],
  );
}

ActivityFeedbackResponse createDefaultActivityFeedbackResponse({
  String activityId = 'activity-id',
}) {
  return ActivityFeedbackResponse(
    duration: '10ms',
    activityId: activityId,
  );
}
