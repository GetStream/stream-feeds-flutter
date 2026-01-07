// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_muted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMutedEvent {
  DateTime get createdAt;
  String? get targetUser;
  List<String>? get targetUsers;
  String get type;
  User? get user;

  /// Create a copy of UserMutedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserMutedEventCopyWith<UserMutedEvent> get copyWith =>
      _$UserMutedEventCopyWithImpl<UserMutedEvent>(
          this as UserMutedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserMutedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.targetUser, targetUser) ||
                other.targetUser == targetUser) &&
            const DeepCollectionEquality()
                .equals(other.targetUsers, targetUsers) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, targetUser,
      const DeepCollectionEquality().hash(targetUsers), type, user);

  @override
  String toString() {
    return 'UserMutedEvent(createdAt: $createdAt, targetUser: $targetUser, targetUsers: $targetUsers, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserMutedEventCopyWith<$Res> {
  factory $UserMutedEventCopyWith(
          UserMutedEvent value, $Res Function(UserMutedEvent) _then) =
      _$UserMutedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      String? targetUser,
      List<String>? targetUsers,
      String type,
      User? user});
}

/// @nodoc
class _$UserMutedEventCopyWithImpl<$Res>
    implements $UserMutedEventCopyWith<$Res> {
  _$UserMutedEventCopyWithImpl(this._self, this._then);

  final UserMutedEvent _self;
  final $Res Function(UserMutedEvent) _then;

  /// Create a copy of UserMutedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? targetUser = freezed,
    Object? targetUsers = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(UserMutedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetUser: freezed == targetUser
          ? _self.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as String?,
      targetUsers: freezed == targetUsers
          ? _self.targetUsers
          : targetUsers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

// dart format on
