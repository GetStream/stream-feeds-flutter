// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_unfollow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOrCreateUnfollowResponse {
  bool get deleted;
  String get duration;
  FollowResponse? get follow;

  /// Create a copy of GetOrCreateUnfollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOrCreateUnfollowResponseCopyWith<GetOrCreateUnfollowResponse>
      get copyWith => _$GetOrCreateUnfollowResponseCopyWithImpl<
              GetOrCreateUnfollowResponse>(
          this as GetOrCreateUnfollowResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOrCreateUnfollowResponse &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.follow, follow) || other.follow == follow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deleted, duration, follow);

  @override
  String toString() {
    return 'GetOrCreateUnfollowResponse(deleted: $deleted, duration: $duration, follow: $follow)';
  }
}

/// @nodoc
abstract mixin class $GetOrCreateUnfollowResponseCopyWith<$Res> {
  factory $GetOrCreateUnfollowResponseCopyWith(
          GetOrCreateUnfollowResponse value,
          $Res Function(GetOrCreateUnfollowResponse) _then) =
      _$GetOrCreateUnfollowResponseCopyWithImpl;
  @useResult
  $Res call({bool deleted, String duration, FollowResponse? follow});
}

/// @nodoc
class _$GetOrCreateUnfollowResponseCopyWithImpl<$Res>
    implements $GetOrCreateUnfollowResponseCopyWith<$Res> {
  _$GetOrCreateUnfollowResponseCopyWithImpl(this._self, this._then);

  final GetOrCreateUnfollowResponse _self;
  final $Res Function(GetOrCreateUnfollowResponse) _then;

  /// Create a copy of GetOrCreateUnfollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleted = null,
    Object? duration = null,
    Object? follow = freezed,
  }) {
    return _then(GetOrCreateUnfollowResponse(
      deleted: null == deleted
          ? _self.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      follow: freezed == follow
          ? _self.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as FollowResponse?,
    ));
  }
}

// dart format on
