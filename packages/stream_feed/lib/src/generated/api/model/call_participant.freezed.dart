// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallParticipant {
  int? get avgResponseTime;
  DateTime? get banExpires;
  bool get banned;
  DateTime? get createdAt;
  Map<String, Object?> get custom;
  DateTime? get deactivatedAt;
  DateTime? get deletedAt;
  String get id;
  bool? get invisible;
  DateTime get joinedAt;
  String? get language;
  DateTime? get lastActive;
  DateTime? get lastEngagedAt;
  bool get online;
  PrivacySettings? get privacySettings;
  DateTime? get revokeTokensIssuedBefore;
  String get role;
  List<String>? get teams;
  Map<String, String> get teamsRole;
  DateTime? get updatedAt;
  String get userSessionID;

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallParticipantCopyWith<CallParticipant> get copyWith =>
      _$CallParticipantCopyWithImpl<CallParticipant>(
          this as CallParticipant, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallParticipant &&
            (identical(other.avgResponseTime, avgResponseTime) ||
                other.avgResponseTime == avgResponseTime) &&
            (identical(other.banExpires, banExpires) ||
                other.banExpires == banExpires) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deactivatedAt, deactivatedAt) ||
                other.deactivatedAt == deactivatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invisible, invisible) ||
                other.invisible == invisible) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.lastEngagedAt, lastEngagedAt) ||
                other.lastEngagedAt == lastEngagedAt) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.privacySettings, privacySettings) ||
                other.privacySettings == privacySettings) &&
            (identical(
                    other.revokeTokensIssuedBefore, revokeTokensIssuedBefore) ||
                other.revokeTokensIssuedBefore == revokeTokensIssuedBefore) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.teams, teams) &&
            const DeepCollectionEquality().equals(other.teamsRole, teamsRole) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userSessionID, userSessionID) ||
                other.userSessionID == userSessionID));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        avgResponseTime,
        banExpires,
        banned,
        createdAt,
        const DeepCollectionEquality().hash(custom),
        deactivatedAt,
        deletedAt,
        id,
        invisible,
        joinedAt,
        language,
        lastActive,
        lastEngagedAt,
        online,
        privacySettings,
        revokeTokensIssuedBefore,
        role,
        const DeepCollectionEquality().hash(teams),
        const DeepCollectionEquality().hash(teamsRole),
        updatedAt,
        userSessionID
      ]);

  @override
  String toString() {
    return 'CallParticipant(avgResponseTime: $avgResponseTime, banExpires: $banExpires, banned: $banned, createdAt: $createdAt, custom: $custom, deactivatedAt: $deactivatedAt, deletedAt: $deletedAt, id: $id, invisible: $invisible, joinedAt: $joinedAt, language: $language, lastActive: $lastActive, lastEngagedAt: $lastEngagedAt, online: $online, privacySettings: $privacySettings, revokeTokensIssuedBefore: $revokeTokensIssuedBefore, role: $role, teams: $teams, teamsRole: $teamsRole, updatedAt: $updatedAt, userSessionID: $userSessionID)';
  }
}

/// @nodoc
abstract mixin class $CallParticipantCopyWith<$Res> {
  factory $CallParticipantCopyWith(
          CallParticipant value, $Res Function(CallParticipant) _then) =
      _$CallParticipantCopyWithImpl;
  @useResult
  $Res call(
      {int? avgResponseTime,
      DateTime? banExpires,
      bool banned,
      DateTime? createdAt,
      Map<String, Object?> custom,
      DateTime? deactivatedAt,
      DateTime? deletedAt,
      String id,
      bool? invisible,
      DateTime joinedAt,
      String? language,
      DateTime? lastActive,
      DateTime? lastEngagedAt,
      bool online,
      PrivacySettings? privacySettings,
      DateTime? revokeTokensIssuedBefore,
      String role,
      List<String>? teams,
      Map<String, String> teamsRole,
      DateTime? updatedAt,
      String userSessionID});
}

/// @nodoc
class _$CallParticipantCopyWithImpl<$Res>
    implements $CallParticipantCopyWith<$Res> {
  _$CallParticipantCopyWithImpl(this._self, this._then);

  final CallParticipant _self;
  final $Res Function(CallParticipant) _then;

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgResponseTime = freezed,
    Object? banExpires = freezed,
    Object? banned = null,
    Object? createdAt = freezed,
    Object? custom = null,
    Object? deactivatedAt = freezed,
    Object? deletedAt = freezed,
    Object? id = null,
    Object? invisible = freezed,
    Object? joinedAt = null,
    Object? language = freezed,
    Object? lastActive = freezed,
    Object? lastEngagedAt = freezed,
    Object? online = null,
    Object? privacySettings = freezed,
    Object? revokeTokensIssuedBefore = freezed,
    Object? role = null,
    Object? teams = freezed,
    Object? teamsRole = null,
    Object? updatedAt = freezed,
    Object? userSessionID = null,
  }) {
    return _then(CallParticipant(
      avgResponseTime: freezed == avgResponseTime
          ? _self.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as int?,
      banExpires: freezed == banExpires
          ? _self.banExpires
          : banExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      banned: null == banned
          ? _self.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      deactivatedAt: freezed == deactivatedAt
          ? _self.deactivatedAt
          : deactivatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      invisible: freezed == invisible
          ? _self.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActive: freezed == lastActive
          ? _self.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastEngagedAt: freezed == lastEngagedAt
          ? _self.lastEngagedAt
          : lastEngagedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      online: null == online
          ? _self.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      privacySettings: freezed == privacySettings
          ? _self.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettings?,
      revokeTokensIssuedBefore: freezed == revokeTokensIssuedBefore
          ? _self.revokeTokensIssuedBefore
          : revokeTokensIssuedBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      teams: freezed == teams
          ? _self.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      teamsRole: null == teamsRole
          ? _self.teamsRole
          : teamsRole // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userSessionID: null == userSessionID
          ? _self.userSessionID
          : userSessionID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
