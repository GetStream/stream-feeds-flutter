// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_deactivated_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDeactivatedEvent {
  DateTime get createdAt;
  User get createdBy;
  String get type;
  User? get user;

  /// Create a copy of UserDeactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDeactivatedEventCopyWith<UserDeactivatedEvent> get copyWith =>
      _$UserDeactivatedEventCopyWithImpl<UserDeactivatedEvent>(
          this as UserDeactivatedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDeactivatedEvent &&
            super == other &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, super.hashCode, createdAt, createdBy, type, user);

  @override
  String toString() {
    return 'UserDeactivatedEvent(createdAt: $createdAt, createdBy: $createdBy, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserDeactivatedEventCopyWith<$Res> {
  factory $UserDeactivatedEventCopyWith(UserDeactivatedEvent value,
          $Res Function(UserDeactivatedEvent) _then) =
      _$UserDeactivatedEventCopyWithImpl;
  @useResult
  $Res call({DateTime createdAt, User createdBy, String type, User? user});
}

/// @nodoc
class _$UserDeactivatedEventCopyWithImpl<$Res>
    implements $UserDeactivatedEventCopyWith<$Res> {
  _$UserDeactivatedEventCopyWithImpl(this._self, this._then);

  final UserDeactivatedEvent _self;
  final $Res Function(UserDeactivatedEvent) _then;

  /// Create a copy of UserDeactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = null,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(UserDeactivatedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
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
