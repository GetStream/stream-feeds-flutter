// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinActivityResponse {
  ActivityResponse get activity;
  DateTime get createdAt;
  String get duration;
  String get feed;
  String get userId;

  /// Create a copy of PinActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PinActivityResponseCopyWith<PinActivityResponse> get copyWith =>
      _$PinActivityResponseCopyWithImpl<PinActivityResponse>(
          this as PinActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PinActivityResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activity, createdAt, duration, feed, userId);

  @override
  String toString() {
    return 'PinActivityResponse(activity: $activity, createdAt: $createdAt, duration: $duration, feed: $feed, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $PinActivityResponseCopyWith<$Res> {
  factory $PinActivityResponseCopyWith(
          PinActivityResponse value, $Res Function(PinActivityResponse) _then) =
      _$PinActivityResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity,
      DateTime createdAt,
      String duration,
      String feed,
      String userId});
}

/// @nodoc
class _$PinActivityResponseCopyWithImpl<$Res>
    implements $PinActivityResponseCopyWith<$Res> {
  _$PinActivityResponseCopyWithImpl(this._self, this._then);

  final PinActivityResponse _self;
  final $Res Function(PinActivityResponse) _then;

  /// Create a copy of PinActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? duration = null,
    Object? feed = null,
    Object? userId = null,
  }) {
    return _then(PinActivityResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
