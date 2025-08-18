// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_member_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedMemberResponse {
  DateTime get createdAt;
  Map<String, Object>? get custom;
  DateTime? get inviteAcceptedAt;
  DateTime? get inviteRejectedAt;
  String get role;
  FeedMemberResponseStatus get status;
  DateTime get updatedAt;
  UserResponse get user;

  /// Create a copy of FeedMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberResponseCopyWith<FeedMemberResponse> get copyWith =>
      _$FeedMemberResponseCopyWithImpl<FeedMemberResponse>(
          this as FeedMemberResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberResponse &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.inviteAcceptedAt, inviteAcceptedAt) ||
                other.inviteAcceptedAt == inviteAcceptedAt) &&
            (identical(other.inviteRejectedAt, inviteRejectedAt) ||
                other.inviteRejectedAt == inviteRejectedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      inviteAcceptedAt,
      inviteRejectedAt,
      role,
      status,
      updatedAt,
      user);

  @override
  String toString() {
    return 'FeedMemberResponse(createdAt: $createdAt, custom: $custom, inviteAcceptedAt: $inviteAcceptedAt, inviteRejectedAt: $inviteRejectedAt, role: $role, status: $status, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberResponseCopyWith<$Res> {
  factory $FeedMemberResponseCopyWith(
          FeedMemberResponse value, $Res Function(FeedMemberResponse) _then) =
      _$FeedMemberResponseCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object>? custom,
      DateTime? inviteAcceptedAt,
      DateTime? inviteRejectedAt,
      String role,
      FeedMemberResponseStatus status,
      DateTime updatedAt,
      UserResponse user});
}

/// @nodoc
class _$FeedMemberResponseCopyWithImpl<$Res>
    implements $FeedMemberResponseCopyWith<$Res> {
  _$FeedMemberResponseCopyWithImpl(this._self, this._then);

  final FeedMemberResponse _self;
  final $Res Function(FeedMemberResponse) _then;

  /// Create a copy of FeedMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = freezed,
    Object? inviteAcceptedAt = freezed,
    Object? inviteRejectedAt = freezed,
    Object? role = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(FeedMemberResponse(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
      inviteAcceptedAt: freezed == inviteAcceptedAt
          ? _self.inviteAcceptedAt
          : inviteAcceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inviteRejectedAt: freezed == inviteRejectedAt
          ? _self.inviteRejectedAt
          : inviteRejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedMemberResponseStatus,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse,
    ));
  }
}

// dart format on
