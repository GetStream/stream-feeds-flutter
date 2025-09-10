// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reactivated_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReactivatedEvent {
  DateTime get createdAt;
  String get type;
  User? get user;

  /// Create a copy of UserReactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReactivatedEventCopyWith<UserReactivatedEvent> get copyWith =>
      _$UserReactivatedEventCopyWithImpl<UserReactivatedEvent>(
          this as UserReactivatedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReactivatedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, type, user);

  @override
  String toString() {
    return 'UserReactivatedEvent(createdAt: $createdAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserReactivatedEventCopyWith<$Res> {
  factory $UserReactivatedEventCopyWith(UserReactivatedEvent value,
          $Res Function(UserReactivatedEvent) _then) =
      _$UserReactivatedEventCopyWithImpl;
  @useResult
  $Res call({DateTime createdAt, String type, User? user});
}

/// @nodoc
class _$UserReactivatedEventCopyWithImpl<$Res>
    implements $UserReactivatedEventCopyWith<$Res> {
  _$UserReactivatedEventCopyWithImpl(this._self, this._then);

  final UserReactivatedEvent _self;
  final $Res Function(UserReactivatedEvent) _then;

  /// Create a copy of UserReactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(UserReactivatedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
