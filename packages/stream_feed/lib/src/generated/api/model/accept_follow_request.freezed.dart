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
  String get source;
  String get target;

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
            (identical(other.source, source) || other.source == source) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, followerRole, source, target);

  @override
  String toString() {
    return 'AcceptFollowRequest(followerRole: $followerRole, source: $source, target: $target)';
  }
}

/// @nodoc
abstract mixin class $AcceptFollowRequestCopyWith<$Res> {
  factory $AcceptFollowRequestCopyWith(
          AcceptFollowRequest value, $Res Function(AcceptFollowRequest) _then) =
      _$AcceptFollowRequestCopyWithImpl;
  @useResult
  $Res call({String? followerRole, String source, String target});
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
    Object? source = null,
    Object? target = null,
  }) {
    return _then(AcceptFollowRequest(
      followerRole: freezed == followerRole
          ? _self.followerRole
          : followerRole // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
