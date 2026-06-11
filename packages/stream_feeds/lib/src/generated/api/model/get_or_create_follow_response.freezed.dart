// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_or_create_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOrCreateFollowResponse {
  bool get created;
  String get duration;
  FollowResponse get follow;
  bool? get notificationCreated;

  /// Create a copy of GetOrCreateFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOrCreateFollowResponseCopyWith<GetOrCreateFollowResponse> get copyWith =>
      _$GetOrCreateFollowResponseCopyWithImpl<GetOrCreateFollowResponse>(
          this as GetOrCreateFollowResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOrCreateFollowResponse &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.notificationCreated, notificationCreated) ||
                other.notificationCreated == notificationCreated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, created, duration, follow, notificationCreated);

  @override
  String toString() {
    return 'GetOrCreateFollowResponse(created: $created, duration: $duration, follow: $follow, notificationCreated: $notificationCreated)';
  }
}

/// @nodoc
abstract mixin class $GetOrCreateFollowResponseCopyWith<$Res> {
  factory $GetOrCreateFollowResponseCopyWith(GetOrCreateFollowResponse value,
          $Res Function(GetOrCreateFollowResponse) _then) =
      _$GetOrCreateFollowResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool created,
      String duration,
      FollowResponse follow,
      bool? notificationCreated});
}

/// @nodoc
class _$GetOrCreateFollowResponseCopyWithImpl<$Res>
    implements $GetOrCreateFollowResponseCopyWith<$Res> {
  _$GetOrCreateFollowResponseCopyWithImpl(this._self, this._then);

  final GetOrCreateFollowResponse _self;
  final $Res Function(GetOrCreateFollowResponse) _then;

  /// Create a copy of GetOrCreateFollowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? duration = null,
    Object? follow = null,
    Object? notificationCreated = freezed,
  }) {
    return _then(GetOrCreateFollowResponse(
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      follow: null == follow
          ? _self.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as FollowResponse,
      notificationCreated: freezed == notificationCreated
          ? _self.notificationCreated
          : notificationCreated // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
