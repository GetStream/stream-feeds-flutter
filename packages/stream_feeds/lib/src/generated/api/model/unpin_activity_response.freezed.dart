// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unpin_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnpinActivityResponse {
  ActivityResponse get activity;
  String get duration;
  String get feed;
  String get userId;

  /// Create a copy of UnpinActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnpinActivityResponseCopyWith<UnpinActivityResponse> get copyWith =>
      _$UnpinActivityResponseCopyWithImpl<UnpinActivityResponse>(
          this as UnpinActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnpinActivityResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activity, duration, feed, userId);

  @override
  String toString() {
    return 'UnpinActivityResponse(activity: $activity, duration: $duration, feed: $feed, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $UnpinActivityResponseCopyWith<$Res> {
  factory $UnpinActivityResponseCopyWith(UnpinActivityResponse value,
          $Res Function(UnpinActivityResponse) _then) =
      _$UnpinActivityResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity, String duration, String feed, String userId});
}

/// @nodoc
class _$UnpinActivityResponseCopyWithImpl<$Res>
    implements $UnpinActivityResponseCopyWith<$Res> {
  _$UnpinActivityResponseCopyWithImpl(this._self, this._then);

  final UnpinActivityResponse _self;
  final $Res Function(UnpinActivityResponse) _then;

  /// Create a copy of UnpinActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? duration = null,
    Object? feed = null,
    Object? userId = null,
  }) {
    return _then(UnpinActivityResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
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
