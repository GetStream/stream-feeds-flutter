// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

GetCommentsResponse createDefaultCommentsResponse() =>
    const GetCommentsResponse(
      comments: [],
      next: null,
      prev: null,
      duration: 'duration',
    );

GetActivityResponse createDefaultActivityResponse({PollResponseData? poll}) =>
    GetActivityResponse(
      activity: ActivityResponse(
        id: 'id',
        attachments: const [],
        bookmarkCount: 0,
        commentCount: 0,
        comments: const [],
        createdAt: DateTime(2021, 1, 1),
        custom: const {},
        feeds: const [],
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
        type: 'type',
        updatedAt: DateTime(2021, 2, 1),
        user: UserResponse(
          id: 'id',
          name: 'name',
          banned: false,
          blockedUserIds: const [],
          createdAt: DateTime(2021, 1, 1),
          custom: const {},
          language: 'language',
          online: false,
          role: 'role',
          teams: const [],
          updatedAt: DateTime(2021, 2, 1),
        ),
        visibility: ActivityResponseVisibility.public,
        visibilityTag: null,
      ),
      duration: 'duration',
    );

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
  List<AggregatedActivityResponse> aggregatedActivities = const [],
  List<ActivityResponse> activities = const [],
  String? prevPagination,
  String? nextPagination,
}) =>
    GetOrCreateFeedResponse(
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
      createdBy: UserResponse(
        id: 'id',
        name: 'name',
        banned: false,
        blockedUserIds: const [],
        createdAt: DateTime(2021, 1, 1),
        custom: const {},
        language: 'language',
        online: false,
        role: 'role',
        teams: const [],
        updatedAt: DateTime(2021, 2, 1),
      ),
      followerCount: followerCount,
      followingCount: followingCount,
      memberCount: 0,
      pinCount: 0,
      updatedAt: DateTime.now(),
    );

AggregatedActivityResponse createDefaultAggregatedActivityResponse({
  List<ActivityResponse>? activities,
  String group = 'group',
}) =>
    AggregatedActivityResponse(
      activities: activities ??
          [
            createDefaultActivityResponse().activity,
          ],
      activityCount: activities?.length ?? 1,
      createdAt: DateTime(2021, 2, 1),
      group: group,
      score: 0,
      updatedAt: DateTime(2021, 2, 1),
      userCount: 1,
      userCountTruncated: false,
    );
