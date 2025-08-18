// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_member_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedMemberRequest {
  Map<String, Object>? get custom;
  bool? get invite;
  String? get role;
  String get userId;

  /// Create a copy of FeedMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberRequestCopyWith<FeedMemberRequest> get copyWith =>
      _$FeedMemberRequestCopyWithImpl<FeedMemberRequest>(
          this as FeedMemberRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberRequest &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(custom), invite, role, userId);

  @override
  String toString() {
    return 'FeedMemberRequest(custom: $custom, invite: $invite, role: $role, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberRequestCopyWith<$Res> {
  factory $FeedMemberRequestCopyWith(
          FeedMemberRequest value, $Res Function(FeedMemberRequest) _then) =
      _$FeedMemberRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object>? custom, bool? invite, String? role, String userId});
}

/// @nodoc
class _$FeedMemberRequestCopyWithImpl<$Res>
    implements $FeedMemberRequestCopyWith<$Res> {
  _$FeedMemberRequestCopyWithImpl(this._self, this._then);

  final FeedMemberRequest _self;
  final $Res Function(FeedMemberRequest) _then;

  /// Create a copy of FeedMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custom = freezed,
    Object? invite = freezed,
    Object? role = freezed,
    Object? userId = null,
  }) {
    return _then(FeedMemberRequest(
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      invite: freezed == invite
          ? _self.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
