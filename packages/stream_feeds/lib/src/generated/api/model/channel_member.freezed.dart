// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelMember {
  DateTime? get archivedAt;
  DateTime? get banExpires;
  bool get banned;
  String get channelRole;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get deletedAt;
  List<String>? get deletedMessages;
  DateTime? get inviteAcceptedAt;
  DateTime? get inviteRejectedAt;
  bool? get invited;
  bool? get isModerator;
  bool get notificationsMuted;
  DateTime? get pinnedAt;
  ChannelMemberRole? get role;
  bool get shadowBanned;
  String? get status;
  DateTime get updatedAt;
  UserResponse? get user;
  String? get userId;

  /// Create a copy of ChannelMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelMemberCopyWith<ChannelMember> get copyWith =>
      _$ChannelMemberCopyWithImpl<ChannelMember>(
          this as ChannelMember, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelMember &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.banExpires, banExpires) ||
                other.banExpires == banExpires) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.channelRole, channelRole) ||
                other.channelRole == channelRole) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            const DeepCollectionEquality()
                .equals(other.deletedMessages, deletedMessages) &&
            (identical(other.inviteAcceptedAt, inviteAcceptedAt) ||
                other.inviteAcceptedAt == inviteAcceptedAt) &&
            (identical(other.inviteRejectedAt, inviteRejectedAt) ||
                other.inviteRejectedAt == inviteRejectedAt) &&
            (identical(other.invited, invited) || other.invited == invited) &&
            (identical(other.isModerator, isModerator) ||
                other.isModerator == isModerator) &&
            (identical(other.notificationsMuted, notificationsMuted) ||
                other.notificationsMuted == notificationsMuted) &&
            (identical(other.pinnedAt, pinnedAt) ||
                other.pinnedAt == pinnedAt) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.shadowBanned, shadowBanned) ||
                other.shadowBanned == shadowBanned) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        archivedAt,
        banExpires,
        banned,
        channelRole,
        createdAt,
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        const DeepCollectionEquality().hash(deletedMessages),
        inviteAcceptedAt,
        inviteRejectedAt,
        invited,
        isModerator,
        notificationsMuted,
        pinnedAt,
        role,
        shadowBanned,
        status,
        updatedAt,
        user,
        userId
      ]);

  @override
  String toString() {
    return 'ChannelMember(archivedAt: $archivedAt, banExpires: $banExpires, banned: $banned, channelRole: $channelRole, createdAt: $createdAt, custom: $custom, deletedAt: $deletedAt, deletedMessages: $deletedMessages, inviteAcceptedAt: $inviteAcceptedAt, inviteRejectedAt: $inviteRejectedAt, invited: $invited, isModerator: $isModerator, notificationsMuted: $notificationsMuted, pinnedAt: $pinnedAt, role: $role, shadowBanned: $shadowBanned, status: $status, updatedAt: $updatedAt, user: $user, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ChannelMemberCopyWith<$Res> {
  factory $ChannelMemberCopyWith(
          ChannelMember value, $Res Function(ChannelMember) _then) =
      _$ChannelMemberCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? archivedAt,
      DateTime? banExpires,
      bool banned,
      String channelRole,
      DateTime createdAt,
      Map<String, Object?> custom,
      DateTime? deletedAt,
      List<String>? deletedMessages,
      DateTime? inviteAcceptedAt,
      DateTime? inviteRejectedAt,
      bool? invited,
      bool? isModerator,
      bool notificationsMuted,
      DateTime? pinnedAt,
      ChannelMemberRole? role,
      bool shadowBanned,
      String? status,
      DateTime updatedAt,
      UserResponse? user,
      String? userId});
}

/// @nodoc
class _$ChannelMemberCopyWithImpl<$Res>
    implements $ChannelMemberCopyWith<$Res> {
  _$ChannelMemberCopyWithImpl(this._self, this._then);

  final ChannelMember _self;
  final $Res Function(ChannelMember) _then;

  /// Create a copy of ChannelMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? archivedAt = freezed,
    Object? banExpires = freezed,
    Object? banned = null,
    Object? channelRole = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? deletedMessages = freezed,
    Object? inviteAcceptedAt = freezed,
    Object? inviteRejectedAt = freezed,
    Object? invited = freezed,
    Object? isModerator = freezed,
    Object? notificationsMuted = null,
    Object? pinnedAt = freezed,
    Object? role = freezed,
    Object? shadowBanned = null,
    Object? status = freezed,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? userId = freezed,
  }) {
    return _then(ChannelMember(
      archivedAt: freezed == archivedAt
          ? _self.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banExpires: freezed == banExpires
          ? _self.banExpires
          : banExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banned: null == banned
          ? _self.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      channelRole: null == channelRole
          ? _self.channelRole
          : channelRole // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedMessages: freezed == deletedMessages
          ? _self.deletedMessages
          : deletedMessages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inviteAcceptedAt: freezed == inviteAcceptedAt
          ? _self.inviteAcceptedAt
          : inviteAcceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inviteRejectedAt: freezed == inviteRejectedAt
          ? _self.inviteRejectedAt
          : inviteRejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invited: freezed == invited
          ? _self.invited
          : invited // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: freezed == isModerator
          ? _self.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationsMuted: null == notificationsMuted
          ? _self.notificationsMuted
          : notificationsMuted // ignore: cast_nullable_to_non_nullable
              as bool,
      pinnedAt: freezed == pinnedAt
          ? _self.pinnedAt
          : pinnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChannelMemberRole?,
      shadowBanned: null == shadowBanned
          ? _self.shadowBanned
          : shadowBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
