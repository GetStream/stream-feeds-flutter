// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_feed_visibility_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeFeedVisibilityResponse {
  String get duration;
  FeedResponse get feed;

  /// Create a copy of ChangeFeedVisibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeFeedVisibilityResponseCopyWith<ChangeFeedVisibilityResponse>
      get copyWith => _$ChangeFeedVisibilityResponseCopyWithImpl<
              ChangeFeedVisibilityResponse>(
          this as ChangeFeedVisibilityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeFeedVisibilityResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.feed, feed) || other.feed == feed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, feed);

  @override
  String toString() {
    return 'ChangeFeedVisibilityResponse(duration: $duration, feed: $feed)';
  }
}

/// @nodoc
abstract mixin class $ChangeFeedVisibilityResponseCopyWith<$Res> {
  factory $ChangeFeedVisibilityResponseCopyWith(
          ChangeFeedVisibilityResponse value,
          $Res Function(ChangeFeedVisibilityResponse) _then) =
      _$ChangeFeedVisibilityResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FeedResponse feed});
}

/// @nodoc
class _$ChangeFeedVisibilityResponseCopyWithImpl<$Res>
    implements $ChangeFeedVisibilityResponseCopyWith<$Res> {
  _$ChangeFeedVisibilityResponseCopyWithImpl(this._self, this._then);

  final ChangeFeedVisibilityResponse _self;
  final $Res Function(ChangeFeedVisibilityResponse) _then;

  /// Create a copy of ChangeFeedVisibilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? feed = null,
  }) {
    return _then(ChangeFeedVisibilityResponse(
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
