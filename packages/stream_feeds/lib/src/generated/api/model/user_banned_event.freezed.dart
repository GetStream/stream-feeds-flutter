// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_banned_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBannedEvent {
  String get channelId;
  String get channelType;
  String get cid;
  DateTime get createdAt;
  User get createdBy;
  DateTime? get expiration;
  String? get reason;
  bool get shadow;
  String? get team;
  String get type;
  User? get user;

  /// Create a copy of UserBannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBannedEventCopyWith<UserBannedEvent> get copyWith =>
      _$UserBannedEventCopyWithImpl<UserBannedEvent>(
          this as UserBannedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBannedEvent &&
            super == other &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelType, channelType) ||
                other.channelType == channelType) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.expiration, expiration) ||
                other.expiration == expiration) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      channelId,
      channelType,
      cid,
      createdAt,
      createdBy,
      expiration,
      reason,
      shadow,
      team,
      type,
      user);

  @override
  String toString() {
    return 'UserBannedEvent(channelId: $channelId, channelType: $channelType, cid: $cid, createdAt: $createdAt, createdBy: $createdBy, expiration: $expiration, reason: $reason, shadow: $shadow, team: $team, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserBannedEventCopyWith<$Res> {
  factory $UserBannedEventCopyWith(
          UserBannedEvent value, $Res Function(UserBannedEvent) _then) =
      _$UserBannedEventCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      String channelType,
      String cid,
      DateTime createdAt,
      User createdBy,
      DateTime? expiration,
      String? reason,
      bool shadow,
      String? team,
      String type,
      User? user});
}

/// @nodoc
class _$UserBannedEventCopyWithImpl<$Res>
    implements $UserBannedEventCopyWith<$Res> {
  _$UserBannedEventCopyWithImpl(this._self, this._then);

  final UserBannedEvent _self;
  final $Res Function(UserBannedEvent) _then;

  /// Create a copy of UserBannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelType = null,
    Object? cid = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? expiration = freezed,
    Object? reason = freezed,
    Object? shadow = null,
    Object? team = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(UserBannedEvent(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelType: null == channelType
          ? _self.channelType
          : channelType // ignore: cast_nullable_to_non_nullable
              as String,
      cid: null == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
      expiration: freezed == expiration
          ? _self.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      shadow: null == shadow
          ? _self.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as bool,
      team: freezed == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
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
