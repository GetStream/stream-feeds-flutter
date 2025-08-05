//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: public_member_api_docs

part of openapi.api;

class DefaultApi {
  DefaultApi(this.apiClient);

  final CoreHttpClient apiClient;
  Future<AcceptFeedMemberInviteResponse> acceptFeedMemberInvite(
    String feedId,
    String feedGroupId,
  ) async {
    var path =
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

  Future<AcceptFollowResponse> acceptFollow(
    AcceptFollowRequest acceptFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/accept";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: acceptFollowRequest,
      queryParameters: queryParams,
    );

    return AcceptFollowResponse.fromJson(response.data);
  }

  Future<AddActivityResponse> addActivity(
    AddActivityRequest addActivityRequest,
  ) async {
    const path = r"/api/v2/feeds/activities";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addActivityRequest,
      queryParameters: queryParams,
    );

    return AddActivityResponse.fromJson(response.data);
  }

  Future<AddBookmarkResponse> addBookmark(
    String activityId,
    AddBookmarkRequest? addBookmarkRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addBookmarkRequest,
      queryParameters: queryParams,
    );

    return AddBookmarkResponse.fromJson(response.data);
  }

  Future<AddCommentResponse> addComment(
    AddCommentRequest addCommentRequest,
  ) async {
    const path = r"/api/v2/feeds/comments";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentRequest,
      queryParameters: queryParams,
    );

    return AddCommentResponse.fromJson(response.data);
  }

  Future<AddCommentReactionResponse> addCommentReaction(
    String commentId,
    AddCommentReactionRequest addCommentReactionRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentReactionRequest,
      queryParameters: queryParams,
    );

    return AddCommentReactionResponse.fromJson(response.data);
  }

  Future<AddCommentsBatchResponse> addCommentsBatch(
    AddCommentsBatchRequest addCommentsBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/comments/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addCommentsBatchRequest,
      queryParameters: queryParams,
    );

    return AddCommentsBatchResponse.fromJson(response.data);
  }

  Future<AddReactionResponse> addReaction(
    String activityId,
    AddReactionRequest addReactionRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: addReactionRequest,
      queryParameters: queryParams,
    );

    return AddReactionResponse.fromJson(response.data);
  }

  Future<PollVoteResponse> castPollVote(
    String activityId,
    String pollId,
    CastPollVoteRequest? castPollVoteRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/polls/{poll_id}/vote"
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

  Future<CreateFeedsBatchResponse> createFeedsBatch(
    CreateFeedsBatchRequest createFeedsBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/feeds/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: createFeedsBatchRequest,
      queryParameters: queryParams,
    );

    return CreateFeedsBatchResponse.fromJson(response.data);
  }

  Future<DeleteActivitiesResponse> deleteActivities(
    DeleteActivitiesRequest deleteActivitiesRequest,
  ) async {
    const path = r"/api/v2/feeds/activities/delete";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: deleteActivitiesRequest,
      queryParameters: queryParams,
    );

    return DeleteActivitiesResponse.fromJson(response.data);
  }

  Future<DeleteActivityResponse> deleteActivity(
    String activityId,
    bool? hardDelete,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
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

  Future<DeleteActivityReactionResponse> deleteActivityReaction(
    String activityId,
    String type,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions/{type}"
        .replaceAll('{activity_id}', activityId)
        .replaceAll('{type}', type);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteActivityReactionResponse.fromJson(response.data);
  }

  Future<DeleteBookmarkResponse> deleteBookmark(
    String activityId,
    String? folderId,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
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

  Future<DeleteBookmarkFolderResponse> deleteBookmarkFolder(
    String folderId,
  ) async {
    var path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteBookmarkFolderResponse.fromJson(response.data);
  }

  Future<DeleteCommentResponse> deleteComment(
    String commentId,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteCommentResponse.fromJson(response.data);
  }

  Future<DeleteCommentReactionResponse> deleteCommentReaction(
    String commentId,
    String type,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions/{type}"
        .replaceAll('{comment_id}', commentId)
        .replaceAll('{type}', type);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return DeleteCommentReactionResponse.fromJson(response.data);
  }

  Future<DeleteFeedResponse> deleteFeed(
    String feedGroupId,
    String feedId,
    bool? hardDelete,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
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

  Future<PollVoteResponse> deletePollVote(
    String activityId,
    String pollId,
    String voteId,
    String? userId,
  ) async {
    var path =
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

  Future<QueryFeedsResponse> feedsQueryFeeds(
    QueryFeedsRequest? queryFeedsRequest,
  ) async {
    const path = r"/api/v2/feeds/feeds/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryFeedsRequest,
      queryParameters: queryParams,
    );

    return QueryFeedsResponse.fromJson(response.data);
  }

  Future<SingleFollowResponse> follow(
    SingleFollowRequest singleFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: singleFollowRequest,
      queryParameters: queryParams,
    );

    return SingleFollowResponse.fromJson(response.data);
  }

  Future<FollowBatchResponse> followBatch(
    FollowBatchRequest followBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/batch";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: followBatchRequest,
      queryParameters: queryParams,
    );

    return FollowBatchResponse.fromJson(response.data);
  }

  Future<GetActivityResponse> getActivity(
    String activityId,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetActivityResponse.fromJson(response.data);
  }

  Future<GetCommentResponse> getComment(
    String commentId,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.get(
      path,
      queryParameters: queryParams,
    );

    return GetCommentResponse.fromJson(response.data);
  }

  Future<GetCommentRepliesResponse> getCommentReplies(
    String commentId,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/replies"
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

  Future<GetCommentsResponse> getComments(
    String objectId,
    String objectType,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  ) async {
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

  Future<GetFollowSuggestionsResponse> getFollowSuggestions(
    String feedGroupId,
    int? limit,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/follow_suggestions"
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

  Future<GetOrCreateFeedResponse> getOrCreateFeed(
    String feedGroupId,
    String feedId,
    GetOrCreateFeedRequest? getOrCreateFeedRequest,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
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

  Future<DurationResponse> markActivity(
    String feedGroupId,
    String feedId,
    MarkActivityRequest? markActivityRequest,
  ) async {
    var path =
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

  Future<PinActivityResponse> pinActivity(
    String feedGroupId,
    String feedId,
    String activityId,
  ) async {
    var path =
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

  Future<QueryActivitiesResponse> queryActivities(
    QueryActivitiesRequest? queryActivitiesRequest,
  ) async {
    const path = r"/api/v2/feeds/activities/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryActivitiesRequest,
      queryParameters: queryParams,
    );

    return QueryActivitiesResponse.fromJson(response.data);
  }

  Future<QueryActivityReactionsResponse> queryActivityReactions(
    String activityId,
    QueryActivityReactionsRequest? queryActivityReactionsRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions/query"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryActivityReactionsRequest,
      queryParameters: queryParams,
    );

    return QueryActivityReactionsResponse.fromJson(response.data);
  }

  Future<QueryBookmarkFoldersResponse> queryBookmarkFolders(
    QueryBookmarkFoldersRequest? queryBookmarkFoldersRequest,
  ) async {
    const path = r"/api/v2/feeds/bookmark_folders/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryBookmarkFoldersRequest,
      queryParameters: queryParams,
    );

    return QueryBookmarkFoldersResponse.fromJson(response.data);
  }

  Future<QueryBookmarksResponse> queryBookmarks(
    QueryBookmarksRequest? queryBookmarksRequest,
  ) async {
    const path = r"/api/v2/feeds/bookmarks/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryBookmarksRequest,
      queryParameters: queryParams,
    );

    return QueryBookmarksResponse.fromJson(response.data);
  }

  Future<QueryCommentReactionsResponse> queryCommentReactions(
    String commentId,
    QueryCommentReactionsRequest? queryCommentReactionsRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions/query"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryCommentReactionsRequest,
      queryParameters: queryParams,
    );

    return QueryCommentReactionsResponse.fromJson(response.data);
  }

  Future<QueryCommentsResponse> queryComments(
    QueryCommentsRequest queryCommentsRequest,
  ) async {
    const path = r"/api/v2/feeds/comments/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryCommentsRequest,
      queryParameters: queryParams,
    );

    return QueryCommentsResponse.fromJson(response.data);
  }

  Future<QueryFeedMembersResponse> queryFeedMembers(
    String feedGroupId,
    String feedId,
    QueryFeedMembersRequest? queryFeedMembersRequest,
  ) async {
    var path =
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

  Future<QueryFollowsResponse> queryFollows(
    QueryFollowsRequest? queryFollowsRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/query";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: queryFollowsRequest,
      queryParameters: queryParams,
    );

    return QueryFollowsResponse.fromJson(response.data);
  }

  Future<RejectFeedMemberInviteResponse> rejectFeedMemberInvite(
    String feedGroupId,
    String feedId,
  ) async {
    var path =
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

  Future<RejectFollowResponse> rejectFollow(
    RejectFollowRequest rejectFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/reject";

    final queryParams = <String, Object?>{};

    final response = await apiClient.post(
      path,
      data: rejectFollowRequest,
      queryParameters: queryParams,
    );

    return RejectFollowResponse.fromJson(response.data);
  }

  Future<DurationResponse> stopWatchingFeed(
    String feedGroupId,
    String feedId,
  ) async {
    var path =
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

  Future<UnfollowResponse> unfollow(
    String source,
    String target,
  ) async {
    var path = r"/api/v2/feeds/follows/{source}/{target}"
        .replaceAll('{source}', source)
        .replaceAll('{target}', target);

    final queryParams = <String, Object?>{};

    final response = await apiClient.delete(
      path,
      queryParameters: queryParams,
    );

    return UnfollowResponse.fromJson(response.data);
  }

  Future<UnpinActivityResponse> unpinActivity(
    String feedGroupId,
    String feedId,
    String activityId,
  ) async {
    var path =
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

  Future<UpdateActivityResponse> updateActivity(
    String activityId,
    UpdateActivityRequest? updateActivityRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.put(
      path,
      data: updateActivityRequest,
      queryParameters: queryParams,
    );

    return UpdateActivityResponse.fromJson(response.data);
  }

  Future<UpdateActivityPartialResponse> updateActivityPartial(
    String activityId,
    UpdateActivityPartialRequest? updateActivityPartialRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateActivityPartialRequest,
      queryParameters: queryParams,
    );

    return UpdateActivityPartialResponse.fromJson(response.data);
  }

  Future<UpdateBookmarkResponse> updateBookmark(
    String activityId,
    UpdateBookmarkRequest? updateBookmarkRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateBookmarkRequest,
      queryParameters: queryParams,
    );

    return UpdateBookmarkResponse.fromJson(response.data);
  }

  Future<UpdateBookmarkFolderResponse> updateBookmarkFolder(
    String folderId,
    UpdateBookmarkFolderRequest? updateBookmarkFolderRequest,
  ) async {
    var path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateBookmarkFolderRequest,
      queryParameters: queryParams,
    );

    return UpdateBookmarkFolderResponse.fromJson(response.data);
  }

  Future<UpdateCommentResponse> updateComment(
    String commentId,
    UpdateCommentRequest? updateCommentRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateCommentRequest,
      queryParameters: queryParams,
    );

    return UpdateCommentResponse.fromJson(response.data);
  }

  Future<UpdateFeedResponse> updateFeed(
    String feedGroupId,
    String feedId,
    UpdateFeedRequest? updateFeedRequest,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
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

  Future<UpdateFeedMembersResponse> updateFeedMembers(
    String feedGroupId,
    String feedId,
    UpdateFeedMembersRequest updateFeedMembersRequest,
  ) async {
    var path =
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

  Future<UpdateFollowResponse> updateFollow(
    UpdateFollowRequest updateFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <String, Object?>{};

    final response = await apiClient.patch(
      path,
      data: updateFollowRequest,
      queryParameters: queryParams,
    );

    return UpdateFollowResponse.fromJson(response.data);
  }

  Future<UpsertActivitiesResponse> upsertActivities(
    UpsertActivitiesRequest upsertActivitiesRequest,
  ) async {
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
