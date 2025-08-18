// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_follow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcceptFollowRequest {
  String? get followerRole;
  String get sourceFid;
  String get targetFid;

  /// Create a copy of AcceptFollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AcceptFollowRequestCopyWith<AcceptFollowRequest> get copyWith =>
      _$AcceptFollowRequestCopyWithImpl<AcceptFollowRequest>(
          this as AcceptFollowRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AcceptFollowRequest &&
            (identical(other.followerRole, followerRole) ||
                other.followerRole == followerRole) &&
            (identical(other.sourceFid, sourceFid) ||
                other.sourceFid == sourceFid) &&
            (identical(other.targetFid, targetFid) ||
                other.targetFid == targetFid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, followerRole, sourceFid, targetFid);

  @override
  String toString() {
    return 'AcceptFollowRequest(followerRole: $followerRole, sourceFid: $sourceFid, targetFid: $targetFid)';
  }
}

/// @nodoc
abstract mixin class $AcceptFollowRequestCopyWith<$Res> {
  factory $AcceptFollowRequestCopyWith(
          AcceptFollowRequest value, $Res Function(AcceptFollowRequest) _then) =
      _$AcceptFollowRequestCopyWithImpl;
  @useResult
  $Res call({String? followerRole, String sourceFid, String targetFid});
}

/// @nodoc
class _$AcceptFollowRequestCopyWithImpl<$Res>
    implements $AcceptFollowRequestCopyWith<$Res> {
  _$AcceptFollowRequestCopyWithImpl(this._self, this._then);

  final AcceptFollowRequest _self;
  final $Res Function(AcceptFollowRequest) _then;

  /// Create a copy of AcceptFollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followerRole = freezed,
    Object? sourceFid = null,
    Object? targetFid = null,
  }) {
    return _then(AcceptFollowRequest(
      followerRole: freezed == followerRole
          ? _self.followerRole
          : followerRole // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceFid: null == sourceFid
          ? _self.sourceFid
          : sourceFid // ignore: cast_nullable_to_non_nullable
              as String,
      targetFid: null == targetFid
          ? _self.targetFid
          : targetFid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
