// ignore_for_file: avoid_redundant_argument_values, parameter_assignments

import 'package:collection/collection.dart';
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
    sort: '',
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
    sort: '',
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
  Map<String, EnrichedCollectionResponse> collections = const {},
  PollResponseData? poll,
  bool hidden = false,
  bool? isWatched,
  List<BookmarkResponse> ownBookmarks = const [],
  List<FeedsReactionResponse> ownReactions = const [],
  List<FeedsReactionResponse> latestReactions = const [],
  Map<String, FeedsReactionGroupResponse> reactionGroups = const {},
  List<CommentResponse> comments = const [],
}) {
  latestReactions = latestReactions.isEmpty ? ownReactions : latestReactions;
  reactionGroups = switch (reactionGroups.isNotEmpty) {
    true => reactionGroups,
    _ => latestReactions.fold(
      <String, FeedsReactionGroupResponse>{},
      (prev, curr) => prev
        ..update(
          curr.type,
          (it) => it.copyWith(
            count: it.count + 1,
            firstReactionAt: [it.firstReactionAt, curr.createdAt].min,
            lastReactionAt: [it.lastReactionAt, curr.createdAt].max,
          ),
          ifAbsent: () => FeedsReactionGroupResponse(
            count: 1,
            firstReactionAt: curr.createdAt,
            lastReactionAt: curr.createdAt,
          ),
        ),
    ),
  };

  return ActivityResponse(
    id: id,
    attachments: const [],
    bookmarkCount: ownBookmarks.length,
    collections: collections,
    commentCount: comments.length,
    comments: comments,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    feeds: feeds,
    filterTags: const [],
    hidden: hidden,
    interestTags: const [],
    latestReactions: latestReactions,
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
    restrictReplies: ActivityResponseRestrictReplies.everyone,
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
  List<PollVoteResponseData> ownVotesAndAnswers = const [],
  List<PollVoteResponseData> latestVotesAndAnswers = const [],
  Map<String, List<PollVoteResponseData>> latestVotesByOption = const {},
}) {
  options ??= [
    createDefaultPollOptionResponse(id: 'option-1', text: 'Option 1'),
    createDefaultPollOptionResponse(id: 'option-2', text: 'Option 2'),
  ];

  latestVotesAndAnswers = switch (latestVotesAndAnswers.isNotEmpty) {
    true => latestVotesAndAnswers,
    _ => ownVotesAndAnswers,
  };

  final (latestAnswers, latestVotes) = latestVotesAndAnswers.partition(
    (vote) => vote.isAnswer ?? false,
  );

  latestVotesByOption = switch (latestVotesByOption.isNotEmpty) {
    true => latestVotesByOption,
    _ => latestVotes.fold(
      <String, List<PollVoteResponseData>>{},
      (prev, curr) => prev..update(curr.optionId, (it) => [curr, ...it], ifAbsent: () => [curr]),
    ),
  };

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
    ownVotes: ownVotesAndAnswers,
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
  return PollOptionResponseData(id: id, text: text, custom: const {});
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
  String name = 'name',
  String description = 'description',
  int activityCount = 0,
  int followerCount = 0,
  int followingCount = 0,
  List<FeedResponseOwnCapabilities>? ownCapabilities,
  FeedMemberResponse? ownMembership,
  List<FollowResponse>? ownFollowings,
  List<FollowResponse>? ownFollows,
}) {
  return FeedResponse(
    id: id,
    groupId: groupId,
    feed: FeedId(group: groupId, id: id).toString(),
    name: name,
    description: description,
    visibility: FeedResponseVisibility.public,
    createdAt: DateTime(2021, 1, 1),
    createdBy: createDefaultUserResponse(),
    activityCount: activityCount,
    followerCount: followerCount,
    followingCount: followingCount,
    memberCount: 0,
    pinCount: 0,
    updatedAt: DateTime.now(),
    ownCapabilities: ownCapabilities,
    ownMembership: ownMembership,
    ownFollowings: ownFollowings,
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
  List<FeedsReactionResponse> ownReactions = const [],
  List<FeedsReactionResponse> latestReactions = const [],
  Map<String, FeedsReactionGroupResponse> reactionGroups = const {},
}) {
  latestReactions = latestReactions.isEmpty ? ownReactions : latestReactions;
  reactionGroups = switch (reactionGroups.isNotEmpty) {
    true => reactionGroups,
    _ => latestReactions.fold(
      {},
      (prev, curr) => prev
        ..update(
          curr.type,
          (it) => it.copyWith(
            count: it.count + 1,
            firstReactionAt: [it.firstReactionAt, curr.createdAt].min,
            lastReactionAt: [it.lastReactionAt, curr.createdAt].max,
          ),
          ifAbsent: () => FeedsReactionGroupResponse(
            count: 1,
            firstReactionAt: curr.createdAt,
            lastReactionAt: curr.createdAt,
          ),
        ),
    ),
  };

  return CommentResponse(
    id: id,
    bookmarkCount: 0,
    confidenceScore: 0,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    downvoteCount: 0,
    latestReactions: latestReactions,
    mentionedUsers: const [],
    objectId: objectId,
    objectType: objectType,
    ownReactions: ownReactions,
    parentId: parentId,
    reactionCount: reactionGroups.values.sumOf((group) => group.count),
    reactionGroups: reactionGroups,
    replyCount: 0,
    score: 0,
    status: CommentResponseStatus.active,
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
    bookmarkCount: 0,
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
    status: ThreadedCommentResponseStatus.active,
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
    activity: createDefaultActivityResponse(id: activityId, type: type),
    createdAt: DateTime(2021, 1, 1),
    duration: 'duration',
    feed: 'user:id',
    userId: 'user-id',
  );
}

