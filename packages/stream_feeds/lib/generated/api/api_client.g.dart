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
        case 'APIError':
          return APIError.fromJson(value);
        case 'Action':
          return Action.fromJson(value);
        case 'ActivityAddedEvent':
          return ActivityAddedEvent.fromJson(value);
        case 'ActivityDeletedEvent':
          return ActivityDeletedEvent.fromJson(value);
        case 'ActivityLocation':
          return ActivityLocation.fromJson(value);
        case 'ActivityMarkEvent':
          return ActivityMarkEvent.fromJson(value);
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
        case 'ActivityResponse':
          return ActivityResponse.fromJson(value);
        case 'ActivityUnpinnedEvent':
          return ActivityUnpinnedEvent.fromJson(value);
        case 'ActivityUpdatedEvent':
          return ActivityUpdatedEvent.fromJson(value);
        case 'AggregatedActivityResponse':
          return AggregatedActivityResponse.fromJson(value);
        case 'AppEventResponse':
          return AppEventResponse.fromJson(value);
        case 'AppUpdatedEvent':
          return AppUpdatedEvent.fromJson(value);
        case 'Attachment':
          return Attachment.fromJson(value);
        case 'BlockListOptions':
          return BlockListOptions.fromJson(value);
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
        case 'DeviceResponse':
          return DeviceResponse.fromJson(value);
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
        case 'FeedMemberAddedEvent':
          return FeedMemberAddedEvent.fromJson(value);
        case 'FeedMemberRemovedEvent':
          return FeedMemberRemovedEvent.fromJson(value);
        case 'FeedMemberResponse':
          return FeedMemberResponse.fromJson(value);
        case 'FeedMemberUpdatedEvent':
          return FeedMemberUpdatedEvent.fromJson(value);
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
        case 'FollowCreatedEvent':
          return FollowCreatedEvent.fromJson(value);
        case 'FollowDeletedEvent':
          return FollowDeletedEvent.fromJson(value);
        case 'FollowResponse':
          return FollowResponse.fromJson(value);
        case 'FollowUpdatedEvent':
          return FollowUpdatedEvent.fromJson(value);
        case 'HealthCheckEvent':
          return HealthCheckEvent.fromJson(value);
        case 'ImageData':
          return ImageData.fromJson(value);
        case 'Images':
          return Images.fromJson(value);
        case 'LabelThresholds':
          return LabelThresholds.fromJson(value);
        case 'ModerationV2Response':
          return ModerationV2Response.fromJson(value);
        case 'NotificationConfig':
          return NotificationConfig.fromJson(value);
        case 'NotificationFeedUpdatedEvent':
          return NotificationFeedUpdatedEvent.fromJson(value);
        case 'NotificationStatusResponse':
          return NotificationStatusResponse.fromJson(value);
        case 'OwnUserResponse':
          return OwnUserResponse.fromJson(value);
        case 'PinActivityResponse':
          return PinActivityResponse.fromJson(value);
        case 'PollClosedFeedEvent':
          return PollClosedFeedEvent.fromJson(value);
        case 'PollDeletedFeedEvent':
          return PollDeletedFeedEvent.fromJson(value);
        case 'PollOptionResponseData':
          return PollOptionResponseData.fromJson(value);
        case 'PollResponseData':
          return PollResponseData.fromJson(value);
        case 'PollUpdatedFeedEvent':
          return PollUpdatedFeedEvent.fromJson(value);
        case 'PollVoteCastedFeedEvent':
          return PollVoteCastedFeedEvent.fromJson(value);
        case 'PollVoteChangedFeedEvent':
          return PollVoteChangedFeedEvent.fromJson(value);
        case 'PollVoteRemovedFeedEvent':
          return PollVoteRemovedFeedEvent.fromJson(value);
        case 'PollVoteResponseData':
          return PollVoteResponseData.fromJson(value);
        case 'PrivacySettings':
          return PrivacySettings.fromJson(value);
        case 'PrivacySettingsResponse':
          return PrivacySettingsResponse.fromJson(value);
        case 'PushPreferences':
          return PushPreferences.fromJson(value);
        case 'ReactionGroupResponse':
          return ReactionGroupResponse.fromJson(value);
        case 'ReadReceipts':
          return ReadReceipts.fromJson(value);
        case 'ReadReceiptsResponse':
          return ReadReceiptsResponse.fromJson(value);
        case 'StoriesConfig':
          return StoriesConfig.fromJson(value);
        case 'Thresholds':
          return Thresholds.fromJson(value);
        case 'TypingIndicators':
          return TypingIndicators.fromJson(value);
        case 'TypingIndicatorsResponse':
          return TypingIndicatorsResponse.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserBannedEvent':
          return UserBannedEvent.fromJson(value);
        case 'UserDeactivatedEvent':
          return UserDeactivatedEvent.fromJson(value);
        case 'UserMuteResponse':
          return UserMuteResponse.fromJson(value);
        case 'UserMutedEvent':
          return UserMutedEvent.fromJson(value);
        case 'UserReactivatedEvent':
          return UserReactivatedEvent.fromJson(value);
        case 'UserResponse':
          return UserResponse.fromJson(value);
        case 'UserResponseCommonFields':
          return UserResponseCommonFields.fromJson(value);
        case 'UserResponsePrivacyFields':
          return UserResponsePrivacyFields.fromJson(value);
        case 'UserUpdatedEvent':
          return UserUpdatedEvent.fromJson(value);
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
