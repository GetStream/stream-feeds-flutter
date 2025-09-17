// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowData {
  DateTime get createdAt;
  String get followerRole;
  String get pushPreference;
  DateTime? get requestAcceptedAt;
  DateTime? get requestRejectedAt;
  FeedData get sourceFeed;
  FollowStatus get status;
  FeedData get targetFeed;
  DateTime get updatedAt;
  Map<String, Object?>? get custom;

  /// Create a copy of FollowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowDataCopyWith<FollowData> get copyWith =>
      _$FollowDataCopyWithImpl<FollowData>(this as FollowData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowData &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
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
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      followerRole,
      pushPreference,
      requestAcceptedAt,
      requestRejectedAt,
      sourceFeed,
      status,
      targetFeed,
      updatedAt,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FollowData(createdAt: $createdAt, followerRole: $followerRole, pushPreference: $pushPreference, requestAcceptedAt: $requestAcceptedAt, requestRejectedAt: $requestRejectedAt, sourceFeed: $sourceFeed, status: $status, targetFeed: $targetFeed, updatedAt: $updatedAt, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FollowDataCopyWith<$Res> {
  factory $FollowDataCopyWith(
          FollowData value, $Res Function(FollowData) _then) =
      _$FollowDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      String followerRole,
      String pushPreference,
      DateTime? requestAcceptedAt,
      DateTime? requestRejectedAt,
      FeedData sourceFeed,
      FollowStatus status,
      FeedData targetFeed,
      DateTime updatedAt,
      Map<String, Object?>? custom});
}

/// @nodoc
class _$FollowDataCopyWithImpl<$Res> implements $FollowDataCopyWith<$Res> {
  _$FollowDataCopyWithImpl(this._self, this._then);

  final FollowData _self;
  final $Res Function(FollowData) _then;

  /// Create a copy of FollowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? followerRole = null,
    Object? pushPreference = null,
    Object? requestAcceptedAt = freezed,
    Object? requestRejectedAt = freezed,
    Object? sourceFeed = null,
    Object? status = null,
    Object? targetFeed = null,
    Object? updatedAt = null,
    Object? custom = freezed,
  }) {
    return _then(FollowData(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      followerRole: null == followerRole
          ? _self.followerRole
          : followerRole // ignore: cast_nullable_to_non_nullable
              as String,
      pushPreference: null == pushPreference
          ? _self.pushPreference
          : pushPreference // ignore: cast_nullable_to_non_nullable
              as String,
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
              as FeedData,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FollowStatus,
      targetFeed: null == targetFeed
          ? _self.targetFeed
          : targetFeed // ignore: cast_nullable_to_non_nullable
              as FeedData,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

// dart format on
