// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallMember {
  DateTime get createdAt;
  Map<String, Object> get custom;
  DateTime? get deletedAt;
  String get role;
  DateTime get updatedAt;
  User? get user;
  String get userId;

  /// Create a copy of CallMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallMemberCopyWith<CallMember> get copyWith =>
      _$CallMemberCopyWithImpl<CallMember>(this as CallMember, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallMember &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      deletedAt,
      role,
      updatedAt,
      user,
      userId);

  @override
  String toString() {
    return 'CallMember(createdAt: $createdAt, custom: $custom, deletedAt: $deletedAt, role: $role, updatedAt: $updatedAt, user: $user, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $CallMemberCopyWith<$Res> {
  factory $CallMemberCopyWith(
          CallMember value, $Res Function(CallMember) _then) =
      _$CallMemberCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object> custom,
      DateTime? deletedAt,
      String role,
      DateTime updatedAt,
      User? user,
      String userId});
}

/// @nodoc
class _$CallMemberCopyWithImpl<$Res> implements $CallMemberCopyWith<$Res> {
  _$CallMemberCopyWithImpl(this._self, this._then);

  final CallMember _self;
  final $Res Function(CallMember) _then;

  /// Create a copy of CallMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? role = null,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? userId = null,
  }) {
    return _then(CallMember(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
