// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_follow_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectFollowRequest {
  String get sourceFid;
  String get targetFid;

  /// Create a copy of RejectFollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RejectFollowRequestCopyWith<RejectFollowRequest> get copyWith =>
      _$RejectFollowRequestCopyWithImpl<RejectFollowRequest>(
          this as RejectFollowRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RejectFollowRequest &&
            (identical(other.sourceFid, sourceFid) ||
                other.sourceFid == sourceFid) &&
            (identical(other.targetFid, targetFid) ||
                other.targetFid == targetFid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceFid, targetFid);

  @override
  String toString() {
    return 'RejectFollowRequest(sourceFid: $sourceFid, targetFid: $targetFid)';
  }
}

/// @nodoc
abstract mixin class $RejectFollowRequestCopyWith<$Res> {
  factory $RejectFollowRequestCopyWith(
          RejectFollowRequest value, $Res Function(RejectFollowRequest) _then) =
      _$RejectFollowRequestCopyWithImpl;
  @useResult
  $Res call({String sourceFid, String targetFid});
}

/// @nodoc
class _$RejectFollowRequestCopyWithImpl<$Res>
    implements $RejectFollowRequestCopyWith<$Res> {
  _$RejectFollowRequestCopyWithImpl(this._self, this._then);

  final RejectFollowRequest _self;
  final $Res Function(RejectFollowRequest) _then;

  /// Create a copy of RejectFollowRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceFid = null,
    Object? targetFid = null,
  }) {
    return _then(RejectFollowRequest(
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
