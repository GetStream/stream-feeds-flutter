// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _DefaultApi implements DefaultApi {
  _DefaultApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<AcceptFeedMemberInviteResponse> _acceptFeedMemberInvite({
    required String feedId,
    required String feedGroupId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<AcceptFeedMemberInviteResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/members/accept',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AcceptFeedMemberInviteResponse _value;
    try {
      _value = AcceptFeedMemberInviteResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AcceptFeedMemberInviteResponse>> acceptFeedMemberInvite({
    required String feedId,
    required String feedGroupId,
  }) {
    return _ResultCallAdapter<AcceptFeedMemberInviteResponse>().adapt(
      () => _acceptFeedMemberInvite(feedId: feedId, feedGroupId: feedGroupId),
    );
  }

  Future<AcceptFollowResponse> _acceptFollow({
    required AcceptFollowRequest acceptFollowRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(acceptFollowRequest.toJson());
    final _options = _setStreamType<Result<AcceptFollowResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows/accept',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AcceptFollowResponse _value;
    try {
      _value = AcceptFollowResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AcceptFollowResponse>> acceptFollow({
    required AcceptFollowRequest acceptFollowRequest,
  }) {
    return _ResultCallAdapter<AcceptFollowResponse>().adapt(
      () => _acceptFollow(acceptFollowRequest: acceptFollowRequest),
    );
  }

  Future<ActivityFeedbackResponse> _activityFeedback({
    required String activityId,
    ActivityFeedbackRequest? activityFeedbackRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(activityFeedbackRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<ActivityFeedbackResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/feedback',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ActivityFeedbackResponse _value;
    try {
      _value = ActivityFeedbackResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ActivityFeedbackResponse>> activityFeedback({
    required String activityId,
    ActivityFeedbackRequest? activityFeedbackRequest,
  }) {
    return _ResultCallAdapter<ActivityFeedbackResponse>().adapt(
      () => _activityFeedback(
        activityId: activityId,
        activityFeedbackRequest: activityFeedbackRequest,
      ),
    );
  }

  Future<AddActivityResponse> _addActivity({
    required AddActivityRequest addActivityRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addActivityRequest.toJson());
    final _options = _setStreamType<Result<AddActivityResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddActivityResponse _value;
    try {
      _value = AddActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddActivityResponse>> addActivity({
    required AddActivityRequest addActivityRequest,
  }) {
    return _ResultCallAdapter<AddActivityResponse>().adapt(
      () => _addActivity(addActivityRequest: addActivityRequest),
    );
  }

  Future<AddReactionResponse> _addActivityReaction({
    required String activityId,
    required AddReactionRequest addReactionRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addReactionRequest.toJson());
    final _options = _setStreamType<Result<AddReactionResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/reactions',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddReactionResponse _value;
    try {
      _value = AddReactionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddReactionResponse>> addActivityReaction({
    required String activityId,
    required AddReactionRequest addReactionRequest,
  }) {
    return _ResultCallAdapter<AddReactionResponse>().adapt(
      () => _addActivityReaction(
        activityId: activityId,
        addReactionRequest: addReactionRequest,
      ),
    );
  }

  Future<AddBookmarkResponse> _addBookmark({
    required String activityId,
    AddBookmarkRequest? addBookmarkRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addBookmarkRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<AddBookmarkResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/bookmarks',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddBookmarkResponse _value;
    try {
      _value = AddBookmarkResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddBookmarkResponse>> addBookmark({
    required String activityId,
    AddBookmarkRequest? addBookmarkRequest,
  }) {
    return _ResultCallAdapter<AddBookmarkResponse>().adapt(
      () => _addBookmark(
        activityId: activityId,
        addBookmarkRequest: addBookmarkRequest,
      ),
    );
  }

  Future<AddCommentResponse> _addComment({
    required AddCommentRequest addCommentRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addCommentRequest.toJson());
    final _options = _setStreamType<Result<AddCommentResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddCommentResponse _value;
    try {
      _value = AddCommentResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddCommentResponse>> addComment({
    required AddCommentRequest addCommentRequest,
  }) {
    return _ResultCallAdapter<AddCommentResponse>().adapt(
      () => _addComment(addCommentRequest: addCommentRequest),
    );
  }

  Future<AddCommentReactionResponse> _addCommentReaction({
    required String id,
    required AddCommentReactionRequest addCommentReactionRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addCommentReactionRequest.toJson());
    final _options = _setStreamType<Result<AddCommentReactionResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}/reactions',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddCommentReactionResponse _value;
    try {
      _value = AddCommentReactionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddCommentReactionResponse>> addCommentReaction({
    required String id,
    required AddCommentReactionRequest addCommentReactionRequest,
  }) {
    return _ResultCallAdapter<AddCommentReactionResponse>().adapt(
      () => _addCommentReaction(
        id: id,
        addCommentReactionRequest: addCommentReactionRequest,
      ),
    );
  }

  Future<AddCommentsBatchResponse> _addCommentsBatch({
    required AddCommentsBatchRequest addCommentsBatchRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addCommentsBatchRequest.toJson());
    final _options = _setStreamType<Result<AddCommentsBatchResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddCommentsBatchResponse _value;
    try {
      _value = AddCommentsBatchResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<AddCommentsBatchResponse>> addCommentsBatch({
    required AddCommentsBatchRequest addCommentsBatchRequest,
  }) {
    return _ResultCallAdapter<AddCommentsBatchResponse>().adapt(
      () => _addCommentsBatch(addCommentsBatchRequest: addCommentsBatchRequest),
    );
  }

  Future<BanResponse> _ban({required BanRequest banRequest}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(banRequest.toJson());
    final _options = _setStreamType<Result<BanResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/ban',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BanResponse _value;
    try {
      _value = BanResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<BanResponse>> ban({required BanRequest banRequest}) {
    return _ResultCallAdapter<BanResponse>().adapt(
      () => _ban(banRequest: banRequest),
    );
  }

  Future<BlockUsersResponse> _blockUsers({
    required BlockUsersRequest blockUsersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(blockUsersRequest.toJson());
    final _options = _setStreamType<Result<BlockUsersResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users/block',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BlockUsersResponse _value;
    try {
      _value = BlockUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<BlockUsersResponse>> blockUsers({
    required BlockUsersRequest blockUsersRequest,
  }) {
    return _ResultCallAdapter<BlockUsersResponse>().adapt(
      () => _blockUsers(blockUsersRequest: blockUsersRequest),
    );
  }

  Future<PollVoteResponse> _castPollVote({
    required String activityId,
    required String pollId,
    CastPollVoteRequest? castPollVoteRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(castPollVoteRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<PollVoteResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/polls/${pollId}/vote',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollVoteResponse _value;
    try {
      _value = PollVoteResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollVoteResponse>> castPollVote({
    required String activityId,
    required String pollId,
    CastPollVoteRequest? castPollVoteRequest,
  }) {
    return _ResultCallAdapter<PollVoteResponse>().adapt(
      () => _castPollVote(
        activityId: activityId,
        pollId: pollId,
        castPollVoteRequest: castPollVoteRequest,
      ),
    );
  }

  Future<CreateBlockListResponse> _createBlockList({
    required CreateBlockListRequest createBlockListRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createBlockListRequest.toJson());
    final _options = _setStreamType<Result<CreateBlockListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/blocklists',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateBlockListResponse _value;
    try {
      _value = CreateBlockListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<CreateBlockListResponse>> createBlockList({
    required CreateBlockListRequest createBlockListRequest,
  }) {
    return _ResultCallAdapter<CreateBlockListResponse>().adapt(
      () => _createBlockList(createBlockListRequest: createBlockListRequest),
    );
  }

  Future<DurationResponse> _createDevice({
    required CreateDeviceRequest createDeviceRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createDeviceRequest.toJson());
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/devices',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> createDevice({
    required CreateDeviceRequest createDeviceRequest,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _createDevice(createDeviceRequest: createDeviceRequest),
    );
  }

  Future<CreateFeedsBatchResponse> _createFeedsBatch({
    required CreateFeedsBatchRequest createFeedsBatchRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createFeedsBatchRequest.toJson());
    final _options = _setStreamType<Result<CreateFeedsBatchResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feeds/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateFeedsBatchResponse _value;
    try {
      _value = CreateFeedsBatchResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<CreateFeedsBatchResponse>> createFeedsBatch({
    required CreateFeedsBatchRequest createFeedsBatchRequest,
  }) {
    return _ResultCallAdapter<CreateFeedsBatchResponse>().adapt(
      () => _createFeedsBatch(createFeedsBatchRequest: createFeedsBatchRequest),
    );
  }

  Future<CreateGuestResponse> _createGuest({
    required CreateGuestRequest createGuestRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createGuestRequest.toJson());
    final _options = _setStreamType<Result<CreateGuestResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/guest',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateGuestResponse _value;
    try {
      _value = CreateGuestResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<CreateGuestResponse>> createGuest({
    required CreateGuestRequest createGuestRequest,
  }) {
    return _ResultCallAdapter<CreateGuestResponse>().adapt(
      () => _createGuest(createGuestRequest: createGuestRequest),
    );
  }

  Future<PollResponse> _createPoll({
    required CreatePollRequest createPollRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createPollRequest.toJson());
    final _options = _setStreamType<Result<PollResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollResponse _value;
    try {
      _value = PollResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollResponse>> createPoll({
    required CreatePollRequest createPollRequest,
  }) {
    return _ResultCallAdapter<PollResponse>().adapt(
      () => _createPoll(createPollRequest: createPollRequest),
    );
  }

  Future<PollOptionResponse> _createPollOption({
    required String pollId,
    required CreatePollOptionRequest createPollOptionRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createPollOptionRequest.toJson());
    final _options = _setStreamType<Result<PollOptionResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}/options',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollOptionResponse _value;
    try {
      _value = PollOptionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollOptionResponse>> createPollOption({
    required String pollId,
    required CreatePollOptionRequest createPollOptionRequest,
  }) {
    return _ResultCallAdapter<PollOptionResponse>().adapt(
      () => _createPollOption(
        pollId: pollId,
        createPollOptionRequest: createPollOptionRequest,
      ),
    );
  }

  Future<DeleteActivitiesResponse> _deleteActivities({
    required DeleteActivitiesRequest deleteActivitiesRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(deleteActivitiesRequest.toJson());
    final _options = _setStreamType<Result<DeleteActivitiesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/delete',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteActivitiesResponse _value;
    try {
      _value = DeleteActivitiesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteActivitiesResponse>> deleteActivities({
    required DeleteActivitiesRequest deleteActivitiesRequest,
  }) {
    return _ResultCallAdapter<DeleteActivitiesResponse>().adapt(
      () => _deleteActivities(deleteActivitiesRequest: deleteActivitiesRequest),
    );
  }

  Future<DeleteActivityResponse> _deleteActivity({
    required String id,
    bool? hardDelete,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'hard_delete': hardDelete};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteActivityResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteActivityResponse _value;
    try {
      _value = DeleteActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteActivityResponse>> deleteActivity({
    required String id,
    bool? hardDelete,
  }) {
    return _ResultCallAdapter<DeleteActivityResponse>().adapt(
      () => _deleteActivity(id: id, hardDelete: hardDelete),
    );
  }

  Future<DeleteActivityReactionResponse> _deleteActivityReaction({
    required String activityId,
    required String type,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteActivityReactionResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/reactions/${type}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteActivityReactionResponse _value;
    try {
      _value = DeleteActivityReactionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteActivityReactionResponse>> deleteActivityReaction({
    required String activityId,
    required String type,
  }) {
    return _ResultCallAdapter<DeleteActivityReactionResponse>().adapt(
      () => _deleteActivityReaction(activityId: activityId, type: type),
    );
  }

  Future<DurationResponse> _deleteBlockList({
    required String name,
    String? team,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'team': team};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/blocklists/${name}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteBlockList({
    required String name,
    String? team,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteBlockList(name: name, team: team),
    );
  }

  Future<DeleteBookmarkResponse> _deleteBookmark({
    required String activityId,
    String? folderId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'folder_id': folderId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteBookmarkResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/bookmarks',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteBookmarkResponse _value;
    try {
      _value = DeleteBookmarkResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteBookmarkResponse>> deleteBookmark({
    required String activityId,
    String? folderId,
  }) {
    return _ResultCallAdapter<DeleteBookmarkResponse>().adapt(
      () => _deleteBookmark(activityId: activityId, folderId: folderId),
    );
  }

  Future<DeleteBookmarkFolderResponse> _deleteBookmarkFolder({
    required String folderId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteBookmarkFolderResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/bookmark_folders/${folderId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteBookmarkFolderResponse _value;
    try {
      _value = DeleteBookmarkFolderResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteBookmarkFolderResponse>> deleteBookmarkFolder({
    required String folderId,
  }) {
    return _ResultCallAdapter<DeleteBookmarkFolderResponse>().adapt(
      () => _deleteBookmarkFolder(folderId: folderId),
    );
  }

  Future<DeleteCommentResponse> _deleteComment({
    required String id,
    bool? hardDelete,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'hard_delete': hardDelete};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteCommentResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteCommentResponse _value;
    try {
      _value = DeleteCommentResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteCommentResponse>> deleteComment({
    required String id,
    bool? hardDelete,
  }) {
    return _ResultCallAdapter<DeleteCommentResponse>().adapt(
      () => _deleteComment(id: id, hardDelete: hardDelete),
    );
  }

  Future<DeleteCommentReactionResponse> _deleteCommentReaction({
    required String id,
    required String type,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteCommentReactionResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}/reactions/${type}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteCommentReactionResponse _value;
    try {
      _value = DeleteCommentReactionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteCommentReactionResponse>> deleteCommentReaction({
    required String id,
    required String type,
  }) {
    return _ResultCallAdapter<DeleteCommentReactionResponse>().adapt(
      () => _deleteCommentReaction(id: id, type: type),
    );
  }

  Future<DeleteModerationConfigResponse> _deleteConfig({
    required String key,
    String? team,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'team': team};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteModerationConfigResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/config/${key}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteModerationConfigResponse _value;
    try {
      _value = DeleteModerationConfigResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteModerationConfigResponse>> deleteConfig({
    required String key,
    String? team,
  }) {
    return _ResultCallAdapter<DeleteModerationConfigResponse>().adapt(
      () => _deleteConfig(key: key, team: team),
    );
  }

  Future<DurationResponse> _deleteDevice({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/devices',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteDevice({required String id}) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteDevice(id: id),
    );
  }

  Future<DeleteFeedResponse> _deleteFeed({
    required String feedGroupId,
    required String feedId,
    bool? hardDelete,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'hard_delete': hardDelete};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DeleteFeedResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteFeedResponse _value;
    try {
      _value = DeleteFeedResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DeleteFeedResponse>> deleteFeed({
    required String feedGroupId,
    required String feedId,
    bool? hardDelete,
  }) {
    return _ResultCallAdapter<DeleteFeedResponse>().adapt(
      () => _deleteFeed(
        feedGroupId: feedGroupId,
        feedId: feedId,
        hardDelete: hardDelete,
      ),
    );
  }

  Future<DurationResponse> _deleteFile({String? url}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/file',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteFile({String? url}) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteFile(url: url),
    );
  }

  Future<DurationResponse> _deleteImage({String? url}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/image',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteImage({String? url}) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteImage(url: url),
    );
  }

  Future<DurationResponse> _deletePoll({
    required String pollId,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deletePoll({
    required String pollId,
    String? userId,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deletePoll(pollId: pollId, userId: userId),
    );
  }

  Future<DurationResponse> _deletePollOption({
    required String pollId,
    required String optionId,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}/options/${optionId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deletePollOption({
    required String pollId,
    required String optionId,
    String? userId,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () =>
          _deletePollOption(pollId: pollId, optionId: optionId, userId: userId),
    );
  }

  Future<PollVoteResponse> _deletePollVote({
    required String activityId,
    required String pollId,
    required String voteId,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<PollVoteResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/polls/${pollId}/vote/${voteId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollVoteResponse _value;
    try {
      _value = PollVoteResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollVoteResponse>> deletePollVote({
    required String activityId,
    required String pollId,
    required String voteId,
    String? userId,
  }) {
    return _ResultCallAdapter<PollVoteResponse>().adapt(
      () => _deletePollVote(
        activityId: activityId,
        pollId: pollId,
        voteId: voteId,
        userId: userId,
      ),
    );
  }

  Future<FlagResponse> _flag({required FlagRequest flagRequest}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(flagRequest.toJson());
    final _options = _setStreamType<Result<FlagResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/flag',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FlagResponse _value;
    try {
      _value = FlagResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<FlagResponse>> flag({required FlagRequest flagRequest}) {
    return _ResultCallAdapter<FlagResponse>().adapt(
      () => _flag(flagRequest: flagRequest),
    );
  }

  Future<SingleFollowResponse> _follow({
    required FollowRequest followRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(followRequest.toJson());
    final _options = _setStreamType<Result<SingleFollowResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SingleFollowResponse _value;
    try {
      _value = SingleFollowResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<SingleFollowResponse>> follow({
    required FollowRequest followRequest,
  }) {
    return _ResultCallAdapter<SingleFollowResponse>().adapt(
      () => _follow(followRequest: followRequest),
    );
  }

  Future<FollowBatchResponse> _followBatch({
    required FollowBatchRequest followBatchRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(followBatchRequest.toJson());
    final _options = _setStreamType<Result<FollowBatchResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FollowBatchResponse _value;
    try {
      _value = FollowBatchResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<FollowBatchResponse>> followBatch({
    required FollowBatchRequest followBatchRequest,
  }) {
    return _ResultCallAdapter<FollowBatchResponse>().adapt(
      () => _followBatch(followBatchRequest: followBatchRequest),
    );
  }

  Future<GetActivityResponse> _getActivity({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetActivityResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetActivityResponse _value;
    try {
      _value = GetActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetActivityResponse>> getActivity({required String id}) {
    return _ResultCallAdapter<GetActivityResponse>().adapt(
      () => _getActivity(id: id),
    );
  }

  Future<GetApplicationResponse> _getApp() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetApplicationResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/app',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetApplicationResponse _value;
    try {
      _value = GetApplicationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetApplicationResponse>> getApp() {
    return _ResultCallAdapter<GetApplicationResponse>().adapt(() => _getApp());
  }

  Future<GetBlockedUsersResponse> _getBlockedUsers() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetBlockedUsersResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users/block',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetBlockedUsersResponse _value;
    try {
      _value = GetBlockedUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetBlockedUsersResponse>> getBlockedUsers() {
    return _ResultCallAdapter<GetBlockedUsersResponse>().adapt(
      () => _getBlockedUsers(),
    );
  }

  Future<GetCommentResponse> _getComment({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetCommentResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetCommentResponse _value;
    try {
      _value = GetCommentResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetCommentResponse>> getComment({required String id}) {
    return _ResultCallAdapter<GetCommentResponse>().adapt(
      () => _getComment(id: id),
    );
  }

  Future<GetCommentRepliesResponse> _getCommentReplies({
    required String id,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'depth': depth,
      r'sort': sort,
      r'replies_limit': repliesLimit,
      r'limit': limit,
      r'prev': prev,
      r'next': next,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetCommentRepliesResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}/replies',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetCommentRepliesResponse _value;
    try {
      _value = GetCommentRepliesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetCommentRepliesResponse>> getCommentReplies({
    required String id,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) {
    return _ResultCallAdapter<GetCommentRepliesResponse>().adapt(
      () => _getCommentReplies(
        id: id,
        depth: depth,
        sort: sort,
        repliesLimit: repliesLimit,
        limit: limit,
        prev: prev,
        next: next,
      ),
    );
  }

  Future<GetCommentsResponse> _getComments({
    required String objectId,
    required String objectType,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'object_id': objectId,
      r'object_type': objectType,
      r'depth': depth,
      r'sort': sort,
      r'replies_limit': repliesLimit,
      r'limit': limit,
      r'prev': prev,
      r'next': next,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetCommentsResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetCommentsResponse _value;
    try {
      _value = GetCommentsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetCommentsResponse>> getComments({
    required String objectId,
    required String objectType,
    int? depth,
    String? sort,
    int? repliesLimit,
    int? limit,
    String? prev,
    String? next,
  }) {
    return _ResultCallAdapter<GetCommentsResponse>().adapt(
      () => _getComments(
        objectId: objectId,
        objectType: objectType,
        depth: depth,
        sort: sort,
        repliesLimit: repliesLimit,
        limit: limit,
        prev: prev,
        next: next,
      ),
    );
  }

  Future<GetConfigResponse> _getConfig({
    required String key,
    String? team,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'team': team};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetConfigResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/config/${key}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetConfigResponse _value;
    try {
      _value = GetConfigResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetConfigResponse>> getConfig({
    required String key,
    String? team,
  }) {
    return _ResultCallAdapter<GetConfigResponse>().adapt(
      () => _getConfig(key: key, team: team),
    );
  }

  Future<GetFollowSuggestionsResponse> _getFollowSuggestions({
    required String feedGroupId,
    int? limit,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'limit': limit};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetFollowSuggestionsResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/follow_suggestions',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetFollowSuggestionsResponse _value;
    try {
      _value = GetFollowSuggestionsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetFollowSuggestionsResponse>> getFollowSuggestions({
    required String feedGroupId,
    int? limit,
  }) {
    return _ResultCallAdapter<GetFollowSuggestionsResponse>().adapt(
      () => _getFollowSuggestions(feedGroupId: feedGroupId, limit: limit),
    );
  }

  Future<GetOGResponse> _getOG({required String url}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<GetOGResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/og',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetOGResponse _value;
    try {
      _value = GetOGResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetOGResponse>> getOG({required String url}) {
    return _ResultCallAdapter<GetOGResponse>().adapt(() => _getOG(url: url));
  }

  Future<GetOrCreateFeedResponse> _getOrCreateFeed({
    required String feedGroupId,
    required String feedId,
    GetOrCreateFeedRequest? getOrCreateFeedRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(getOrCreateFeedRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<GetOrCreateFeedResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetOrCreateFeedResponse _value;
    try {
      _value = GetOrCreateFeedResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<GetOrCreateFeedResponse>> getOrCreateFeed({
    required String feedGroupId,
    required String feedId,
    GetOrCreateFeedRequest? getOrCreateFeedRequest,
  }) {
    return _ResultCallAdapter<GetOrCreateFeedResponse>().adapt(
      () => _getOrCreateFeed(
        feedGroupId: feedGroupId,
        feedId: feedId,
        getOrCreateFeedRequest: getOrCreateFeedRequest,
      ),
    );
  }

  Future<PollResponse> _getPoll({
    required String pollId,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<PollResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollResponse _value;
    try {
      _value = PollResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollResponse>> getPoll({
    required String pollId,
    String? userId,
  }) {
    return _ResultCallAdapter<PollResponse>().adapt(
      () => _getPoll(pollId: pollId, userId: userId),
    );
  }

  Future<PollOptionResponse> _getPollOption({
    required String pollId,
    required String optionId,
    String? userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<PollOptionResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}/options/${optionId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollOptionResponse _value;
    try {
      _value = PollOptionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollOptionResponse>> getPollOption({
    required String pollId,
    required String optionId,
    String? userId,
  }) {
    return _ResultCallAdapter<PollOptionResponse>().adapt(
      () => _getPollOption(pollId: pollId, optionId: optionId, userId: userId),
    );
  }

  Future<SharedLocationsResponse> _getUserLiveLocations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<SharedLocationsResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users/live_locations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SharedLocationsResponse _value;
    try {
      _value = SharedLocationsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<SharedLocationsResponse>> getUserLiveLocations() {
    return _ResultCallAdapter<SharedLocationsResponse>().adapt(
      () => _getUserLiveLocations(),
    );
  }

  Future<ListBlockListResponse> _listBlockLists({String? team}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'team': team};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ListBlockListResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/blocklists',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListBlockListResponse _value;
    try {
      _value = ListBlockListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ListBlockListResponse>> listBlockLists({String? team}) {
    return _ResultCallAdapter<ListBlockListResponse>().adapt(
      () => _listBlockLists(team: team),
    );
  }

  Future<ListDevicesResponse> _listDevices() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ListDevicesResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/devices',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListDevicesResponse _value;
    try {
      _value = ListDevicesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ListDevicesResponse>> listDevices() {
    return _ResultCallAdapter<ListDevicesResponse>().adapt(
      () => _listDevices(),
    );
  }

  Future<void> _longPoll({WSAuthMessage? json}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'json': json?.toJson()};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<void>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/longpoll',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<Result<void>> longPoll({WSAuthMessage? json}) {
    return _ResultCallAdapter<void>().adapt(() => _longPoll(json: json));
  }

  Future<DurationResponse> _markActivity({
    required String feedGroupId,
    required String feedId,
    MarkActivityRequest? markActivityRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(markActivityRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/activities/mark/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> markActivity({
    required String feedGroupId,
    required String feedId,
    MarkActivityRequest? markActivityRequest,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _markActivity(
        feedGroupId: feedGroupId,
        feedId: feedId,
        markActivityRequest: markActivityRequest,
      ),
    );
  }

  Future<MuteResponse> _mute({required MuteRequest muteRequest}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(muteRequest.toJson());
    final _options = _setStreamType<Result<MuteResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/mute',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MuteResponse _value;
    try {
      _value = MuteResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<MuteResponse>> mute({required MuteRequest muteRequest}) {
    return _ResultCallAdapter<MuteResponse>().adapt(
      () => _mute(muteRequest: muteRequest),
    );
  }

  Future<OwnCapabilitiesBatchResponse> _ownCapabilitiesBatch({
    required OwnCapabilitiesBatchRequest ownCapabilitiesBatchRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(ownCapabilitiesBatchRequest.toJson());
    final _options = _setStreamType<Result<OwnCapabilitiesBatchResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feeds/own_capabilities/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OwnCapabilitiesBatchResponse _value;
    try {
      _value = OwnCapabilitiesBatchResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<OwnCapabilitiesBatchResponse>> ownCapabilitiesBatch({
    required OwnCapabilitiesBatchRequest ownCapabilitiesBatchRequest,
  }) {
    return _ResultCallAdapter<OwnCapabilitiesBatchResponse>().adapt(
      () => _ownCapabilitiesBatch(
        ownCapabilitiesBatchRequest: ownCapabilitiesBatchRequest,
      ),
    );
  }

  Future<PinActivityResponse> _pinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<PinActivityResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/activities/${activityId}/pin',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PinActivityResponse _value;
    try {
      _value = PinActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PinActivityResponse>> pinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) {
    return _ResultCallAdapter<PinActivityResponse>().adapt(
      () => _pinActivity(
        feedGroupId: feedGroupId,
        feedId: feedId,
        activityId: activityId,
      ),
    );
  }

  Future<QueryActivitiesResponse> _queryActivities({
    QueryActivitiesRequest? queryActivitiesRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryActivitiesRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryActivitiesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryActivitiesResponse _value;
    try {
      _value = QueryActivitiesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryActivitiesResponse>> queryActivities({
    QueryActivitiesRequest? queryActivitiesRequest,
  }) {
    return _ResultCallAdapter<QueryActivitiesResponse>().adapt(
      () => _queryActivities(queryActivitiesRequest: queryActivitiesRequest),
    );
  }

  Future<QueryActivityReactionsResponse> _queryActivityReactions({
    required String activityId,
    QueryActivityReactionsRequest? queryActivityReactionsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(
      queryActivityReactionsRequest?.toJson() ?? <String, dynamic>{},
    );
    final _options = _setStreamType<Result<QueryActivityReactionsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/reactions/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryActivityReactionsResponse _value;
    try {
      _value = QueryActivityReactionsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryActivityReactionsResponse>> queryActivityReactions({
    required String activityId,
    QueryActivityReactionsRequest? queryActivityReactionsRequest,
  }) {
    return _ResultCallAdapter<QueryActivityReactionsResponse>().adapt(
      () => _queryActivityReactions(
        activityId: activityId,
        queryActivityReactionsRequest: queryActivityReactionsRequest,
      ),
    );
  }

  Future<QueryBookmarkFoldersResponse> _queryBookmarkFolders({
    QueryBookmarkFoldersRequest? queryBookmarkFoldersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryBookmarkFoldersRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryBookmarkFoldersResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/bookmark_folders/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryBookmarkFoldersResponse _value;
    try {
      _value = QueryBookmarkFoldersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryBookmarkFoldersResponse>> queryBookmarkFolders({
    QueryBookmarkFoldersRequest? queryBookmarkFoldersRequest,
  }) {
    return _ResultCallAdapter<QueryBookmarkFoldersResponse>().adapt(
      () => _queryBookmarkFolders(
        queryBookmarkFoldersRequest: queryBookmarkFoldersRequest,
      ),
    );
  }

  Future<QueryBookmarksResponse> _queryBookmarks({
    QueryBookmarksRequest? queryBookmarksRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryBookmarksRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryBookmarksResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/bookmarks/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryBookmarksResponse _value;
    try {
      _value = QueryBookmarksResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryBookmarksResponse>> queryBookmarks({
    QueryBookmarksRequest? queryBookmarksRequest,
  }) {
    return _ResultCallAdapter<QueryBookmarksResponse>().adapt(
      () => _queryBookmarks(queryBookmarksRequest: queryBookmarksRequest),
    );
  }

  Future<QueryCommentReactionsResponse> _queryCommentReactions({
    required String id,
    QueryCommentReactionsRequest? queryCommentReactionsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryCommentReactionsRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryCommentReactionsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}/reactions/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryCommentReactionsResponse _value;
    try {
      _value = QueryCommentReactionsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryCommentReactionsResponse>> queryCommentReactions({
    required String id,
    QueryCommentReactionsRequest? queryCommentReactionsRequest,
  }) {
    return _ResultCallAdapter<QueryCommentReactionsResponse>().adapt(
      () => _queryCommentReactions(
        id: id,
        queryCommentReactionsRequest: queryCommentReactionsRequest,
      ),
    );
  }

  Future<QueryCommentsResponse> _queryComments({
    required QueryCommentsRequest queryCommentsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryCommentsRequest.toJson());
    final _options = _setStreamType<Result<QueryCommentsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryCommentsResponse _value;
    try {
      _value = QueryCommentsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryCommentsResponse>> queryComments({
    required QueryCommentsRequest queryCommentsRequest,
  }) {
    return _ResultCallAdapter<QueryCommentsResponse>().adapt(
      () => _queryComments(queryCommentsRequest: queryCommentsRequest),
    );
  }

  Future<QueryFeedMembersResponse> _queryFeedMembers({
    required String feedGroupId,
    required String feedId,
    QueryFeedMembersRequest? queryFeedMembersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryFeedMembersRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryFeedMembersResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/members/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryFeedMembersResponse _value;
    try {
      _value = QueryFeedMembersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryFeedMembersResponse>> queryFeedMembers({
    required String feedGroupId,
    required String feedId,
    QueryFeedMembersRequest? queryFeedMembersRequest,
  }) {
    return _ResultCallAdapter<QueryFeedMembersResponse>().adapt(
      () => _queryFeedMembers(
        feedGroupId: feedGroupId,
        feedId: feedId,
        queryFeedMembersRequest: queryFeedMembersRequest,
      ),
    );
  }

  Future<QueryFeedsResponse> _queryFeeds({
    QueryFeedsRequest? queryFeedsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryFeedsRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryFeedsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feeds/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryFeedsResponse _value;
    try {
      _value = QueryFeedsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryFeedsResponse>> queryFeeds({
    QueryFeedsRequest? queryFeedsRequest,
  }) {
    return _ResultCallAdapter<QueryFeedsResponse>().adapt(
      () => _queryFeeds(queryFeedsRequest: queryFeedsRequest),
    );
  }

  Future<QueryFollowsResponse> _queryFollows({
    QueryFollowsRequest? queryFollowsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryFollowsRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryFollowsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryFollowsResponse _value;
    try {
      _value = QueryFollowsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryFollowsResponse>> queryFollows({
    QueryFollowsRequest? queryFollowsRequest,
  }) {
    return _ResultCallAdapter<QueryFollowsResponse>().adapt(
      () => _queryFollows(queryFollowsRequest: queryFollowsRequest),
    );
  }

  Future<QueryModerationConfigsResponse> _queryModerationConfigs({
    QueryModerationConfigsRequest? queryModerationConfigsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(
      queryModerationConfigsRequest?.toJson() ?? <String, dynamic>{},
    );
    final _options = _setStreamType<Result<QueryModerationConfigsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/configs',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryModerationConfigsResponse _value;
    try {
      _value = QueryModerationConfigsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryModerationConfigsResponse>> queryModerationConfigs({
    QueryModerationConfigsRequest? queryModerationConfigsRequest,
  }) {
    return _ResultCallAdapter<QueryModerationConfigsResponse>().adapt(
      () => _queryModerationConfigs(
        queryModerationConfigsRequest: queryModerationConfigsRequest,
      ),
    );
  }

  Future<PollVotesResponse> _queryPollVotes({
    required String pollId,
    String? userId,
    QueryPollVotesRequest? queryPollVotesRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryPollVotesRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<PollVotesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}/votes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollVotesResponse _value;
    try {
      _value = PollVotesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollVotesResponse>> queryPollVotes({
    required String pollId,
    String? userId,
    QueryPollVotesRequest? queryPollVotesRequest,
  }) {
    return _ResultCallAdapter<PollVotesResponse>().adapt(
      () => _queryPollVotes(
        pollId: pollId,
        userId: userId,
        queryPollVotesRequest: queryPollVotesRequest,
      ),
    );
  }

  Future<QueryPollsResponse> _queryPolls({
    String? userId,
    QueryPollsRequest? queryPollsRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'user_id': userId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryPollsRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryPollsResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/query',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryPollsResponse _value;
    try {
      _value = QueryPollsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryPollsResponse>> queryPolls({
    String? userId,
    QueryPollsRequest? queryPollsRequest,
  }) {
    return _ResultCallAdapter<QueryPollsResponse>().adapt(
      () => _queryPolls(userId: userId, queryPollsRequest: queryPollsRequest),
    );
  }

  Future<QueryReviewQueueResponse> _queryReviewQueue({
    QueryReviewQueueRequest? queryReviewQueueRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(queryReviewQueueRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<QueryReviewQueueResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/review_queue',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryReviewQueueResponse _value;
    try {
      _value = QueryReviewQueueResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryReviewQueueResponse>> queryReviewQueue({
    QueryReviewQueueRequest? queryReviewQueueRequest,
  }) {
    return _ResultCallAdapter<QueryReviewQueueResponse>().adapt(
      () => _queryReviewQueue(queryReviewQueueRequest: queryReviewQueueRequest),
    );
  }

  Future<QueryUsersResponse> _queryUsers({QueryUsersPayload? payload}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'payload': payload?.toJson()};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<QueryUsersResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late QueryUsersResponse _value;
    try {
      _value = QueryUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<QueryUsersResponse>> queryUsers({QueryUsersPayload? payload}) {
    return _ResultCallAdapter<QueryUsersResponse>().adapt(
      () => _queryUsers(payload: payload),
    );
  }

  Future<RejectFeedMemberInviteResponse> _rejectFeedMemberInvite({
    required String feedGroupId,
    required String feedId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<RejectFeedMemberInviteResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/members/reject',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RejectFeedMemberInviteResponse _value;
    try {
      _value = RejectFeedMemberInviteResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<RejectFeedMemberInviteResponse>> rejectFeedMemberInvite({
    required String feedGroupId,
    required String feedId,
  }) {
    return _ResultCallAdapter<RejectFeedMemberInviteResponse>().adapt(
      () => _rejectFeedMemberInvite(feedGroupId: feedGroupId, feedId: feedId),
    );
  }

  Future<RejectFollowResponse> _rejectFollow({
    required RejectFollowRequest rejectFollowRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(rejectFollowRequest.toJson());
    final _options = _setStreamType<Result<RejectFollowResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows/reject',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RejectFollowResponse _value;
    try {
      _value = RejectFollowResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<RejectFollowResponse>> rejectFollow({
    required RejectFollowRequest rejectFollowRequest,
  }) {
    return _ResultCallAdapter<RejectFollowResponse>().adapt(
      () => _rejectFollow(rejectFollowRequest: rejectFollowRequest),
    );
  }

  Future<DurationResponse> _stopWatchingFeed({
    required String feedGroupId,
    required String feedId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/watch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> stopWatchingFeed({
    required String feedGroupId,
    required String feedId,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _stopWatchingFeed(feedGroupId: feedGroupId, feedId: feedId),
    );
  }

  Future<SubmitActionResponse> _submitAction({
    required SubmitActionRequest submitActionRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(submitActionRequest.toJson());
    final _options = _setStreamType<Result<SubmitActionResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/submit_action',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SubmitActionResponse _value;
    try {
      _value = SubmitActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<SubmitActionResponse>> submitAction({
    required SubmitActionRequest submitActionRequest,
  }) {
    return _ResultCallAdapter<SubmitActionResponse>().adapt(
      () => _submitAction(submitActionRequest: submitActionRequest),
    );
  }

  Future<UnblockUsersResponse> _unblockUsers({
    required UnblockUsersRequest unblockUsersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(unblockUsersRequest.toJson());
    final _options = _setStreamType<Result<UnblockUsersResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users/unblock',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UnblockUsersResponse _value;
    try {
      _value = UnblockUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UnblockUsersResponse>> unblockUsers({
    required UnblockUsersRequest unblockUsersRequest,
  }) {
    return _ResultCallAdapter<UnblockUsersResponse>().adapt(
      () => _unblockUsers(unblockUsersRequest: unblockUsersRequest),
    );
  }

  Future<UnfollowResponse> _unfollow({
    required String source,
    required String target,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<UnfollowResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows/${source}/${target}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UnfollowResponse _value;
    try {
      _value = UnfollowResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UnfollowResponse>> unfollow({
    required String source,
    required String target,
  }) {
    return _ResultCallAdapter<UnfollowResponse>().adapt(
      () => _unfollow(source: source, target: target),
    );
  }

  Future<UnpinActivityResponse> _unpinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<UnpinActivityResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/activities/${activityId}/pin',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UnpinActivityResponse _value;
    try {
      _value = UnpinActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UnpinActivityResponse>> unpinActivity({
    required String feedGroupId,
    required String feedId,
    required String activityId,
  }) {
    return _ResultCallAdapter<UnpinActivityResponse>().adapt(
      () => _unpinActivity(
        feedGroupId: feedGroupId,
        feedId: feedId,
        activityId: activityId,
      ),
    );
  }

  Future<UpdateActivityResponse> _updateActivity({
    required String id,
    UpdateActivityRequest? updateActivityRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateActivityRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateActivityResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateActivityResponse _value;
    try {
      _value = UpdateActivityResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateActivityResponse>> updateActivity({
    required String id,
    UpdateActivityRequest? updateActivityRequest,
  }) {
    return _ResultCallAdapter<UpdateActivityResponse>().adapt(
      () =>
          _updateActivity(id: id, updateActivityRequest: updateActivityRequest),
    );
  }

  Future<UpdateActivityPartialResponse> _updateActivityPartial({
    required String id,
    UpdateActivityPartialRequest? updateActivityPartialRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateActivityPartialRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateActivityPartialResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateActivityPartialResponse _value;
    try {
      _value = UpdateActivityPartialResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateActivityPartialResponse>> updateActivityPartial({
    required String id,
    UpdateActivityPartialRequest? updateActivityPartialRequest,
  }) {
    return _ResultCallAdapter<UpdateActivityPartialResponse>().adapt(
      () => _updateActivityPartial(
        id: id,
        updateActivityPartialRequest: updateActivityPartialRequest,
      ),
    );
  }

  Future<UpdateBlockListResponse> _updateBlockList({
    required String name,
    UpdateBlockListRequest? updateBlockListRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateBlockListRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateBlockListResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/blocklists/${name}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateBlockListResponse _value;
    try {
      _value = UpdateBlockListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateBlockListResponse>> updateBlockList({
    required String name,
    UpdateBlockListRequest? updateBlockListRequest,
  }) {
    return _ResultCallAdapter<UpdateBlockListResponse>().adapt(
      () => _updateBlockList(
        name: name,
        updateBlockListRequest: updateBlockListRequest,
      ),
    );
  }

  Future<UpdateBookmarkResponse> _updateBookmark({
    required String activityId,
    UpdateBookmarkRequest? updateBookmarkRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateBookmarkRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateBookmarkResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/${activityId}/bookmarks',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateBookmarkResponse _value;
    try {
      _value = UpdateBookmarkResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateBookmarkResponse>> updateBookmark({
    required String activityId,
    UpdateBookmarkRequest? updateBookmarkRequest,
  }) {
    return _ResultCallAdapter<UpdateBookmarkResponse>().adapt(
      () => _updateBookmark(
        activityId: activityId,
        updateBookmarkRequest: updateBookmarkRequest,
      ),
    );
  }

  Future<UpdateBookmarkFolderResponse> _updateBookmarkFolder({
    required String folderId,
    UpdateBookmarkFolderRequest? updateBookmarkFolderRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateBookmarkFolderRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateBookmarkFolderResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/bookmark_folders/${folderId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateBookmarkFolderResponse _value;
    try {
      _value = UpdateBookmarkFolderResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateBookmarkFolderResponse>> updateBookmarkFolder({
    required String folderId,
    UpdateBookmarkFolderRequest? updateBookmarkFolderRequest,
  }) {
    return _ResultCallAdapter<UpdateBookmarkFolderResponse>().adapt(
      () => _updateBookmarkFolder(
        folderId: folderId,
        updateBookmarkFolderRequest: updateBookmarkFolderRequest,
      ),
    );
  }

  Future<UpdateCommentResponse> _updateComment({
    required String id,
    UpdateCommentRequest? updateCommentRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateCommentRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateCommentResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/comments/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateCommentResponse _value;
    try {
      _value = UpdateCommentResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateCommentResponse>> updateComment({
    required String id,
    UpdateCommentRequest? updateCommentRequest,
  }) {
    return _ResultCallAdapter<UpdateCommentResponse>().adapt(
      () => _updateComment(id: id, updateCommentRequest: updateCommentRequest),
    );
  }

  Future<UpdateFeedResponse> _updateFeed({
    required String feedGroupId,
    required String feedId,
    UpdateFeedRequest? updateFeedRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateFeedRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<UpdateFeedResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateFeedResponse _value;
    try {
      _value = UpdateFeedResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateFeedResponse>> updateFeed({
    required String feedGroupId,
    required String feedId,
    UpdateFeedRequest? updateFeedRequest,
  }) {
    return _ResultCallAdapter<UpdateFeedResponse>().adapt(
      () => _updateFeed(
        feedGroupId: feedGroupId,
        feedId: feedId,
        updateFeedRequest: updateFeedRequest,
      ),
    );
  }

  Future<UpdateFeedMembersResponse> _updateFeedMembers({
    required String feedGroupId,
    required String feedId,
    required UpdateFeedMembersRequest updateFeedMembersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateFeedMembersRequest.toJson());
    final _options = _setStreamType<Result<UpdateFeedMembersResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/feed_groups/${feedGroupId}/feeds/${feedId}/members',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateFeedMembersResponse _value;
    try {
      _value = UpdateFeedMembersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateFeedMembersResponse>> updateFeedMembers({
    required String feedGroupId,
    required String feedId,
    required UpdateFeedMembersRequest updateFeedMembersRequest,
  }) {
    return _ResultCallAdapter<UpdateFeedMembersResponse>().adapt(
      () => _updateFeedMembers(
        feedGroupId: feedGroupId,
        feedId: feedId,
        updateFeedMembersRequest: updateFeedMembersRequest,
      ),
    );
  }

  Future<UpdateFollowResponse> _updateFollow({
    required UpdateFollowRequest updateFollowRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateFollowRequest.toJson());
    final _options = _setStreamType<Result<UpdateFollowResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/follows',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateFollowResponse _value;
    try {
      _value = UpdateFollowResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateFollowResponse>> updateFollow({
    required UpdateFollowRequest updateFollowRequest,
  }) {
    return _ResultCallAdapter<UpdateFollowResponse>().adapt(
      () => _updateFollow(updateFollowRequest: updateFollowRequest),
    );
  }

  Future<SharedLocationResponse> _updateLiveLocation({
    required UpdateLiveLocationRequest updateLiveLocationRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateLiveLocationRequest.toJson());
    final _options = _setStreamType<Result<SharedLocationResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users/live_locations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SharedLocationResponse _value;
    try {
      _value = SharedLocationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<SharedLocationResponse>> updateLiveLocation({
    required UpdateLiveLocationRequest updateLiveLocationRequest,
  }) {
    return _ResultCallAdapter<SharedLocationResponse>().adapt(
      () => _updateLiveLocation(
        updateLiveLocationRequest: updateLiveLocationRequest,
      ),
    );
  }

  Future<PollResponse> _updatePoll({
    required UpdatePollRequest updatePollRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePollRequest.toJson());
    final _options = _setStreamType<Result<PollResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollResponse _value;
    try {
      _value = PollResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollResponse>> updatePoll({
    required UpdatePollRequest updatePollRequest,
  }) {
    return _ResultCallAdapter<PollResponse>().adapt(
      () => _updatePoll(updatePollRequest: updatePollRequest),
    );
  }

  Future<PollOptionResponse> _updatePollOption({
    required String pollId,
    required UpdatePollOptionRequest updatePollOptionRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePollOptionRequest.toJson());
    final _options = _setStreamType<Result<PollOptionResponse>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}/options',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollOptionResponse _value;
    try {
      _value = PollOptionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollOptionResponse>> updatePollOption({
    required String pollId,
    required UpdatePollOptionRequest updatePollOptionRequest,
  }) {
    return _ResultCallAdapter<PollOptionResponse>().adapt(
      () => _updatePollOption(
        pollId: pollId,
        updatePollOptionRequest: updatePollOptionRequest,
      ),
    );
  }

  Future<PollResponse> _updatePollPartial({
    required String pollId,
    UpdatePollPartialRequest? updatePollPartialRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePollPartialRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<PollResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/polls/${pollId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PollResponse _value;
    try {
      _value = PollResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<PollResponse>> updatePollPartial({
    required String pollId,
    UpdatePollPartialRequest? updatePollPartialRequest,
  }) {
    return _ResultCallAdapter<PollResponse>().adapt(
      () => _updatePollPartial(
        pollId: pollId,
        updatePollPartialRequest: updatePollPartialRequest,
      ),
    );
  }

  Future<UpsertPushPreferencesResponse> _updatePushNotificationPreferences({
    required UpsertPushPreferencesRequest upsertPushPreferencesRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(upsertPushPreferencesRequest.toJson());
    final _options = _setStreamType<Result<UpsertPushPreferencesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/push_preferences',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpsertPushPreferencesResponse _value;
    try {
      _value = UpsertPushPreferencesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpsertPushPreferencesResponse>>
      updatePushNotificationPreferences({
    required UpsertPushPreferencesRequest upsertPushPreferencesRequest,
  }) {
    return _ResultCallAdapter<UpsertPushPreferencesResponse>().adapt(
      () => _updatePushNotificationPreferences(
        upsertPushPreferencesRequest: upsertPushPreferencesRequest,
      ),
    );
  }

  Future<UpdateUsersResponse> _updateUsers({
    required UpdateUsersRequest updateUsersRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateUsersRequest.toJson());
    final _options = _setStreamType<Result<UpdateUsersResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateUsersResponse _value;
    try {
      _value = UpdateUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateUsersResponse>> updateUsers({
    required UpdateUsersRequest updateUsersRequest,
  }) {
    return _ResultCallAdapter<UpdateUsersResponse>().adapt(
      () => _updateUsers(updateUsersRequest: updateUsersRequest),
    );
  }

  Future<UpdateUsersResponse> _updateUsersPartial({
    required UpdateUsersPartialRequest updateUsersPartialRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateUsersPartialRequest.toJson());
    final _options = _setStreamType<Result<UpdateUsersResponse>>(
      Options(method: 'PATCH', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/users',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpdateUsersResponse _value;
    try {
      _value = UpdateUsersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpdateUsersResponse>> updateUsersPartial({
    required UpdateUsersPartialRequest updateUsersPartialRequest,
  }) {
    return _ResultCallAdapter<UpdateUsersResponse>().adapt(
      () => _updateUsersPartial(
        updateUsersPartialRequest: updateUsersPartialRequest,
      ),
    );
  }

  Future<FileUploadResponse> _uploadFile({
    FileUploadRequest? fileUploadRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(fileUploadRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<FileUploadResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/file',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FileUploadResponse _value;
    try {
      _value = FileUploadResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<FileUploadResponse>> uploadFile({
    FileUploadRequest? fileUploadRequest,
  }) {
    return _ResultCallAdapter<FileUploadResponse>().adapt(
      () => _uploadFile(fileUploadRequest: fileUploadRequest),
    );
  }

  Future<ImageUploadResponse> _uploadImage({
    ImageUploadRequest? imageUploadRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(imageUploadRequest?.toJson() ?? <String, dynamic>{});
    final _options = _setStreamType<Result<ImageUploadResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/image',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ImageUploadResponse _value;
    try {
      _value = ImageUploadResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ImageUploadResponse>> uploadImage({
    ImageUploadRequest? imageUploadRequest,
  }) {
    return _ResultCallAdapter<ImageUploadResponse>().adapt(
      () => _uploadImage(imageUploadRequest: imageUploadRequest),
    );
  }

  Future<UpsertActivitiesResponse> _upsertActivities({
    required UpsertActivitiesRequest upsertActivitiesRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(upsertActivitiesRequest.toJson());
    final _options = _setStreamType<Result<UpsertActivitiesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/feeds/activities/batch',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpsertActivitiesResponse _value;
    try {
      _value = UpsertActivitiesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpsertActivitiesResponse>> upsertActivities({
    required UpsertActivitiesRequest upsertActivitiesRequest,
  }) {
    return _ResultCallAdapter<UpsertActivitiesResponse>().adapt(
      () => _upsertActivities(upsertActivitiesRequest: upsertActivitiesRequest),
    );
  }

  Future<UpsertConfigResponse> _upsertConfig({
    required UpsertConfigRequest upsertConfigRequest,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(upsertConfigRequest.toJson());
    final _options = _setStreamType<Result<UpsertConfigResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/moderation/config',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UpsertConfigResponse _value;
    try {
      _value = UpsertConfigResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<UpsertConfigResponse>> upsertConfig({
    required UpsertConfigRequest upsertConfigRequest,
  }) {
    return _ResultCallAdapter<UpsertConfigResponse>().adapt(
      () => _upsertConfig(upsertConfigRequest: upsertConfigRequest),
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
