// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

GetCommentsResponse createDefaultCommentsResponse() =>
    const GetCommentsResponse(
      comments: [],
      next: null,
      prev: null,
      duration: 'duration',
    );

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

GetActivityResponse createDefaultActivityResponse({
  String id = 'id',
  String type = 'post',
  List<String> feeds = const [],
  PollResponseData? poll,
}) {
  return GetActivityResponse(
    activity: ActivityResponse(
      id: id,
      attachments: const [],
      bookmarkCount: 0,
      commentCount: 0,
      comments: const [],
      createdAt: DateTime(2021, 1, 1),
      custom: const {},
      feeds: feeds,
      filterTags: const [],
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
      reactionCount: 0,
      reactionGroups: const {},
      score: 0,
      searchData: const {},
      shareCount: 0,
      text: null,
      type: type,
      updatedAt: DateTime(2021, 2, 1),
      user: createDefaultUserResponse(),
      visibility: ActivityResponseVisibility.public,
      visibilityTag: null,
    ),
    duration: 'duration',
  );
}

PollResponseData createDefaultPollResponseData({
  List<PollVoteResponseData> latestAnswers = const [],
  Map<String, List<PollVoteResponseData>> latestVotesByOption = const {},
}) =>
    PollResponseData(
      id: 'id',
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

GetOrCreateFeedResponse createDefaultGetOrCreateFeedResponse({
  int followerCount = 0,
  int followingCount = 0,
}) =>
    GetOrCreateFeedResponse(
      feed: createDefaultFeedResponse(
        followerCount: followerCount,
        followingCount: followingCount,
      ),
      activities: const [],
      aggregatedActivities: const [],
      created: true,
      duration: '',
      followers: const [],
      following: const [],
      members: const [],
      pinnedActivities: const [],
    );

FeedResponse createDefaultFeedResponse({
  String id = 'id',
  String groupId = 'group',
  int followerCount = 0,
  int followingCount = 0,
}) =>
    FeedResponse(
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
    ).activity,
    createdAt: DateTime(2021, 1, 1),
    duration: 'duration',
    feed: 'user:id',
    userId: 'user-id',
  );
}

BookmarkResponse createDefaultBookmarkResponse({
  String activityId = 'activity-id',
}) {
  return BookmarkResponse(
    activity: createDefaultActivityResponse(id: activityId).activity,
    createdAt: DateTime(2021, 1, 1),
    custom: const {},
    folder: null,
    updatedAt: DateTime(2021, 2, 1),
    user: createDefaultUserResponse(),
  );
}