ActivityPinResponse createDefaultActivityPinResponse({
  String activityId = 'activity-id',
  String type = 'post',
  String userId = 'user-id',
}) {
  return ActivityPinResponse(
    activity: createDefaultActivityResponse(id: activityId, type: type),
    createdAt: DateTime(2021, 1, 1),
    feed: 'user:id',
    updatedAt: DateTime(2021, 1, 2),
    user: createDefaultUserResponse(id: userId),
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
    objectId: activityId,
    objectType: activityType,
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

FeedsReactionResponse createDefaultReactionResponse({
  String activityId = 'activity-id',
  String? commentId,
  String userId = 'user-id',
  String reactionType = 'like',
}) {
  return FeedsReactionResponse(
    activityId: activityId,
    commentId: commentId,
    type: reactionType,
    createdAt: DateTime.timestamp(),
    updatedAt: DateTime.timestamp(),
    user: createDefaultUserResponse(id: userId),
  );
}

QueryActivityReactionsResponse createDefaultQueryActivityReactionsResponse({
  String? next,
  String? prev,
  List<FeedsReactionResponse> reactions = const [],
}) {
  return QueryActivityReactionsResponse(
    next: next,
    prev: prev,
    reactions: reactions,
    duration: '10ms',
  );
}

QueryCommentReactionsResponse createDefaultQueryCommentReactionsResponse({
  String? next,
  String? prev,
  List<FeedsReactionResponse> reactions = const [],
}) {
  return QueryCommentReactionsResponse(
    next: next,
    prev: prev,
    reactions: reactions,
    duration: '10ms',
  );
}

QueryCommentsResponse createDefaultQueryCommentsResponse({
  String? next,
  String? prev,
  List<CommentResponse> comments = const [],
}) {
  return QueryCommentsResponse(
    next: next,
    prev: prev,
    comments: comments,
    duration: '10ms',
  );
}

FeedMemberResponse createDefaultFeedMemberResponse({
  String id = 'member-id',
  String role = 'member',
  FeedMemberResponseStatus status = FeedMemberResponseStatus.member,
}) {
  return FeedMemberResponse(
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    role: role,
    status: status,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(id: id),
  );
}

QueryFeedMembersResponse createDefaultQueryFeedMembersResponse({
  String? next,
  String? prev,
  List<FeedMemberResponse> members = const [],
}) {
  return QueryFeedMembersResponse(
    next: next,
    prev: prev,
    members: members,
    duration: '10ms',
  );
}

FollowResponse createDefaultFollowResponse({
  String sourceId = 'follow-source-id',
  String targetId = 'follow-target-id',
  String followerRole = 'follower',
  FollowResponseStatus status = FollowResponseStatus.accepted,
}) {
  return FollowResponse(
    custom: const {},
    followerRole: followerRole,
    pushPreference: FollowResponsePushPreference.all,
    sourceFeed: createDefaultFeedResponse(id: sourceId, groupId: 'user'),
    status: status,
    targetFeed: createDefaultFeedResponse(id: targetId, groupId: 'user'),
    createdAt: DateTime(2021, 1, 1),
    updatedAt: DateTime(2021, 2, 1),
  );
}

FollowBatchResponse createDefaultFollowBatchResponse({
  List<FollowResponse> created = const [],
  List<FollowResponse> follows = const [],
}) {
  return FollowBatchResponse(
    created: created,
    duration: '10ms',
    follows: follows,
  );
}

UnfollowBatchResponse createDefaultUnfollowBatchResponse({
  List<FollowResponse> follows = const [],
}) {
  return UnfollowBatchResponse(duration: '10ms', follows: follows);
}

BookmarkFolderResponse createDefaultBookmarkFolderResponse({
  String id = 'folder-id',
  String name = 'My Folder',
}) {
  return BookmarkFolderResponse(
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    id: id,
    name: name,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(),
  );
}

QueryBookmarkFoldersResponse createDefaultQueryBookmarkFoldersResponse({
  String? next,
  String? prev,
  List<BookmarkFolderResponse> bookmarkFolders = const [],
}) {
  return QueryBookmarkFoldersResponse(
    next: next,
    prev: prev,
    bookmarkFolders: bookmarkFolders,
    duration: '10ms',
  );
}

QueryBookmarksResponse createDefaultQueryBookmarksResponse({
  String? next,
  String? prev,
  List<BookmarkResponse> bookmarks = const [],
}) {
  return QueryBookmarksResponse(
    next: next,
    prev: prev,
    bookmarks: bookmarks,
    duration: '10ms',
  );
}

QueryFeedsResponse createDefaultQueryFeedsResponse({
  String? next,
  String? prev,
  List<FeedResponse> feeds = const [],
}) {
  return QueryFeedsResponse(
    next: next,
    prev: prev,
    feeds: feeds,
    duration: '10ms',
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
  int activityCount = 0,
  Map<String, double>? algorithmScores,
  String? reason,
  double? recommendationScore,
  List<FollowResponse>? ownFollowings,
  List<FollowResponse>? ownFollows,
}) {
  return FeedSuggestionResponse(
    id: id,
    groupId: groupId,
    feed: FeedId(group: groupId, id: feedId).toString(),
    name: 'Suggested Feed',
    description: 'A suggested feed for you',
    visibility: FeedSuggestionResponseVisibility.public,
    createdAt: DateTime(2021, 1, 1),
    createdBy: createDefaultUserResponse(),
    activityCount: activityCount,
    followerCount: 100,
    followingCount: 50,
    memberCount: 10,
    pinCount: 0,
    updatedAt: DateTime(2021, 2, 1),
    algorithmScores: algorithmScores,
    reason: reason,
    recommendationScore: recommendationScore,
    ownFollowings: ownFollowings,
    ownFollows: ownFollows,
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
  return ActivityFeedbackResponse(duration: '10ms', activityId: activityId);
}

ConfigResponse createDefaultModerationConfigResponse({
  String key = 'config-key',
  String team = 'team-id',
  bool async = false,
}) {
  return ConfigResponse(
    key: key,
    team: team,
    async: async,
    supportedVideoCallHarmTypes: const [],
    createdAt: DateTime(2021, 1, 1),
    updatedAt: DateTime(2021, 2, 1),
  );
}

QueryModerationConfigsResponse createDefaultQueryModerationConfigsResponse({
  String? next,
  String? prev,
  List<ConfigResponse> configs = const [],
}) {
  return QueryModerationConfigsResponse(
    next: next,
    prev: prev,
    configs: configs,
    duration: '10ms',
  );
}

ConfigResponse createDefaultConfigResponse({
  String key = 'default-config',
  String team = 'default-team',
}) {
  return ConfigResponse(
    key: key,
    team: team,
    async: true,
    createdAt: DateTime(2021, 1, 1),
    updatedAt: DateTime(2021, 2, 1),
    supportedVideoCallHarmTypes: const [],
  );
}

BanResponse createDefaultBanResponse() {
  return const BanResponse(duration: '10ms');
}

MuteResponse createDefaultMuteResponse({List<UserMuteResponse>? mutes}) {
  return MuteResponse(duration: '10ms', mutes: mutes);
}

BlockUsersResponse createDefaultBlockUsersResponse({
  String blockedUserId = 'user-123',
  String blockedByUserId = 'user-1',
}) {
  return BlockUsersResponse(
    blockedUserId: blockedUserId,
    blockedByUserId: blockedByUserId,
    createdAt: DateTime(2021, 1, 1),
    duration: '10ms',
  );
}

UnblockUsersResponse createDefaultUnblockUsersResponse() {
  return const UnblockUsersResponse(duration: '10ms');
}

GetBlockedUsersResponse createDefaultGetBlockedUsersResponse({
  List<BlockedUserResponse> blocks = const [],
}) {
  return GetBlockedUsersResponse(blocks: blocks, duration: '10ms');
}

BlockedUserResponse createDefaultBlockedUserResponse({
  String blockedUserId = 'user-123',
  String userId = 'user-1',
}) {
  return BlockedUserResponse(
    blockedUserId: blockedUserId,
    blockedUser: createDefaultUserResponse(id: blockedUserId),
    userId: userId,
    user: createDefaultUserResponse(id: userId),
    createdAt: DateTime(2021, 1, 1),
  );
}

FlagResponse createDefaultFlagResponse({String itemId = 'activity-123'}) {
  return FlagResponse(duration: '10ms', itemId: itemId);
}

SubmitActionResponse createDefaultSubmitActionResponse({
  ReviewQueueItemResponse? item,
}) {
  return SubmitActionResponse(duration: '10ms', item: item);
}

QueryReviewQueueResponse createDefaultQueryReviewQueueResponse({
  String? next,
  String? prev,
  List<ReviewQueueItemResponse> items = const [],
}) {
  return QueryReviewQueueResponse(
    actionConfig: const {},
    items: items,
    next: next,
    prev: prev,
    stats: const {},
    duration: '10ms',
  );
}

UpsertConfigResponse createDefaultUpsertConfigResponse({
  String key = 'config-1',
}) {
  return UpsertConfigResponse(
    config: createDefaultModerationConfigResponse(key: key),
    duration: '10ms',
  );
}

DeleteModerationConfigResponse createDefaultDeleteModerationConfigResponse() {
  return const DeleteModerationConfigResponse(duration: '10ms');
}

GetConfigResponse createDefaultGetConfigResponse({
  String key = 'config-1',
  String? team,
}) {
  return GetConfigResponse(
    config: createDefaultModerationConfigResponse(
      key: key,
      team: team ?? 'team-id',
    ),
    duration: '10ms',
  );
}

UpsertActivitiesResponse createDefaultUpsertActivitiesResponse({
  int count = 1,
}) {
  return UpsertActivitiesResponse(
    activities: List.generate(
      count,
      (index) => createDefaultActivityResponse(id: 'activity-${index + 1}'),
    ),
    duration: '10ms',
  );
}

CollectionResponse createDefaultCollectionResponse({
  String id = 'collection-123',
  String name = 'my_collection',
  String? userId,
  Map<String, Object?>? custom,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return CollectionResponse(
    id: id,
    name: name,
    userId: userId,
    custom: custom,
    createdAt: createdAt ?? DateTime(2021, 1, 1),
    updatedAt: updatedAt ?? DateTime(2021, 2, 1),
  );
}

EnrichedCollectionResponse createDefaultEnrichedCollectionResponse({
  String id = 'collection-123',
  String name = 'my_collection',
  EnrichedCollectionResponseStatus status = EnrichedCollectionResponseStatus.ok,
  String? userId,
  Map<String, Object?>? custom,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return EnrichedCollectionResponse(
    id: id,
    name: name,
    status: status,
    userId: userId,
    custom: custom,
    createdAt: createdAt ?? DateTime(2021, 1, 1),
    updatedAt: updatedAt ?? DateTime(2021, 2, 1),
  );
}

ReadCollectionsResponse createDefaultReadCollectionsResponse({
  List<CollectionResponse> collections = const [],
}) {
  return ReadCollectionsResponse(collections: collections, duration: '10ms');
}

CreateCollectionsResponse createDefaultCreateCollectionsResponse({
  List<CollectionResponse> collections = const [],
}) {
  return CreateCollectionsResponse(collections: collections, duration: '10ms');
}

UpdateCollectionsResponse createDefaultUpdateCollectionsResponse({
  List<CollectionResponse> collections = const [],
}) {
  return UpdateCollectionsResponse(collections: collections, duration: '10ms');
}

DeleteCollectionsResponse createDefaultDeleteCollectionsResponse() {
  return const DeleteCollectionsResponse(duration: '10ms');
}

DeleteActivitiesResponse createDefaultDeleteActivitiesResponse({
  List<String> ids = const ['activity-1'],
}) {
  return DeleteActivitiesResponse(deletedIds: ids, duration: '10ms');
}

AppealResponse createDefaultAppealResponse({String appealId = 'appeal-123'}) {
  return AppealResponse(appealId: appealId, duration: '10ms');
}

AppealItemResponse createDefaultAppealItemResponse({
  String id = 'appeal-123',
  String entityId = 'activity-123',
  String entityType = 'activity',
  String status = 'pending',
  String appealReason = 'This was a mistake',
}) {
  return AppealItemResponse(
    id: id,
    entityId: entityId,
    entityType: entityType,
    status: status,
    appealReason: appealReason,
    createdAt: DateTime(2021, 1, 1),
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(),
  );
}

GetAppealResponse createDefaultGetAppealResponse({AppealItemResponse? item}) {
  return GetAppealResponse(
    item: item ?? createDefaultAppealItemResponse(),
    duration: '10ms',
  );
}

QueryAppealsResponse createDefaultQueryAppealsResponse({
  String? next,
  String? prev,
  List<AppealItemResponse> items = const [],
}) {
  return QueryAppealsResponse(
    items: items.isEmpty ? [createDefaultAppealItemResponse()] : items,
    next: next,
    prev: prev,
    duration: '10ms',
  );
}

GetApplicationResponse createDefaultGetApplicationResponse({
  String name = 'Test App',
}) {
  return GetApplicationResponse(
    app: AppResponseFields(
      asyncUrlEnrichEnabled: false,
      autoTranslationEnabled: false,
      id: 1,
      name: name,
      placement: 'default',
      fileUploadConfig: const FileUploadConfig(
        allowedFileExtensions: ['jpg', 'png', 'gif', 'mp4'],
        allowedMimeTypes: ['image/jpeg', 'image/png', 'video/mp4'],
        blockedFileExtensions: [],
        blockedMimeTypes: [],
        sizeLimit: 10485760,
      ),
      imageUploadConfig: const FileUploadConfig(
        allowedFileExtensions: ['jpg', 'png', 'gif'],
        allowedMimeTypes: ['image/jpeg', 'image/png', 'image/gif'],
        blockedFileExtensions: [],
        blockedMimeTypes: [],
        sizeLimit: 5242880,
      ),
    ),
    duration: '10ms',
  );
}

ListDevicesResponse createDefaultListDevicesResponse({
  List<DeviceResponse> devices = const [],
}) {
  return ListDevicesResponse(devices: devices, duration: '10ms');
}

DurationResponse createDefaultCreateDeviceResponse() {
  return const DurationResponse(duration: '10ms');
}

DurationResponse createDefaultDeleteDeviceResponse() {
  return const DurationResponse(duration: '10ms');
}
