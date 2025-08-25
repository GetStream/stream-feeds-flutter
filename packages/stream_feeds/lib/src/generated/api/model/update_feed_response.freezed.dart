// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_feed_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFeedResponse {
  String get duration;
  FeedResponse get feed;

  /// Create a copy of UpdateFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFeedResponseCopyWith<UpdateFeedResponse> get copyWith =>
      _$UpdateFeedResponseCopyWithImpl<UpdateFeedResponse>(
          this as UpdateFeedResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFeedResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.feed, feed) || other.feed == feed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, feed);

  @override
  String toString() {
    return 'UpdateFeedResponse(duration: $duration, feed: $feed)';
  }
}

/// @nodoc
abstract mixin class $UpdateFeedResponseCopyWith<$Res> {
  factory $UpdateFeedResponseCopyWith(
          UpdateFeedResponse value, $Res Function(UpdateFeedResponse) _then) =
      _$UpdateFeedResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FeedResponse feed});
}

/// @nodoc
class _$UpdateFeedResponseCopyWithImpl<$Res>
    implements $UpdateFeedResponseCopyWith<$Res> {
  _$UpdateFeedResponseCopyWithImpl(this._self, this._then);

  final UpdateFeedResponse _self;
  final $Res Function(UpdateFeedResponse) _then;

  /// Create a copy of UpdateFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? feed = null,
  }) {
    return _then(UpdateFeedResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedResponse,
    ));
  }
}

// dart format on
