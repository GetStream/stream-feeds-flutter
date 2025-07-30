//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: public_member_api_docs
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_getters_setters
// ignore_for_file: parameter_assignments
// ignore_for_file: require_trailing_commas

part of openapi.api;

class ApiClient {
  ApiClient({
    this.basePath = 'https://chat.stream-io-api.com',
    this.authentication,
  });

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is MultipartFile &&
          (contentType == null ||
              !contentType.toLowerCase().startsWith('multipart/form-data'))) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              // ignore: avoid_types_on_closure_parameters
              onError: (Object error, StackTrace trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
          ? formParams
          : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await _client.post(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PUT':
          return await _client.put(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await _client.delete(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PATCH':
          return await _client.patch(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await _client.head(
            uri,
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await _client.get(
            uri,
            headers: nullableHeaderParams,
          );
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(
    String value,
    String targetType, {
    bool growable = false,
  }) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(value, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(
    String value,
    String targetType, {
    bool growable = false,
  }) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', '');

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? value
        : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(
    dynamic value,
    String targetType, {
    bool growable = false,
  }) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'AIImageConfig':
          return AIImageConfig.fromJson(value);
        case 'AITextConfig':
          return AITextConfig.fromJson(value);
        case 'AIVideoConfig':
          return AIVideoConfig.fromJson(value);
        case 'APIError':
          return APIError.fromJson(value);
        case 'APNS':
          return APNS.fromJson(value);
        case 'AWSRekognitionRule':
          return AWSRekognitionRule.fromJson(value);
        case 'AcceptFeedMemberInviteResponse':
          return AcceptFeedMemberInviteResponse.fromJson(value);
        case 'AcceptFollowRequest':
          return AcceptFollowRequest.fromJson(value);
        case 'AcceptFollowResponse':
          return AcceptFollowResponse.fromJson(value);
        case 'Action':
          return Action.fromJson(value);
        case 'ActionLog':
          return ActionLog.fromJson(value);
        case 'ActionLogResponse':
          return ActionLogResponse.fromJson(value);
        case 'ActionSequence':
          return ActionSequence.fromJson(value);
        case 'ActivityAddedEvent':
          return ActivityAddedEvent.fromJson(value);
        case 'ActivityDeletedEvent':
          return ActivityDeletedEvent.fromJson(value);
        case 'ActivityLocation':
          return ActivityLocation.fromJson(value);
        case 'ActivityMarkEvent':
          return ActivityMarkEvent.fromJson(value);
        case 'ActivityPinResponse':
          return ActivityPinResponse.fromJson(value);
        case 'ActivityPinnedEvent':
          return ActivityPinnedEvent.fromJson(value);
        case 'ActivityReactionAddedEvent':
          return ActivityReactionAddedEvent.fromJson(value);
        case 'ActivityReactionDeletedEvent':
          return ActivityReactionDeletedEvent.fromJson(value);
        case 'ActivityReactionUpdatedEvent':
          return ActivityReactionUpdatedEvent.fromJson(value);
        case 'ActivityRemovedFromFeedEvent':
          return ActivityRemovedFromFeedEvent.fromJson(value);
        case 'ActivityRequest':
          return ActivityRequest.fromJson(value);
        case 'ActivityResponse':
          return ActivityResponse.fromJson(value);
        case 'ActivityUnpinnedEvent':
          return ActivityUnpinnedEvent.fromJson(value);
        case 'ActivityUpdatedEvent':
          return ActivityUpdatedEvent.fromJson(value);
        case 'AddActivityRequest':
          return AddActivityRequest.fromJson(value);
        case 'AddActivityResponse':
          return AddActivityResponse.fromJson(value);
        case 'AddBookmarkRequest':
          return AddBookmarkRequest.fromJson(value);
        case 'AddBookmarkResponse':
          return AddBookmarkResponse.fromJson(value);
        case 'AddCommentReactionRequest':
          return AddCommentReactionRequest.fromJson(value);
        case 'AddCommentReactionResponse':
          return AddCommentReactionResponse.fromJson(value);
        case 'AddCommentRequest':
          return AddCommentRequest.fromJson(value);
        case 'AddCommentResponse':
          return AddCommentResponse.fromJson(value);
        case 'AddCommentsBatchRequest':
          return AddCommentsBatchRequest.fromJson(value);
        case 'AddCommentsBatchResponse':
          return AddCommentsBatchResponse.fromJson(value);
        case 'AddFolderRequest':
          return AddFolderRequest.fromJson(value);
        case 'AddReactionRequest':
          return AddReactionRequest.fromJson(value);
        case 'AddReactionResponse':
          return AddReactionResponse.fromJson(value);
        case 'AggregatedActivityResponse':
          return AggregatedActivityResponse.fromJson(value);
        case 'AppEventResponse':
          return AppEventResponse.fromJson(value);
        case 'AppResponseFields':
          return AppResponseFields.fromJson(value);
        case 'AppUpdatedEvent':
          return AppUpdatedEvent.fromJson(value);
        case 'Attachment':
          return Attachment.fromJson(value);
        case 'AudioSettings':
          return AudioSettings.fromJson(value);
        case 'AudioSettingsResponse':
          return AudioSettingsResponse.fromJson(value);
        case 'AutomodPlatformCircumventionConfig':
          return AutomodPlatformCircumventionConfig.fromJson(value);
        case 'AutomodRule':
          return AutomodRule.fromJson(value);
        case 'AutomodSemanticFiltersConfig':
          return AutomodSemanticFiltersConfig.fromJson(value);
        case 'AutomodSemanticFiltersRule':
          return AutomodSemanticFiltersRule.fromJson(value);
        case 'AutomodToxicityConfig':
          return AutomodToxicityConfig.fromJson(value);
        case 'BackstageSettings':
          return BackstageSettings.fromJson(value);
        case 'BackstageSettingsResponse':
          return BackstageSettingsResponse.fromJson(value);
        case 'Ban':
          return Ban.fromJson(value);
        case 'BanActionRequest':
          return BanActionRequest.fromJson(value);
        case 'BanOptions':
          return BanOptions.fromJson(value);
        case 'BanRequest':
          return BanRequest.fromJson(value);
        case 'BanResponse':
          return BanResponse.fromJson(value);
        case 'BlockContentOptions':
          return BlockContentOptions.fromJson(value);
        case 'BlockListConfig':
          return BlockListConfig.fromJson(value);
        case 'BlockListOptions':
          return BlockListOptions.fromJson(value);
        case 'BlockListResponse':
          return BlockListResponse.fromJson(value);
        case 'BlockListRule':
          return BlockListRule.fromJson(value);
        case 'BlockUsersRequest':
          return BlockUsersRequest.fromJson(value);
        case 'BlockUsersResponse':
          return BlockUsersResponse.fromJson(value);
        case 'BlockedUserResponse':
          return BlockedUserResponse.fromJson(value);
        case 'BodyguardRule':
          return BodyguardRule.fromJson(value);
        case 'BodyguardSeverityRule':
          return BodyguardSeverityRule.fromJson(value);
        case 'BookmarkAddedEvent':
          return BookmarkAddedEvent.fromJson(value);
        case 'BookmarkDeletedEvent':
          return BookmarkDeletedEvent.fromJson(value);
        case 'BookmarkFolderDeletedEvent':
          return BookmarkFolderDeletedEvent.fromJson(value);
        case 'BookmarkFolderResponse':
          return BookmarkFolderResponse.fromJson(value);
        case 'BookmarkFolderUpdatedEvent':
          return BookmarkFolderUpdatedEvent.fromJson(value);
        case 'BookmarkResponse':
          return BookmarkResponse.fromJson(value);
        case 'BookmarkUpdatedEvent':
          return BookmarkUpdatedEvent.fromJson(value);
        case 'BroadcastSettings':
          return BroadcastSettings.fromJson(value);
        case 'BroadcastSettingsResponse':
          return BroadcastSettingsResponse.fromJson(value);
        case 'Call':
          return Call.fromJson(value);
        case 'CallEgress':
          return CallEgress.fromJson(value);
        case 'CallIngressResponse':
          return CallIngressResponse.fromJson(value);
        case 'CallMember':
          return CallMember.fromJson(value);
        case 'CallParticipant':
          return CallParticipant.fromJson(value);
        case 'CallParticipantResponse':
          return CallParticipantResponse.fromJson(value);
        case 'CallResponse':
          return CallResponse.fromJson(value);
        case 'CallSession':
          return CallSession.fromJson(value);
        case 'CallSessionResponse':
          return CallSessionResponse.fromJson(value);
        case 'CallSettings':
          return CallSettings.fromJson(value);
        case 'CallSettingsResponse':
          return CallSettingsResponse.fromJson(value);
        case 'CallType':
          return CallType.fromJson(value);
        case 'CastPollVoteRequest':
          return CastPollVoteRequest.fromJson(value);
        case 'Channel':
          return Channel.fromJson(value);
        case 'ChannelConfig':
          return ChannelConfig.fromJson(value);
        case 'ChannelConfigWithInfo':
          return ChannelConfigWithInfo.fromJson(value);
        case 'ChannelMember':
          return ChannelMember.fromJson(value);
        case 'ChannelMute':
          return ChannelMute.fromJson(value);
        case 'ChannelOwnCapability':
          return ChannelOwnCapability.fromJson(value);
        case 'ChannelResponse':
          return ChannelResponse.fromJson(value);
        case 'Command':
          return Command.fromJson(value);
        case 'CommentAddedEvent':
          return CommentAddedEvent.fromJson(value);
        case 'CommentDeletedEvent':
          return CommentDeletedEvent.fromJson(value);
        case 'CommentReactionAddedEvent':
          return CommentReactionAddedEvent.fromJson(value);
        case 'CommentReactionDeletedEvent':
          return CommentReactionDeletedEvent.fromJson(value);
        case 'CommentReactionUpdatedEvent':
          return CommentReactionUpdatedEvent.fromJson(value);
        case 'CommentResponse':
          return CommentResponse.fromJson(value);
        case 'CommentUpdatedEvent':
          return CommentUpdatedEvent.fromJson(value);
        case 'CompositeAppSettings':
          return CompositeAppSettings.fromJson(value);
        case 'ConfigOverrides':
          return ConfigOverrides.fromJson(value);
        case 'ConfigResponse':
          return ConfigResponse.fromJson(value);
        case 'ConnectUserDetailsRequest':
          return ConnectUserDetailsRequest.fromJson(value);
        case 'ContentCountRuleParameters':
          return ContentCountRuleParameters.fromJson(value);
        case 'CreateBlockListRequest':
          return CreateBlockListRequest.fromJson(value);
        case 'CreateBlockListResponse':
          return CreateBlockListResponse.fromJson(value);
        case 'CreateDeviceRequest':
          return CreateDeviceRequest.fromJson(value);
        case 'CreateFeedsBatchRequest':
          return CreateFeedsBatchRequest.fromJson(value);
        case 'CreateFeedsBatchResponse':
          return CreateFeedsBatchResponse.fromJson(value);
        case 'CreateGuestRequest':
          return CreateGuestRequest.fromJson(value);
        case 'CreateGuestResponse':
          return CreateGuestResponse.fromJson(value);
        case 'CreatePollOptionRequest':
          return CreatePollOptionRequest.fromJson(value);
        case 'CreatePollRequest':
          return CreatePollRequest.fromJson(value);
        case 'CustomActionRequest':
          return CustomActionRequest.fromJson(value);
        case 'Data':
          return Data.fromJson(value);
        case 'DeleteActivitiesRequest':
          return DeleteActivitiesRequest.fromJson(value);
        case 'DeleteActivitiesResponse':
          return DeleteActivitiesResponse.fromJson(value);
        case 'DeleteActivityReactionResponse':
          return DeleteActivityReactionResponse.fromJson(value);
        case 'DeleteActivityRequest':
          return DeleteActivityRequest.fromJson(value);
        case 'DeleteActivityResponse':
          return DeleteActivityResponse.fromJson(value);
        case 'DeleteBookmarkFolderResponse':
          return DeleteBookmarkFolderResponse.fromJson(value);
        case 'DeleteBookmarkResponse':
          return DeleteBookmarkResponse.fromJson(value);
        case 'DeleteCommentReactionResponse':
          return DeleteCommentReactionResponse.fromJson(value);
        case 'DeleteCommentResponse':
          return DeleteCommentResponse.fromJson(value);
        case 'DeleteFeedResponse':
          return DeleteFeedResponse.fromJson(value);
        case 'DeleteMessageRequest':
          return DeleteMessageRequest.fromJson(value);
        case 'DeleteModerationConfigResponse':
          return DeleteModerationConfigResponse.fromJson(value);
        case 'DeleteReactionRequest':
          return DeleteReactionRequest.fromJson(value);
        case 'DeleteUserRequest':
          return DeleteUserRequest.fromJson(value);
        case 'Device':
          return Device.fromJson(value);
        case 'DeviceResponse':
          return DeviceResponse.fromJson(value);
        case 'DraftPayloadResponse':
          return DraftPayloadResponse.fromJson(value);
        case 'DraftResponse':
          return DraftResponse.fromJson(value);
        case 'EgressHLSResponse':
          return EgressHLSResponse.fromJson(value);
        case 'EgressRTMPResponse':
          return EgressRTMPResponse.fromJson(value);
        case 'EgressResponse':
          return EgressResponse.fromJson(value);
        case 'EgressTaskConfig':
          return EgressTaskConfig.fromJson(value);
        case 'EgressUser':
          return EgressUser.fromJson(value);
        case 'EnrichedActivity':
          return EnrichedActivity.fromJson(value);
        case 'EnrichedReaction':
          return EnrichedReaction.fromJson(value);
        case 'EntityCreator':
          return EntityCreator.fromJson(value);
        case 'EntityCreatorResponse':
          return EntityCreatorResponse.fromJson(value);
        case 'EventNotificationSettings':
          return EventNotificationSettings.fromJson(value);
        case 'ExternalStorage':
          return ExternalStorage.fromJson(value);
        case 'FCM':
          return FCM.fromJson(value);
        case 'FeedCreatedEvent':
          return FeedCreatedEvent.fromJson(value);
        case 'FeedDeletedEvent':
          return FeedDeletedEvent.fromJson(value);
        case 'FeedGroup':
          return FeedGroup.fromJson(value);
        case 'FeedGroupChangedEvent':
          return FeedGroupChangedEvent.fromJson(value);
        case 'FeedGroupDeletedEvent':
          return FeedGroupDeletedEvent.fromJson(value);
        case 'FeedInput':
          return FeedInput.fromJson(value);
        case 'FeedMemberAddedEvent':
          return FeedMemberAddedEvent.fromJson(value);
        case 'FeedMemberRemovedEvent':
          return FeedMemberRemovedEvent.fromJson(value);
        case 'FeedMemberRequest':
          return FeedMemberRequest.fromJson(value);
        case 'FeedMemberResponse':
          return FeedMemberResponse.fromJson(value);
        case 'FeedMemberUpdatedEvent':
          return FeedMemberUpdatedEvent.fromJson(value);
        case 'FeedOwnCapability':
          return FeedOwnCapability.fromJson(value);
        case 'FeedRequest':
          return FeedRequest.fromJson(value);
        case 'FeedResponse':
          return FeedResponse.fromJson(value);
        case 'FeedUpdatedEvent':
          return FeedUpdatedEvent.fromJson(value);
        case 'FeedsReactionResponse':
          return FeedsReactionResponse.fromJson(value);
        case 'Field':
          return Field.fromJson(value);
        case 'FileUploadConfig':
          return FileUploadConfig.fromJson(value);
        case 'FileUploadRequest':
          return FileUploadRequest.fromJson(value);
        case 'FileUploadResponse':
          return FileUploadResponse.fromJson(value);
        case 'Flag':
          return Flag.fromJson(value);
        case 'FlagContentOptions':
          return FlagContentOptions.fromJson(value);
        case 'FlagRequest':
          return FlagRequest.fromJson(value);
        case 'FlagResponse':
          return FlagResponse.fromJson(value);
        case 'FlagUserOptions':
          return FlagUserOptions.fromJson(value);
        case 'FollowBatchRequest':
          return FollowBatchRequest.fromJson(value);
        case 'FollowBatchResponse':
          return FollowBatchResponse.fromJson(value);
        case 'FollowCreatedEvent':
          return FollowCreatedEvent.fromJson(value);
        case 'FollowDeletedEvent':
          return FollowDeletedEvent.fromJson(value);
        case 'FollowRequest':
          return FollowRequest.fromJson(value);
        case 'FollowResponse':
          return FollowResponse.fromJson(value);
        case 'FollowUpdatedEvent':
          return FollowUpdatedEvent.fromJson(value);
        case 'FrameRecordSettings':
          return FrameRecordSettings.fromJson(value);
        case 'FrameRecordingEgressConfig':
          return FrameRecordingEgressConfig.fromJson(value);
        case 'FrameRecordingResponse':
          return FrameRecordingResponse.fromJson(value);
        case 'FrameRecordingSettingsResponse':
          return FrameRecordingSettingsResponse.fromJson(value);
        case 'FullUserResponse':
          return FullUserResponse.fromJson(value);
        case 'GeofenceSettings':
          return GeofenceSettings.fromJson(value);
        case 'GeofenceSettingsResponse':
          return GeofenceSettingsResponse.fromJson(value);
        case 'GetActivityResponse':
          return GetActivityResponse.fromJson(value);
        case 'GetApplicationResponse':
          return GetApplicationResponse.fromJson(value);
        case 'GetBlockedUsersResponse':
          return GetBlockedUsersResponse.fromJson(value);
        case 'GetCommentRepliesResponse':
          return GetCommentRepliesResponse.fromJson(value);
        case 'GetCommentResponse':
          return GetCommentResponse.fromJson(value);
        case 'GetCommentsResponse':
          return GetCommentsResponse.fromJson(value);
        case 'GetConfigResponse':
          return GetConfigResponse.fromJson(value);
        case 'GetFollowSuggestionsResponse':
          return GetFollowSuggestionsResponse.fromJson(value);
        case 'GetOGResponse':
          return GetOGResponse.fromJson(value);
        case 'GetOrCreateFeedRequest':
          return GetOrCreateFeedRequest.fromJson(value);
        case 'GetOrCreateFeedResponse':
          return GetOrCreateFeedResponse.fromJson(value);
        case 'GoogleVisionConfig':
          return GoogleVisionConfig.fromJson(value);
        case 'HLSEgressConfig':
          return HLSEgressConfig.fromJson(value);
        case 'HLSSettings':
          return HLSSettings.fromJson(value);
        case 'HLSSettingsResponse':
          return HLSSettingsResponse.fromJson(value);
        case 'HarmConfig':
          return HarmConfig.fromJson(value);
        case 'HealthCheckEvent':
          return HealthCheckEvent.fromJson(value);
        case 'ImageContentParameters':
          return ImageContentParameters.fromJson(value);
        case 'ImageData':
          return ImageData.fromJson(value);
        case 'ImageRuleParameters':
          return ImageRuleParameters.fromJson(value);
        case 'ImageSize':
          return ImageSize.fromJson(value);
        case 'ImageUploadRequest':
          return ImageUploadRequest.fromJson(value);
        case 'ImageUploadResponse':
          return ImageUploadResponse.fromJson(value);
        case 'Images':
          return Images.fromJson(value);
        case 'LabelThresholds':
          return LabelThresholds.fromJson(value);
        case 'LayoutSettings':
          return LayoutSettings.fromJson(value);
        case 'LimitsSettings':
          return LimitsSettings.fromJson(value);
        case 'LimitsSettingsResponse':
          return LimitsSettingsResponse.fromJson(value);
        case 'ListBlockListResponse':
          return ListBlockListResponse.fromJson(value);
        case 'ListDevicesResponse':
          return ListDevicesResponse.fromJson(value);
        case 'MarkActivityRequest':
          return MarkActivityRequest.fromJson(value);
        case 'MarkReviewedRequest':
          return MarkReviewedRequest.fromJson(value);
        case 'MemberLookup':
          return MemberLookup.fromJson(value);
        case 'Message':
          return Message.fromJson(value);
        case 'MessageReminder':
          return MessageReminder.fromJson(value);
        case 'MessageResponse':
          return MessageResponse.fromJson(value);
        case 'ModerationActionConfig':
          return ModerationActionConfig.fromJson(value);
        case 'ModerationCustomActionEvent':
          return ModerationCustomActionEvent.fromJson(value);
        case 'ModerationFlaggedEvent':
          return ModerationFlaggedEvent.fromJson(value);
        case 'ModerationMarkReviewedEvent':
          return ModerationMarkReviewedEvent.fromJson(value);
        case 'ModerationPayload':
          return ModerationPayload.fromJson(value);
        case 'ModerationV2Response':
          return ModerationV2Response.fromJson(value);
        case 'MuteRequest':
          return MuteRequest.fromJson(value);
        case 'MuteResponse':
          return MuteResponse.fromJson(value);
        case 'NoiseCancellationSettings':
          return NoiseCancellationSettings.fromJson(value);
        case 'NotificationConfig':
          return NotificationConfig.fromJson(value);
        case 'NotificationFeedUpdatedEvent':
          return NotificationFeedUpdatedEvent.fromJson(value);
        case 'NotificationSettings':
          return NotificationSettings.fromJson(value);
        case 'NotificationStatusResponse':
          return NotificationStatusResponse.fromJson(value);
        case 'OCRRule':
          return OCRRule.fromJson(value);
        case 'OnlyUserID':
          return OnlyUserID.fromJson(value);
        case 'OwnUser':
          return OwnUser.fromJson(value);
        case 'OwnUserResponse':
          return OwnUserResponse.fromJson(value);
        case 'PagerRequest':
          return PagerRequest.fromJson(value);
        case 'PagerResponse':
          return PagerResponse.fromJson(value);
        case 'PinActivityResponse':
          return PinActivityResponse.fromJson(value);
        case 'Poll':
          return Poll.fromJson(value);
        case 'PollClosedFeedEvent':
          return PollClosedFeedEvent.fromJson(value);
        case 'PollDeletedFeedEvent':
          return PollDeletedFeedEvent.fromJson(value);
        case 'PollOption':
          return PollOption.fromJson(value);
        case 'PollOptionInput':
          return PollOptionInput.fromJson(value);
        case 'PollOptionRequest':
          return PollOptionRequest.fromJson(value);
        case 'PollOptionResponse':
          return PollOptionResponse.fromJson(value);
        case 'PollOptionResponseData':
          return PollOptionResponseData.fromJson(value);
        case 'PollResponse':
          return PollResponse.fromJson(value);
        case 'PollResponseData':
          return PollResponseData.fromJson(value);
        case 'PollUpdatedFeedEvent':
          return PollUpdatedFeedEvent.fromJson(value);
        case 'PollVote':
          return PollVote.fromJson(value);
        case 'PollVoteCastedFeedEvent':
          return PollVoteCastedFeedEvent.fromJson(value);
        case 'PollVoteChangedFeedEvent':
          return PollVoteChangedFeedEvent.fromJson(value);
        case 'PollVoteRemovedFeedEvent':
          return PollVoteRemovedFeedEvent.fromJson(value);
        case 'PollVoteResponse':
          return PollVoteResponse.fromJson(value);
        case 'PollVoteResponseData':
          return PollVoteResponseData.fromJson(value);
        case 'PollVotesResponse':
          return PollVotesResponse.fromJson(value);
        case 'PrivacySettings':
          return PrivacySettings.fromJson(value);
        case 'PrivacySettingsResponse':
          return PrivacySettingsResponse.fromJson(value);
        case 'PushPreferences':
          return PushPreferences.fromJson(value);
        case 'Quality':
          return Quality.fromJson(value);
        case 'QueryActivitiesRequest':
          return QueryActivitiesRequest.fromJson(value);
        case 'QueryActivitiesResponse':
          return QueryActivitiesResponse.fromJson(value);
        case 'QueryActivityReactionsRequest':
          return QueryActivityReactionsRequest.fromJson(value);
        case 'QueryActivityReactionsResponse':
          return QueryActivityReactionsResponse.fromJson(value);
        case 'QueryBookmarkFoldersRequest':
          return QueryBookmarkFoldersRequest.fromJson(value);
        case 'QueryBookmarkFoldersResponse':
          return QueryBookmarkFoldersResponse.fromJson(value);
        case 'QueryBookmarksRequest':
          return QueryBookmarksRequest.fromJson(value);
        case 'QueryBookmarksResponse':
          return QueryBookmarksResponse.fromJson(value);
        case 'QueryCommentReactionsRequest':
          return QueryCommentReactionsRequest.fromJson(value);
        case 'QueryCommentReactionsResponse':
          return QueryCommentReactionsResponse.fromJson(value);
        case 'QueryCommentsRequest':
          return QueryCommentsRequest.fromJson(value);
        case 'QueryCommentsResponse':
          return QueryCommentsResponse.fromJson(value);
        case 'QueryFeedMembersRequest':
          return QueryFeedMembersRequest.fromJson(value);
        case 'QueryFeedMembersResponse':
          return QueryFeedMembersResponse.fromJson(value);
        case 'QueryFeedsRequest':
          return QueryFeedsRequest.fromJson(value);
        case 'QueryFeedsResponse':
          return QueryFeedsResponse.fromJson(value);
        case 'QueryFollowsRequest':
          return QueryFollowsRequest.fromJson(value);
        case 'QueryFollowsResponse':
          return QueryFollowsResponse.fromJson(value);
        case 'QueryModerationConfigsRequest':
          return QueryModerationConfigsRequest.fromJson(value);
        case 'QueryModerationConfigsResponse':
          return QueryModerationConfigsResponse.fromJson(value);
        case 'QueryPollVotesRequest':
          return QueryPollVotesRequest.fromJson(value);
        case 'QueryPollsRequest':
          return QueryPollsRequest.fromJson(value);
        case 'QueryPollsResponse':
          return QueryPollsResponse.fromJson(value);
        case 'QueryReviewQueueRequest':
          return QueryReviewQueueRequest.fromJson(value);
        case 'QueryReviewQueueResponse':
          return QueryReviewQueueResponse.fromJson(value);
        case 'QueryUsersPayload':
          return QueryUsersPayload.fromJson(value);
        case 'QueryUsersResponse':
          return QueryUsersResponse.fromJson(value);
        case 'RTMPEgressConfig':
          return RTMPEgressConfig.fromJson(value);
        case 'RTMPIngress':
          return RTMPIngress.fromJson(value);
        case 'RTMPLocation':
          return RTMPLocation.fromJson(value);
        case 'RTMPSettings':
          return RTMPSettings.fromJson(value);
        case 'RTMPSettingsResponse':
          return RTMPSettingsResponse.fromJson(value);
        case 'Reaction':
          return Reaction.fromJson(value);
        case 'ReactionGroupResponse':
          return ReactionGroupResponse.fromJson(value);
        case 'ReactionResponse':
          return ReactionResponse.fromJson(value);
        case 'ReadReceipts':
          return ReadReceipts.fromJson(value);
        case 'ReadReceiptsResponse':
          return ReadReceiptsResponse.fromJson(value);
        case 'RecordSettings':
          return RecordSettings.fromJson(value);
        case 'RecordSettingsResponse':
          return RecordSettingsResponse.fromJson(value);
        case 'RecordingEgressConfig':
          return RecordingEgressConfig.fromJson(value);
        case 'RejectFeedMemberInviteResponse':
          return RejectFeedMemberInviteResponse.fromJson(value);
        case 'RejectFollowRequest':
          return RejectFollowRequest.fromJson(value);
        case 'RejectFollowResponse':
          return RejectFollowResponse.fromJson(value);
        case 'ReminderResponseData':
          return ReminderResponseData.fromJson(value);
        case 'RepliesMeta':
          return RepliesMeta.fromJson(value);
        case 'Response':
          return Response.fromJson(value);
        case 'ReviewQueueItem':
          return ReviewQueueItem.fromJson(value);
        case 'ReviewQueueItemResponse':
          return ReviewQueueItemResponse.fromJson(value);
        case 'RingSettings':
          return RingSettings.fromJson(value);
        case 'RingSettingsResponse':
          return RingSettingsResponse.fromJson(value);
        case 'RuleBuilderAction':
          return RuleBuilderAction.fromJson(value);
        case 'RuleBuilderCondition':
          return RuleBuilderCondition.fromJson(value);
        case 'RuleBuilderConditionGroup':
          return RuleBuilderConditionGroup.fromJson(value);
        case 'RuleBuilderConfig':
          return RuleBuilderConfig.fromJson(value);
        case 'RuleBuilderRule':
          return RuleBuilderRule.fromJson(value);
        case 'SFUIDLastSeen':
          return SFUIDLastSeen.fromJson(value);
        case 'STTEgressConfig':
          return STTEgressConfig.fromJson(value);
        case 'ScreensharingSettings':
          return ScreensharingSettings.fromJson(value);
        case 'ScreensharingSettingsResponse':
          return ScreensharingSettingsResponse.fromJson(value);
        case 'SessionSettings':
          return SessionSettings.fromJson(value);
        case 'SessionSettingsResponse':
          return SessionSettingsResponse.fromJson(value);
        case 'SharedLocation':
          return SharedLocation.fromJson(value);
        case 'SharedLocationResponse':
          return SharedLocationResponse.fromJson(value);
        case 'SharedLocationResponseData':
          return SharedLocationResponseData.fromJson(value);
        case 'SharedLocationsResponse':
          return SharedLocationsResponse.fromJson(value);
        case 'SingleFollowRequest':
          return SingleFollowRequest.fromJson(value);
        case 'SingleFollowResponse':
          return SingleFollowResponse.fromJson(value);
        case 'SortParamRequest':
          return SortParamRequest.fromJson(value);
        case 'StoriesConfig':
          return StoriesConfig.fromJson(value);
        case 'SubmitActionRequest':
          return SubmitActionRequest.fromJson(value);
        case 'SubmitActionResponse':
          return SubmitActionResponse.fromJson(value);
        case 'TargetResolution':
          return TargetResolution.fromJson(value);
        case 'TextContentParameters':
          return TextContentParameters.fromJson(value);
        case 'TextRuleParameters':
          return TextRuleParameters.fromJson(value);
        case 'ThreadedCommentResponse':
          return ThreadedCommentResponse.fromJson(value);
        case 'Thresholds':
          return Thresholds.fromJson(value);
        case 'ThumbnailResponse':
          return ThumbnailResponse.fromJson(value);
        case 'ThumbnailsSettings':
          return ThumbnailsSettings.fromJson(value);
        case 'ThumbnailsSettingsResponse':
          return ThumbnailsSettingsResponse.fromJson(value);
        case 'TranscriptionSettings':
          return TranscriptionSettings.fromJson(value);
        case 'TranscriptionSettingsResponse':
          return TranscriptionSettingsResponse.fromJson(value);
        case 'TypingIndicators':
          return TypingIndicators.fromJson(value);
        case 'TypingIndicatorsResponse':
          return TypingIndicatorsResponse.fromJson(value);
        case 'UnblockUsersRequest':
          return UnblockUsersRequest.fromJson(value);
        case 'UnblockUsersResponse':
          return UnblockUsersResponse.fromJson(value);
        case 'UnfollowResponse':
          return UnfollowResponse.fromJson(value);
        case 'UnpinActivityResponse':
          return UnpinActivityResponse.fromJson(value);
        case 'UpdateActivityPartialRequest':
          return UpdateActivityPartialRequest.fromJson(value);
        case 'UpdateActivityPartialResponse':
          return UpdateActivityPartialResponse.fromJson(value);
        case 'UpdateActivityRequest':
          return UpdateActivityRequest.fromJson(value);
        case 'UpdateActivityResponse':
          return UpdateActivityResponse.fromJson(value);
        case 'UpdateBlockListRequest':
          return UpdateBlockListRequest.fromJson(value);
        case 'UpdateBlockListResponse':
          return UpdateBlockListResponse.fromJson(value);
        case 'UpdateBookmarkFolderRequest':
          return UpdateBookmarkFolderRequest.fromJson(value);
        case 'UpdateBookmarkFolderResponse':
          return UpdateBookmarkFolderResponse.fromJson(value);
        case 'UpdateBookmarkRequest':
          return UpdateBookmarkRequest.fromJson(value);
        case 'UpdateBookmarkResponse':
          return UpdateBookmarkResponse.fromJson(value);
        case 'UpdateCommentRequest':
          return UpdateCommentRequest.fromJson(value);
        case 'UpdateCommentResponse':
          return UpdateCommentResponse.fromJson(value);
        case 'UpdateFeedMembersRequest':
          return UpdateFeedMembersRequest.fromJson(value);
        case 'UpdateFeedMembersResponse':
          return UpdateFeedMembersResponse.fromJson(value);
        case 'UpdateFeedRequest':
          return UpdateFeedRequest.fromJson(value);
        case 'UpdateFeedResponse':
          return UpdateFeedResponse.fromJson(value);
        case 'UpdateFollowRequest':
          return UpdateFollowRequest.fromJson(value);
        case 'UpdateFollowResponse':
          return UpdateFollowResponse.fromJson(value);
        case 'UpdateLiveLocationRequest':
          return UpdateLiveLocationRequest.fromJson(value);
        case 'UpdatePollOptionRequest':
          return UpdatePollOptionRequest.fromJson(value);
        case 'UpdatePollPartialRequest':
          return UpdatePollPartialRequest.fromJson(value);
        case 'UpdatePollRequest':
          return UpdatePollRequest.fromJson(value);
        case 'UpdateUserPartialRequest':
          return UpdateUserPartialRequest.fromJson(value);
        case 'UpdateUsersPartialRequest':
          return UpdateUsersPartialRequest.fromJson(value);
        case 'UpdateUsersRequest':
          return UpdateUsersRequest.fromJson(value);
        case 'UpdateUsersResponse':
          return UpdateUsersResponse.fromJson(value);
        case 'UpsertActivitiesRequest':
          return UpsertActivitiesRequest.fromJson(value);
        case 'UpsertActivitiesResponse':
          return UpsertActivitiesResponse.fromJson(value);
        case 'UpsertConfigRequest':
          return UpsertConfigRequest.fromJson(value);
        case 'UpsertConfigResponse':
          return UpsertConfigResponse.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserBannedEvent':
          return UserBannedEvent.fromJson(value);
        case 'UserCreatedWithinParameters':
          return UserCreatedWithinParameters.fromJson(value);
        case 'UserDeactivatedEvent':
          return UserDeactivatedEvent.fromJson(value);
        case 'UserMute':
          return UserMute.fromJson(value);
        case 'UserMuteResponse':
          return UserMuteResponse.fromJson(value);
        case 'UserMutedEvent':
          return UserMutedEvent.fromJson(value);
        case 'UserReactivatedEvent':
          return UserReactivatedEvent.fromJson(value);
        case 'UserRequest':
          return UserRequest.fromJson(value);
        case 'UserResponse':
          return UserResponse.fromJson(value);
        case 'UserResponseCommonFields':
          return UserResponseCommonFields.fromJson(value);
        case 'UserResponsePrivacyFields':
          return UserResponsePrivacyFields.fromJson(value);
        case 'UserRuleParameters':
          return UserRuleParameters.fromJson(value);
        case 'UserUpdatedEvent':
          return UserUpdatedEvent.fromJson(value);
        case 'VelocityFilterConfig':
          return VelocityFilterConfig.fromJson(value);
        case 'VelocityFilterConfigRule':
          return VelocityFilterConfigRule.fromJson(value);
        case 'VideoCallRuleConfig':
          return VideoCallRuleConfig.fromJson(value);
        case 'VideoContentParameters':
          return VideoContentParameters.fromJson(value);
        case 'VideoOrientation':
          return VideoOrientation.fromJson(value);
        case 'VideoRuleParameters':
          return VideoRuleParameters.fromJson(value);
        case 'VideoSettings':
          return VideoSettings.fromJson(value);
        case 'VideoSettingsResponse':
          return VideoSettingsResponse.fromJson(value);
        case 'VoteData':
          return VoteData.fromJson(value);
        case 'WSAuthMessage':
          return WSAuthMessage.fromJson(value);
        case 'WSClientEvent':
          return WSClientEvent.fromJson(value);
        case 'WSEvent':
          return WSEvent.fromJson(value);
        default:
          dynamic match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(
                    v,
                    match,
                    growable: growable,
                  )),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String' ? message.json : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient.fromJson(
          json.decode(message.json),
          targetType,
          growable: message.growable,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async =>
    value == null ? '' : json.encode(value);
