// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

GetCommentsResponse createDefaultCommentsResponse() {
  return const GetCommentsResponse(
    comments: [],
    next: null,
    prev: null,
    duration: 'duration',
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
  List<String> feeds = const [],
  PollResponseData? poll,
  bool hidden = false,
}) {
  return ActivityResponse(
    id: id,
    attachments: const [],
    bookmarkCount: 0,
    collections: const {},
    commentCount: 0,
    comments: const [],
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
    ownBookmarks: const [],
    ownReactions: const [],
    parent: null,
    poll: poll,
    popularity: 0,
    preview: false,
    reactionCount: 0,
    reactionGroups: const {},
    restrictReplies: 'everyone',
    score: 0,
    searchData: const {},
    shareCount: 0,
    text: null,
    type: type,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(),
    visibility: ActivityResponseVisibility.public,
    visibilityTag: null,
  );
}

PollResponseData createDefaultPollResponseData({
  String id = 'poll-id',
  List<PollVoteResponseData> latestAnswers = const [],
  Map<String, List<PollVoteResponseData>> latestVotesByOption = const {},
}) {
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
    voteCount: latestVotesByOption.values
        .map((e) => e.length)
        .fold(0, (v, e) => v + e),
    voteCountsByOption: latestVotesByOption.map(
      (k, e) => MapEntry(k, e.length),
    ),
    votingVisibility: 'visibility',
    options: const [
      PollOptionResponseData(
        id: 'id1',
        text: 'text1',
        custom: {},
      ),
      PollOptionResponseData(
        id: 'id2',
        text: 'text2',
        custom: {},
      ),
    ],
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
  );
}

CommentResponse createDefaultCommentResponse({
  String id = 'id',
  required String objectId,
  String objectType = 'post',
  String? text,
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
    reactionCount: 0,
    replyCount: 0,
    score: 0,
    status: 'status',
    text: text,
    updatedAt: DateTime(2021, 2, 1),
    upvoteCount: 0,
    user: createDefaultUserResponse(),
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
  String folderId = 'folder-id',
}) {
  return BookmarkResponse(
    activity: createDefaultActivityResponse(id: activityId),
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    folder: createDefaultBookmarkFolderResponse(id: folderId),
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(id: userId),
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
  String optionId = 'option-1',
}) {
  return PollVoteResponseData(
    createdAt: DateTime(2021, 1, 1),
    id: id,
    optionId: optionId,
    pollId: pollId,
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
