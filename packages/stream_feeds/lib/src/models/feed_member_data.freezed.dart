// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_member_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedMemberData {
  DateTime get createdAt;
  DateTime? get inviteAcceptedAt;
  DateTime? get inviteRejectedAt;
  String get role;
  FeedMemberStatus get status;
  DateTime get updatedAt;
  UserData get user;
  Map<String, Object?>? get custom;

  /// Create a copy of FeedMemberData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberDataCopyWith<FeedMemberData> get copyWith =>
      _$FeedMemberDataCopyWithImpl<FeedMemberData>(
          this as FeedMemberData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberData &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.inviteAcceptedAt, inviteAcceptedAt) ||
                other.inviteAcceptedAt == inviteAcceptedAt) &&
            (identical(other.inviteRejectedAt, inviteRejectedAt) ||
                other.inviteRejectedAt == inviteRejectedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      inviteAcceptedAt,
      inviteRejectedAt,
      role,
      status,
      updatedAt,
      user,
      const DeepCollectionEquality().hash(custom));

  @override
  String toString() {
    return 'FeedMemberData(createdAt: $createdAt, inviteAcceptedAt: $inviteAcceptedAt, inviteRejectedAt: $inviteRejectedAt, role: $role, status: $status, updatedAt: $updatedAt, user: $user, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberDataCopyWith<$Res> {
  factory $FeedMemberDataCopyWith(
          FeedMemberData value, $Res Function(FeedMemberData) _then) =
      _$FeedMemberDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      DateTime? inviteAcceptedAt,
      DateTime? inviteRejectedAt,
      String role,
      FeedMemberStatus status,
      DateTime updatedAt,
      UserData user,
      Map<String, Object?>? custom});
}

/// @nodoc
class _$FeedMemberDataCopyWithImpl<$Res>
    implements $FeedMemberDataCopyWith<$Res> {
  _$FeedMemberDataCopyWithImpl(this._self, this._then);

  final FeedMemberData _self;
  final $Res Function(FeedMemberData) _then;

  /// Create a copy of FeedMemberData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? inviteAcceptedAt = freezed,
    Object? inviteRejectedAt = freezed,
    Object? role = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? custom = freezed,
  }) {
    return _then(FeedMemberData(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as FeedMemberStatus,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

// dart format on
