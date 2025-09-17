// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcceptFollowResponse {
  String get duration;
  FollowResponse get follow;

  /// Create a copy of AcceptFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AcceptFollowResponseCopyWith<AcceptFollowResponse> get copyWith =>
      _$AcceptFollowResponseCopyWithImpl<AcceptFollowResponse>(
          this as AcceptFollowResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AcceptFollowResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.follow, follow) || other.follow == follow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, follow);

  @override
  String toString() {
    return 'AcceptFollowResponse(duration: $duration, follow: $follow)';
  }
}

/// @nodoc
abstract mixin class $AcceptFollowResponseCopyWith<$Res> {
  factory $AcceptFollowResponseCopyWith(AcceptFollowResponse value,
          $Res Function(AcceptFollowResponse) _then) =
      _$AcceptFollowResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FollowResponse follow});
}

/// @nodoc
class _$AcceptFollowResponseCopyWithImpl<$Res>
    implements $AcceptFollowResponseCopyWith<$Res> {
  _$AcceptFollowResponseCopyWithImpl(this._self, this._then);

  final AcceptFollowResponse _self;
  final $Res Function(AcceptFollowResponse) _then;

  /// Create a copy of AcceptFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? follow = null,
  }) {
    return _then(AcceptFollowResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      follow: null == follow
          ? _self.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as FollowResponse,
    ));
  }
}

// dart format on
