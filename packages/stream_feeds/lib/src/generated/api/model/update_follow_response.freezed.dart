// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateFollowResponse {
  String get duration;
  FollowResponse get follow;

  /// Create a copy of UpdateFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateFollowResponseCopyWith<UpdateFollowResponse> get copyWith =>
      _$UpdateFollowResponseCopyWithImpl<UpdateFollowResponse>(
          this as UpdateFollowResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFollowResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.follow, follow) || other.follow == follow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, follow);

  @override
  String toString() {
    return 'UpdateFollowResponse(duration: $duration, follow: $follow)';
  }
}

/// @nodoc
abstract mixin class $UpdateFollowResponseCopyWith<$Res> {
  factory $UpdateFollowResponseCopyWith(UpdateFollowResponse value,
          $Res Function(UpdateFollowResponse) _then) =
      _$UpdateFollowResponseCopyWithImpl;
  @useResult
  $Res call({String duration, FollowResponse follow});
}

/// @nodoc
class _$UpdateFollowResponseCopyWithImpl<$Res>
    implements $UpdateFollowResponseCopyWith<$Res> {
  _$UpdateFollowResponseCopyWithImpl(this._self, this._then);

  final UpdateFollowResponse _self;
  final $Res Function(UpdateFollowResponse) _then;

  /// Create a copy of UpdateFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? follow = null,
  }) {
    return _then(UpdateFollowResponse(
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
