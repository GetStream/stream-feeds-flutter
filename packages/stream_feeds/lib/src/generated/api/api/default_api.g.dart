//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: public_member_api_docs

import 'package:stream_core/stream_core.dart';

import '../models.dart';

class DefaultApi {
  DefaultApi(this.apiClient);

  final CoreHttpClient apiClient;
  Future<AcceptFeedMemberInviteResponse> acceptFeedMemberInvite({
    required String feedId,
    required String feedGroupId,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/accept"
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{feed_group_id}', feedGroupId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      queryParameters: queryParams,
    );

    return AcceptFeedMemberInviteResponse.fromJson(response.data);
  }

  Future<AcceptFollowResponse> acceptFollow({
    required AcceptFollowRequest acceptFollowRequest,
  }) async {
    const path = r"/api/v2/feeds/follows/accept";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: acceptFollowRequest,
      queryParameters: queryParams,
    );

    return AcceptFollowResponse.fromJson(response.data);
  }

  Future<AddActivityResponse> addActivity({
    required AddActivityRequest addActivityRequest,
  }) async {
    const path = r"/api/v2/feeds/activities";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addActivityRequest,
      queryParameters: queryParams,
    );

    return AddActivityResponse.fromJson(response.data);
  }

  Future<AddBookmarkResponse> addBookmark({
    required String activityId,
    AddBookmarkRequest? addBookmarkRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addBookmarkRequest,
      queryParameters: queryParams,
    );

    return AddBookmarkResponse.fromJson(response.data);
  }

  Future<AddCommentResponse> addComment({
    required AddCommentRequest addCommentRequest,
  }) async {
    const path = r"/api/v2/feeds/comments";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentRequest,
      queryParameters: queryParams,
    );

    return AddCommentResponse.fromJson(response.data);
  }

  Future<AddCommentReactionResponse> addCommentReaction({
    required String commentId,
    required AddCommentReactionRequest addCommentReactionRequest,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}/reactions"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentReactionRequest,
      queryParameters: queryParams,
    );

    return AddCommentReactionResponse.fromJson(response.data);
  }

  Future<AddCommentsBatchResponse> addCommentsBatch({
    required AddCommentsBatchRequest addCommentsBatchRequest,
  }) async {
    const path = r"/api/v2/feeds/comments/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentsBatchRequest,
      queryParameters: queryParams,
    );

    return AddCommentsBatchResponse.fromJson(response.data);
  }

  Future<AddReactionResponse> addReaction({
    required String activityId,
    required AddReactionRequest addReactionRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/reactions"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addReactionRequest,
      queryParameters: queryParams,
    );

    return AddReactionResponse.fromJson(response.data);
  }

  Future<PollVoteResponse> castPollVote({
    required String activityId,
    required String pollId,
    CastPollVoteRequest? castPollVoteRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/polls/{poll_id}/vote"
        .replaceAll('{activity_id}', activityId)
        .replaceAll('{poll_id}', pollId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: castPollVoteRequest,
      queryParameters: queryParams,
    );

    return PollVoteResponse.fromJson(response.data);
  }

  Future<CreateFeedsBatchResponse> createFeedsBatch({
    required CreateFeedsBatchRequest createFeedsBatchRequest,
  }) async {
    const path = r"/api/v2/feeds/feeds/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: createFeedsBatchRequest,
      queryParameters: queryParams,
    );

    return CreateFeedsBatchResponse.fromJson(response.data);
  }

  Future<DeleteActivitiesResponse> deleteActivities({
    required DeleteActivitiesRequest deleteActivitiesRequest,
  }) async {
    const path = r"/api/v2/feeds/activities/delete";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: deleteActivitiesRequest,
      queryParameters: queryParams,
    );

    return DeleteActivitiesResponse.fromJson(response.data);
  }

  Future<DeleteActivityResponse> deleteActivity({
    required String activityId,
    bool? hardDelete,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    if (hardDelete != null) {
      queryParams.addAll({'hard_delete': hardDelete});
    }

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteActivityResponse.fromJson(response.data);
  }

  Future<DeleteActivityReactionResponse> deleteActivityReaction({
    required String activityId,
    required String type,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/reactions/{type}"
        .replaceAll('{activity_id}', activityId)
        .replaceAll('{type}', type);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteActivityReactionResponse.fromJson(response.data);
  }

  Future<DeleteBookmarkResponse> deleteBookmark({
    required String activityId,
    String? folderId,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    if (folderId != null) {
      queryParams.addAll({'folder_id': folderId});
    }

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteBookmarkResponse.fromJson(response.data);
  }

  Future<DeleteBookmarkFolderResponse> deleteBookmarkFolder({
    required String folderId,
  }) async {
    final path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteBookmarkFolderResponse.fromJson(response.data);
  }

  Future<DeleteCommentResponse> deleteComment({
    required String commentId,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteCommentResponse.fromJson(response.data);
  }

  Future<DeleteCommentReactionResponse> deleteCommentReaction({
    required String commentId,
    required String type,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}/reactions/{type}"
        .replaceAll('{comment_id}', commentId)
        .replaceAll('{type}', type);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteCommentReactionResponse.fromJson(response.data);
  }

  Future<DeleteFeedResponse> deleteFeed({
    required String feedGroupId,
    required String feedId,
    bool? hardDelete,
  }) async {
    final path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    if (hardDelete != null) {
      queryParams.addAll({'hard_delete': hardDelete});
    }

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteFeedResponse.fromJson(response.data);
  }

  Future<PollVoteResponse> deletePollVote({
    required String activityId,
    required String pollId,
    required String voteId,
    String? userId,
  }) async {
    final path =
        r"/api/v2/feeds/activities/{activity_id}/polls/{poll_id}/vote/{vote_id}"
            .replaceAll('{activity_id}', activityId)
            .replaceAll('{poll_id}', pollId)
            .replaceAll('{vote_id}', voteId);

    final queryParams = <String, Object?>{};

    if (userId != null) {
      queryParams.addAll({'user_id': userId});
    }

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return PollVoteResponse.fromJson(response.data);
  }

  Future<QueryFeedsResponse> feedsQueryFeeds({
    QueryFeedsRequest? queryFeedsRequest,
  }) async {
    const path = r"/api/v2/feeds/feeds/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryFeedsRequest,
      queryParameters: queryParams,
    );

    return QueryFeedsResponse.fromJson(response.data);
  }

  Future<SingleFollowResponse> follow({
    required SingleFollowRequest singleFollowRequest,
  }) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: singleFollowRequest,
      queryParameters: queryParams,
    );

    return SingleFollowResponse.fromJson(response.data);
  }

  Future<FollowBatchResponse> followBatch({
    required FollowBatchRequest followBatchRequest,
  }) async {
    const path = r"/api/v2/feeds/follows/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: followBatchRequest,
      queryParameters: queryParams,
    );

    return FollowBatchResponse.fromJson(response.data);
  }

  Future<GetActivityResponse> getActivity({
    required String activityId,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetActivityResponse.fromJson(response.data);
  }

  Future<GetCommentResponse> getComment({
    required String commentId,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetCommentResponse.fromJson(response.data);
  }

  Future<GetCommentRepliesResponse> getCommentReplies({
    required String commentId,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}/replies"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    if (depth != null) {
      queryParams.addAll({'depth': depth});
    }
    if (sort != null) {
      queryParams.addAll({'sort': sort});
    }
    if (repliesLimit != null) {
      queryParams.addAll({'replies_limit': repliesLimit});
    }
    if (limit != null) {
      queryParams.addAll({'limit': limit});
    }
    if (prev != null) {
      queryParams.addAll({'prev': prev});
    }
    if (next != null) {
      queryParams.addAll({'next': next});
    }

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetCommentRepliesResponse.fromJson(response.data);
  }

  Future<GetCommentsResponse> getComments({
    required String objectId,
    required String objectType,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) async {
    const path = r"/api/v2/feeds/comments";

    final queryParams = <String, Object?>{};
    queryParams.addAll({'object_id': objectId});
    queryParams.addAll({'object_type': objectType});
    if (depth != null) {
      queryParams.addAll({'depth': depth});
    }
    if (sort != null) {
      queryParams.addAll({'sort': sort});
    }
    if (repliesLimit != null) {
      queryParams.addAll({'replies_limit': repliesLimit});
    }
    if (limit != null) {
      queryParams.addAll({'limit': limit});
    }
    if (prev != null) {
      queryParams.addAll({'prev': prev});
    }
    if (next != null) {
      queryParams.addAll({'next': next});
    }

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetCommentsResponse.fromJson(response.data);
  }

  Future<GetFollowSuggestionsResponse> getFollowSuggestions({
    required String feedGroupId,
    int? limit,
  }) async {
    final path = r"/api/v2/feeds/feed_groups/{feed_group_id}/follow_suggestions"
        .replaceAll('{feed_group_id}', feedGroupId);

    final queryParams = <String, Object?>{};

    if (limit != null) {
      queryParams.addAll({'limit': limit});
    }

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetFollowSuggestionsResponse.fromJson(response.data);
  }

  Future<GetOrCreateFeedResponse> getOrCreateFeed({
    required String feedGroupId,
    required String feedId,
    GetOrCreateFeedRequest? getOrCreateFeedRequest,
  }) async {
    final path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: getOrCreateFeedRequest,
      queryParameters: queryParams,
    );

    return GetOrCreateFeedResponse.fromJson(response.data);
  }

  Future<DurationResponse> markActivity({
    required String feedGroupId,
    required String feedId,
    MarkActivityRequest? markActivityRequest,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/mark/batch"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: markActivityRequest,
      queryParameters: queryParams,
    );

    return DurationResponse.fromJson(response.data);
  }

  Future<PinActivityResponse> pinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/{activity_id}/pin"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      queryParameters: queryParams,
    );

    return PinActivityResponse.fromJson(response.data);
  }

  Future<QueryActivitiesResponse> queryActivities({
    QueryActivitiesRequest? queryActivitiesRequest,
  }) async {
    const path = r"/api/v2/feeds/activities/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryActivitiesRequest,
      queryParameters: queryParams,
    );

    return QueryActivitiesResponse.fromJson(response.data);
  }

  Future<QueryActivityReactionsResponse> queryActivityReactions({
    required String activityId,
    QueryActivityReactionsRequest? queryActivityReactionsRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/reactions/query"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryActivityReactionsRequest,
      queryParameters: queryParams,
    );

    return QueryActivityReactionsResponse.fromJson(response.data);
  }

  Future<QueryBookmarkFoldersResponse> queryBookmarkFolders({
    QueryBookmarkFoldersRequest? queryBookmarkFoldersRequest,
  }) async {
    const path = r"/api/v2/feeds/bookmark_folders/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryBookmarkFoldersRequest,
      queryParameters: queryParams,
    );

    return QueryBookmarkFoldersResponse.fromJson(response.data);
  }

  Future<QueryBookmarksResponse> queryBookmarks({
    QueryBookmarksRequest? queryBookmarksRequest,
  }) async {
    const path = r"/api/v2/feeds/bookmarks/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryBookmarksRequest,
      queryParameters: queryParams,
    );

    return QueryBookmarksResponse.fromJson(response.data);
  }

  Future<QueryCommentReactionsResponse> queryCommentReactions({
    required String commentId,
    QueryCommentReactionsRequest? queryCommentReactionsRequest,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}/reactions/query"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryCommentReactionsRequest,
      queryParameters: queryParams,
    );

    return QueryCommentReactionsResponse.fromJson(response.data);
  }

  Future<QueryCommentsResponse> queryComments({
    required QueryCommentsRequest queryCommentsRequest,
  }) async {
    const path = r"/api/v2/feeds/comments/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryCommentsRequest,
      queryParameters: queryParams,
    );

    return QueryCommentsResponse.fromJson(response.data);
  }

  Future<QueryFeedMembersResponse> queryFeedMembers({
    required String feedGroupId,
    required String feedId,
    QueryFeedMembersRequest? queryFeedMembersRequest,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/query"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryFeedMembersRequest,
      queryParameters: queryParams,
    );

    return QueryFeedMembersResponse.fromJson(response.data);
  }

  Future<QueryFollowsResponse> queryFollows({
    QueryFollowsRequest? queryFollowsRequest,
  }) async {
    const path = r"/api/v2/feeds/follows/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryFollowsRequest,
      queryParameters: queryParams,
    );

    return QueryFollowsResponse.fromJson(response.data);
  }

  Future<RejectFeedMemberInviteResponse> rejectFeedMemberInvite({
    required String feedGroupId,
    required String feedId,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/reject"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      queryParameters: queryParams,
    );

    return RejectFeedMemberInviteResponse.fromJson(response.data);
  }

  Future<RejectFollowResponse> rejectFollow({
    required RejectFollowRequest rejectFollowRequest,
  }) async {
    const path = r"/api/v2/feeds/follows/reject";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: rejectFollowRequest,
      queryParameters: queryParams,
    );

    return RejectFollowResponse.fromJson(response.data);
  }

  Future<DurationResponse> stopWatchingFeed({
    required String feedGroupId,
    required String feedId,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/watch"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DurationResponse.fromJson(response.data);
  }

  Future<UnfollowResponse> unfollow({
    required String source,
    required String target,
  }) async {
    final path = r"/api/v2/feeds/follows/{source}/{target}"
        .replaceAll('{source}', source)
        .replaceAll('{target}', target);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return UnfollowResponse.fromJson(response.data);
  }

  Future<UnpinActivityResponse> unpinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/{activity_id}/pin"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return UnpinActivityResponse.fromJson(response.data);
  }

  Future<UpdateActivityResponse> updateActivity({
    required String activityId,
    UpdateActivityRequest? updateActivityRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.put(
      path,
      data: updateActivityRequest,
      queryParameters: queryParams,
    );

    return UpdateActivityResponse.fromJson(response.data);
  }

  Future<UpdateActivityPartialResponse> updateActivityPartial({
    required String activityId,
    UpdateActivityPartialRequest? updateActivityPartialRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateActivityPartialRequest,
      queryParameters: queryParams,
    );

    return UpdateActivityPartialResponse.fromJson(response.data);
  }

  Future<UpdateBookmarkResponse> updateBookmark({
    required String activityId,
    UpdateBookmarkRequest? updateBookmarkRequest,
  }) async {
    final path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateBookmarkRequest,
      queryParameters: queryParams,
    );

    return UpdateBookmarkResponse.fromJson(response.data);
  }

  Future<UpdateBookmarkFolderResponse> updateBookmarkFolder({
    required String folderId,
    UpdateBookmarkFolderRequest? updateBookmarkFolderRequest,
  }) async {
    final path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateBookmarkFolderRequest,
      queryParameters: queryParams,
    );

    return UpdateBookmarkFolderResponse.fromJson(response.data);
  }

  Future<UpdateCommentResponse> updateComment({
    required String commentId,
    UpdateCommentRequest? updateCommentRequest,
  }) async {
    final path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateCommentRequest,
      queryParameters: queryParams,
    );

    return UpdateCommentResponse.fromJson(response.data);
  }

  Future<UpdateFeedResponse> updateFeed({
    required String feedGroupId,
    required String feedId,
    UpdateFeedRequest? updateFeedRequest,
  }) async {
    final path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.put(
      path,
      data: updateFeedRequest,
      queryParameters: queryParams,
    );

    return UpdateFeedResponse.fromJson(response.data);
  }

  Future<UpdateFeedMembersResponse> updateFeedMembers({
    required String feedGroupId,
    required String feedId,
    required UpdateFeedMembersRequest updateFeedMembersRequest,
  }) async {
    final path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateFeedMembersRequest,
      queryParameters: queryParams,
    );

    return UpdateFeedMembersResponse.fromJson(response.data);
  }

  Future<UpdateFollowResponse> updateFollow({
    required UpdateFollowRequest updateFollowRequest,
  }) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateFollowRequest,
      queryParameters: queryParams,
    );

    return UpdateFollowResponse.fromJson(response.data);
  }

  Future<UpsertActivitiesResponse> upsertActivities({
    required UpsertActivitiesRequest upsertActivitiesRequest,
  }) async {
    const path = r"/api/v2/feeds/activities/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: upsertActivitiesRequest,
      queryParameters: queryParams,
    );

    return UpsertActivitiesResponse.fromJson(response.data);
  }
}
