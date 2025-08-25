// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowResponse {
  DateTime get createdAt;
  Map<String, Object?>? get custom;
  String get followerRole;
  FollowResponsePushPreference get pushPreference;
  DateTime? get requestAcceptedAt;
  DateTime? get requestRejectedAt;
  FeedResponse get sourceFeed;
  FollowResponseStatus get status;
  FeedResponse get targetFeed;
  DateTime get updatedAt;

  /// Create a copy of FollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowResponseCopyWith<FollowResponse> get copyWith =>
      _$FollowResponseCopyWithImpl<FollowResponse>(
          this as FollowResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.followerRole, followerRole) ||
                other.followerRole == followerRole) &&
            (identical(other.pushPreference, pushPreference) ||
                other.pushPreference == pushPreference) &&
            (identical(other.requestAcceptedAt, requestAcceptedAt) ||
                other.requestAcceptedAt == requestAcceptedAt) &&
            (identical(other.requestRejectedAt, requestRejectedAt) ||
                other.requestRejectedAt == requestRejectedAt) &&
            (identical(other.sourceFeed, sourceFeed) ||
                other.sourceFeed == sourceFeed) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.targetFeed, targetFeed) ||
                other.targetFeed == targetFeed) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      followerRole,
      pushPreference,
      requestAcceptedAt,
      requestRejectedAt,
      sourceFeed,
      status,
      targetFeed,
      updatedAt);

  @override
  String toString() {
    return 'FollowResponse(createdAt: $createdAt, custom: $custom, followerRole: $followerRole, pushPreference: $pushPreference, requestAcceptedAt: $requestAcceptedAt, requestRejectedAt: $requestRejectedAt, sourceFeed: $sourceFeed, status: $status, targetFeed: $targetFeed, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $FollowResponseCopyWith<$Res> {
  factory $FollowResponseCopyWith(
          FollowResponse value, $Res Function(FollowResponse) _then) =
      _$FollowResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?>? custom,
      String followerRole,
      FollowResponsePushPreference pushPreference,
      DateTime? requestAcceptedAt,
      DateTime? requestRejectedAt,
      FeedResponse sourceFeed,
      FollowResponseStatus status,
      FeedResponse targetFeed,
      DateTime updatedAt});
}

/// @nodoc
class _$FollowResponseCopyWithImpl<$Res>
    implements $FollowResponseCopyWith<$Res> {
  _$FollowResponseCopyWithImpl(this._self, this._then);

  final FollowResponse _self;
  final $Res Function(FollowResponse) _then;

  /// Create a copy of FollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = freezed,
    Object? followerRole = null,
    Object? pushPreference = null,
    Object? requestAcceptedAt = freezed,
    Object? requestRejectedAt = freezed,
    Object? sourceFeed = null,
    Object? status = null,
    Object? targetFeed = null,
    Object? updatedAt = null,
  }) {
    return _then(FollowResponse(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      followerRole: null == followerRole
          ? _self.followerRole
          : followerRole // ignore: cast_nullable_to_non_nullable
              as String,
      pushPreference: null == pushPreference
          ? _self.pushPreference
          : pushPreference // ignore: cast_nullable_to_non_nullable
              as FollowResponsePushPreference,
      requestAcceptedAt: freezed == requestAcceptedAt
          ? _self.requestAcceptedAt
          : requestAcceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestRejectedAt: freezed == requestRejectedAt
          ? _self.requestRejectedAt
          : requestRejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sourceFeed: null == sourceFeed
          ? _self.sourceFeed
          : sourceFeed // ignore: cast_nullable_to_non_nullable
              as FeedResponse,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FollowResponseStatus,
      targetFeed: null == targetFeed
          ? _self.targetFeed
          : targetFeed // ignore: cast_nullable_to_non_nullable
              as FeedResponse,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
