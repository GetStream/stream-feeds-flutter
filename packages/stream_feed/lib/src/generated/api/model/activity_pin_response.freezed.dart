// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_pin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityPinResponse {
  ActivityResponse get activity;
  DateTime get createdAt;
  String get feed;
  DateTime get updatedAt;
  UserResponse get user;

  /// Create a copy of ActivityPinResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityPinResponseCopyWith<ActivityPinResponse> get copyWith =>
      _$ActivityPinResponseCopyWithImpl<ActivityPinResponse>(
          this as ActivityPinResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityPinResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activity, createdAt, feed, updatedAt, user);

  @override
  String toString() {
    return 'ActivityPinResponse(activity: $activity, createdAt: $createdAt, feed: $feed, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityPinResponseCopyWith<$Res> {
  factory $ActivityPinResponseCopyWith(
          ActivityPinResponse value, $Res Function(ActivityPinResponse) _then) =
      _$ActivityPinResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity,
      DateTime createdAt,
      String feed,
      DateTime updatedAt,
      UserResponse user});
}

/// @nodoc
class _$ActivityPinResponseCopyWithImpl<$Res>
    implements $ActivityPinResponseCopyWith<$Res> {
  _$ActivityPinResponseCopyWithImpl(this._self, this._then);

  final ActivityPinResponse _self;
  final $Res Function(ActivityPinResponse) _then;

  /// Create a copy of ActivityPinResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? feed = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(ActivityPinResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse,
    ));
  }
}

// dart format on
