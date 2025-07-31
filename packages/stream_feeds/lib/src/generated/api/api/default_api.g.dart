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
  DefaultApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  Future<T?> invokeAPI<T>(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
    String returnType,
  ) async {
    final response = await apiClient.invokeAPI(
      path,
      method,
      queryParams,
      body,
      headerParams,
      formParams,
      contentType,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (returnType != 'void' &&
        response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        returnType,
      ) as T;
    }
    return null;
  }

  Future<AcceptFeedMemberInviteResponse?> acceptFeedMemberInvite(
    String feedId,
    String feedGroupId,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/accept"
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{feed_group_id}', feedGroupId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AcceptFeedMemberInviteResponse',
    );
  }

  Future<AcceptFollowResponse?> acceptFollow(
    AcceptFollowRequest acceptFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/accept";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      acceptFollowRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AcceptFollowResponse',
    );
  }

  Future<AddActivityResponse?> addActivity(
    AddActivityRequest addActivityRequest,
  ) async {
    const path = r"/api/v2/feeds/activities";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addActivityRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddActivityResponse',
    );
  }

  Future<AddBookmarkResponse?> addBookmark(
    String activityId,
    AddBookmarkRequest? addBookmarkRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addBookmarkRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddBookmarkResponse',
    );
  }

  Future<AddCommentResponse?> addComment(
    AddCommentRequest addCommentRequest,
  ) async {
    const path = r"/api/v2/feeds/comments";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addCommentRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddCommentResponse',
    );
  }

  Future<AddCommentReactionResponse?> addCommentReaction(
    String commentId,
    AddCommentReactionRequest addCommentReactionRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addCommentReactionRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddCommentReactionResponse',
    );
  }

  Future<AddCommentsBatchResponse?> addCommentsBatch(
    AddCommentsBatchRequest addCommentsBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/comments/batch";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addCommentsBatchRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddCommentsBatchResponse',
    );
  }

  Future<AddReactionResponse?> addReaction(
    String activityId,
    AddReactionRequest addReactionRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      addReactionRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'AddReactionResponse',
    );
  }

  Future<PollVoteResponse?> castPollVote(
    String activityId,
    String pollId,
    CastPollVoteRequest? castPollVoteRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/polls/{poll_id}/vote"
        .replaceAll('{activity_id}', activityId)
        .replaceAll('{poll_id}', pollId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      castPollVoteRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'PollVoteResponse',
    );
  }

  Future<CreateFeedsBatchResponse?> createFeedsBatch(
    CreateFeedsBatchRequest createFeedsBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/feeds/batch";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      createFeedsBatchRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'CreateFeedsBatchResponse',
    );
  }

  Future<DeleteActivitiesResponse?> deleteActivities(
    DeleteActivitiesRequest deleteActivitiesRequest,
  ) async {
    const path = r"/api/v2/feeds/activities/delete";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      deleteActivitiesRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteActivitiesResponse',
    );
  }

  Future<DeleteActivityResponse?> deleteActivity(
    String activityId,
    bool? hardDelete,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (hardDelete != null) {
      queryParams.addAll(_queryParams('', 'hard_delete', hardDelete));
    }

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteActivityResponse',
    );
  }

  Future<DeleteActivityReactionResponse?> deleteActivityReaction(
    String activityId,
    String type,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions/{type}"
        .replaceAll('{activity_id}', activityId)
        .replaceAll('{type}', type);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteActivityReactionResponse',
    );
  }

  Future<DeleteBookmarkResponse?> deleteBookmark(
    String activityId,
    String? folderId,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (folderId != null) {
      queryParams.addAll(_queryParams('', 'folder_id', folderId));
    }

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteBookmarkResponse',
    );
  }

  Future<DeleteBookmarkFolderResponse?> deleteBookmarkFolder(
    String folderId,
  ) async {
    var path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteBookmarkFolderResponse',
    );
  }

  Future<DeleteCommentResponse?> deleteComment(
    String commentId,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteCommentResponse',
    );
  }

  Future<DeleteCommentReactionResponse?> deleteCommentReaction(
    String commentId,
    String type,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions/{type}"
        .replaceAll('{comment_id}', commentId)
        .replaceAll('{type}', type);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteCommentReactionResponse',
    );
  }

  Future<DeleteFeedResponse?> deleteFeed(
    String feedGroupId,
    String feedId,
    bool? hardDelete,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (hardDelete != null) {
      queryParams.addAll(_queryParams('', 'hard_delete', hardDelete));
    }

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DeleteFeedResponse',
    );
  }

  Future<PollVoteResponse?> deletePollVote(
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

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (userId != null) {
      queryParams.addAll(_queryParams('', 'user_id', userId));
    }

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'PollVoteResponse',
    );
  }

  Future<QueryFeedsResponse?> feedsQueryFeeds(
    QueryFeedsRequest? queryFeedsRequest,
  ) async {
    const path = r"/api/v2/feeds/feeds/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryFeedsRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryFeedsResponse',
    );
  }

  Future<SingleFollowResponse?> follow(
    SingleFollowRequest singleFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      singleFollowRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'SingleFollowResponse',
    );
  }

  Future<FollowBatchResponse?> followBatch(
    FollowBatchRequest followBatchRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/batch";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      followBatchRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'FollowBatchResponse',
    );
  }

  Future<GetActivityResponse?> getActivity(
    String activityId,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'GET',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetActivityResponse',
    );
  }

  Future<GetCommentResponse?> getComment(
    String commentId,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'GET',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetCommentResponse',
    );
  }

  Future<GetCommentRepliesResponse?> getCommentReplies(
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

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (repliesLimit != null) {
      queryParams.addAll(_queryParams('', 'replies_limit', repliesLimit));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (prev != null) {
      queryParams.addAll(_queryParams('', 'prev', prev));
    }
    if (next != null) {
      queryParams.addAll(_queryParams('', 'next', next));
    }

    return invokeAPI(
      path,
      'GET',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetCommentRepliesResponse',
    );
  }

  Future<GetCommentsResponse?> getComments(
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

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];
    queryParams.addAll(_queryParams('', 'object_id', objectId));
    queryParams.addAll(_queryParams('', 'object_type', objectType));
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (repliesLimit != null) {
      queryParams.addAll(_queryParams('', 'replies_limit', repliesLimit));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (prev != null) {
      queryParams.addAll(_queryParams('', 'prev', prev));
    }
    if (next != null) {
      queryParams.addAll(_queryParams('', 'next', next));
    }

    return invokeAPI(
      path,
      'GET',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetCommentsResponse',
    );
  }

  Future<GetFollowSuggestionsResponse?> getFollowSuggestions(
    String feedGroupId,
    int? limit,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/follow_suggestions"
        .replaceAll('{feed_group_id}', feedGroupId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }

    return invokeAPI(
      path,
      'GET',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetFollowSuggestionsResponse',
    );
  }

  Future<GetOrCreateFeedResponse?> getOrCreateFeed(
    String feedGroupId,
    String feedId,
    GetOrCreateFeedRequest? getOrCreateFeedRequest,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      getOrCreateFeedRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'GetOrCreateFeedResponse',
    );
  }

  Future<DurationResponse?> markActivity(
    String feedGroupId,
    String feedId,
    MarkActivityRequest? markActivityRequest,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/mark/batch"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      markActivityRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DurationResponse',
    );
  }

  Future<PinActivityResponse?> pinActivity(
    String feedGroupId,
    String feedId,
    String activityId,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/{activity_id}/pin"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'PinActivityResponse',
    );
  }

  Future<QueryActivitiesResponse?> queryActivities(
    QueryActivitiesRequest? queryActivitiesRequest,
  ) async {
    const path = r"/api/v2/feeds/activities/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryActivitiesRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryActivitiesResponse',
    );
  }

  Future<QueryActivityReactionsResponse?> queryActivityReactions(
    String activityId,
    QueryActivityReactionsRequest? queryActivityReactionsRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/reactions/query"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryActivityReactionsRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryActivityReactionsResponse',
    );
  }

  Future<QueryBookmarkFoldersResponse?> queryBookmarkFolders(
    QueryBookmarkFoldersRequest? queryBookmarkFoldersRequest,
  ) async {
    const path = r"/api/v2/feeds/bookmark_folders/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryBookmarkFoldersRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryBookmarkFoldersResponse',
    );
  }

  Future<QueryBookmarksResponse?> queryBookmarks(
    QueryBookmarksRequest? queryBookmarksRequest,
  ) async {
    const path = r"/api/v2/feeds/bookmarks/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryBookmarksRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryBookmarksResponse',
    );
  }

  Future<QueryCommentReactionsResponse?> queryCommentReactions(
    String commentId,
    QueryCommentReactionsRequest? queryCommentReactionsRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}/reactions/query"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryCommentReactionsRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryCommentReactionsResponse',
    );
  }

  Future<QueryCommentsResponse?> queryComments(
    QueryCommentsRequest queryCommentsRequest,
  ) async {
    const path = r"/api/v2/feeds/comments/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryCommentsRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryCommentsResponse',
    );
  }

  Future<QueryFeedMembersResponse?> queryFeedMembers(
    String feedGroupId,
    String feedId,
    QueryFeedMembersRequest? queryFeedMembersRequest,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/query"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryFeedMembersRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryFeedMembersResponse',
    );
  }

  Future<QueryFollowsResponse?> queryFollows(
    QueryFollowsRequest? queryFollowsRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/query";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      queryFollowsRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'QueryFollowsResponse',
    );
  }

  Future<RejectFeedMemberInviteResponse?> rejectFeedMemberInvite(
    String feedGroupId,
    String feedId,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members/reject"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'RejectFeedMemberInviteResponse',
    );
  }

  Future<RejectFollowResponse?> rejectFollow(
    RejectFollowRequest rejectFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows/reject";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      rejectFollowRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'RejectFollowResponse',
    );
  }

  Future<DurationResponse?> stopWatchingFeed(
    String feedGroupId,
    String feedId,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/watch"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'DurationResponse',
    );
  }

  Future<UnfollowResponse?> unfollow(
    String source,
    String target,
  ) async {
    var path = r"/api/v2/feeds/follows/{source}/{target}"
        .replaceAll('{source}', source)
        .replaceAll('{target}', target);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UnfollowResponse',
    );
  }

  Future<UnpinActivityResponse?> unpinActivity(
    String feedGroupId,
    String feedId,
    String activityId,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/activities/{activity_id}/pin"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId)
            .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'DELETE',
      queryParams,
      null,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UnpinActivityResponse',
    );
  }

  Future<UpdateActivityResponse?> updateActivity(
    String activityId,
    UpdateActivityRequest? updateActivityRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PUT',
      queryParams,
      updateActivityRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateActivityResponse',
    );
  }

  Future<UpdateActivityPartialResponse?> updateActivityPartial(
    String activityId,
    UpdateActivityPartialRequest? updateActivityPartialRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateActivityPartialRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateActivityPartialResponse',
    );
  }

  Future<UpdateBookmarkResponse?> updateBookmark(
    String activityId,
    UpdateBookmarkRequest? updateBookmarkRequest,
  ) async {
    var path = r"/api/v2/feeds/activities/{activity_id}/bookmarks"
        .replaceAll('{activity_id}', activityId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateBookmarkRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateBookmarkResponse',
    );
  }

  Future<UpdateBookmarkFolderResponse?> updateBookmarkFolder(
    String folderId,
    UpdateBookmarkFolderRequest? updateBookmarkFolderRequest,
  ) async {
    var path = r"/api/v2/feeds/bookmark_folders/{folder_id}"
        .replaceAll('{folder_id}', folderId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateBookmarkFolderRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateBookmarkFolderResponse',
    );
  }

  Future<UpdateCommentResponse?> updateComment(
    String commentId,
    UpdateCommentRequest? updateCommentRequest,
  ) async {
    var path = r"/api/v2/feeds/comments/{comment_id}"
        .replaceAll('{comment_id}', commentId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateCommentRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateCommentResponse',
    );
  }

  Future<UpdateFeedResponse?> updateFeed(
    String feedGroupId,
    String feedId,
    UpdateFeedRequest? updateFeedRequest,
  ) async {
    var path = r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}"
        .replaceAll('{feed_group_id}', feedGroupId)
        .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PUT',
      queryParams,
      updateFeedRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateFeedResponse',
    );
  }

  Future<UpdateFeedMembersResponse?> updateFeedMembers(
    String feedGroupId,
    String feedId,
    UpdateFeedMembersRequest updateFeedMembersRequest,
  ) async {
    var path =
        r"/api/v2/feeds/feed_groups/{feed_group_id}/feeds/{feed_id}/members"
            .replaceAll('{feed_group_id}', feedGroupId)
            .replaceAll('{feed_id}', feedId);

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateFeedMembersRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateFeedMembersResponse',
    );
  }

  Future<UpdateFollowResponse?> updateFollow(
    UpdateFollowRequest updateFollowRequest,
  ) async {
    const path = r"/api/v2/feeds/follows";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'PATCH',
      queryParams,
      updateFollowRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpdateFollowResponse',
    );
  }

  Future<UpsertActivitiesResponse?> upsertActivities(
    UpsertActivitiesRequest upsertActivitiesRequest,
  ) async {
    const path = r"/api/v2/feeds/activities/batch";

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>[];

    return invokeAPI(
      path,
      'POST',
      queryParams,
      upsertActivitiesRequest,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      'UpsertActivitiesResponse',
    );
  }
}
