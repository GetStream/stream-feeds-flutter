// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Call {
  int get appPK;
  bool get backstage;
  List<String> get blockedUserIDs;
  List<User> get blockedUsers;
  String get cID;
  CallType? get callType;
  String get channelCID;
  DateTime get createdAt;
  User? get createdBy;
  String get createdByUserID;
  String get currentSessionID;
  Map<String, Object> get custom;
  DateTime? get deletedAt;
  DateTime? get egressUpdatedAt;
  List<CallEgress> get egresses;
  DateTime? get endedAt;
  String get iD;
  int? get joinAheadTimeSeconds;
  DateTime? get lastHeartbeatAt;
  String get lastSessionID;
  int? get memberCount;
  MemberLookup? get memberLookup;
  List<CallMember> get members;
  CallSession? get session;
  CallSettings? get settings;
  CallSettings? get settingsOverrides;
  DateTime? get startsAt;
  String get team;
  String get thumbnailURL;
  String get type;
  DateTime get updatedAt;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallCopyWith<Call> get copyWith =>
      _$CallCopyWithImpl<Call>(this as Call, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Call &&
            (identical(other.appPK, appPK) || other.appPK == appPK) &&
            (identical(other.backstage, backstage) ||
                other.backstage == backstage) &&
            const DeepCollectionEquality()
                .equals(other.blockedUserIDs, blockedUserIDs) &&
            const DeepCollectionEquality()
                .equals(other.blockedUsers, blockedUsers) &&
            (identical(other.cID, cID) || other.cID == cID) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(other.channelCID, channelCID) ||
                other.channelCID == channelCID) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByUserID, createdByUserID) ||
                other.createdByUserID == createdByUserID) &&
            (identical(other.currentSessionID, currentSessionID) ||
                other.currentSessionID == currentSessionID) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.egressUpdatedAt, egressUpdatedAt) ||
                other.egressUpdatedAt == egressUpdatedAt) &&
            const DeepCollectionEquality().equals(other.egresses, egresses) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.iD, iD) || other.iD == iD) &&
            (identical(other.joinAheadTimeSeconds, joinAheadTimeSeconds) ||
                other.joinAheadTimeSeconds == joinAheadTimeSeconds) &&
            (identical(other.lastHeartbeatAt, lastHeartbeatAt) ||
                other.lastHeartbeatAt == lastHeartbeatAt) &&
            (identical(other.lastSessionID, lastSessionID) ||
                other.lastSessionID == lastSessionID) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.memberLookup, memberLookup) ||
                other.memberLookup == memberLookup) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.settingsOverrides, settingsOverrides) ||
                other.settingsOverrides == settingsOverrides) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.thumbnailURL, thumbnailURL) ||
                other.thumbnailURL == thumbnailURL) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appPK,
        backstage,
        const DeepCollectionEquality().hash(blockedUserIDs),
        const DeepCollectionEquality().hash(blockedUsers),
        cID,
        callType,
        channelCID,
        createdAt,
        createdBy,
        createdByUserID,
        currentSessionID,
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        egressUpdatedAt,
        const DeepCollectionEquality().hash(egresses),
        endedAt,
        iD,
        joinAheadTimeSeconds,
        lastHeartbeatAt,
        lastSessionID,
        memberCount,
        memberLookup,
        const DeepCollectionEquality().hash(members),
        session,
        settings,
        settingsOverrides,
        startsAt,
        team,
        thumbnailURL,
        type,
        updatedAt
      ]);

  @override
  String toString() {
    return 'Call(appPK: $appPK, backstage: $backstage, blockedUserIDs: $blockedUserIDs, blockedUsers: $blockedUsers, cID: $cID, callType: $callType, channelCID: $channelCID, createdAt: $createdAt, createdBy: $createdBy, createdByUserID: $createdByUserID, currentSessionID: $currentSessionID, custom: $custom, deletedAt: $deletedAt, egressUpdatedAt: $egressUpdatedAt, egresses: $egresses, endedAt: $endedAt, iD: $iD, joinAheadTimeSeconds: $joinAheadTimeSeconds, lastHeartbeatAt: $lastHeartbeatAt, lastSessionID: $lastSessionID, memberCount: $memberCount, memberLookup: $memberLookup, members: $members, session: $session, settings: $settings, settingsOverrides: $settingsOverrides, startsAt: $startsAt, team: $team, thumbnailURL: $thumbnailURL, type: $type, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CallCopyWith<$Res> {
  factory $CallCopyWith(Call value, $Res Function(Call) _then) =
      _$CallCopyWithImpl;
  @useResult
  $Res call(
      {int appPK,
      bool backstage,
      List<String> blockedUserIDs,
      List<User> blockedUsers,
      String cID,
      CallType? callType,
      String channelCID,
      DateTime createdAt,
      User? createdBy,
      String createdByUserID,
      String currentSessionID,
      Map<String, Object> custom,
      DateTime? deletedAt,
      DateTime? egressUpdatedAt,
      List<CallEgress> egresses,
      DateTime? endedAt,
      String iD,
      int? joinAheadTimeSeconds,
      DateTime? lastHeartbeatAt,
      String lastSessionID,
      int? memberCount,
      MemberLookup? memberLookup,
      List<CallMember> members,
      CallSession? session,
      CallSettings? settings,
      CallSettings? settingsOverrides,
      DateTime? startsAt,
      String team,
      String thumbnailURL,
      String type,
      DateTime updatedAt});
}

/// @nodoc
class _$CallCopyWithImpl<$Res> implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._self, this._then);

  final Call _self;
  final $Res Function(Call) _then;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPK = null,
    Object? backstage = null,
    Object? blockedUserIDs = null,
    Object? blockedUsers = null,
    Object? cID = null,
    Object? callType = freezed,
    Object? channelCID = null,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? createdByUserID = null,
    Object? currentSessionID = null,
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? egressUpdatedAt = freezed,
    Object? egresses = null,
    Object? endedAt = freezed,
    Object? iD = null,
    Object? joinAheadTimeSeconds = freezed,
    Object? lastHeartbeatAt = freezed,
    Object? lastSessionID = null,
    Object? memberCount = freezed,
    Object? memberLookup = freezed,
    Object? members = null,
    Object? session = freezed,
    Object? settings = freezed,
    Object? settingsOverrides = freezed,
    Object? startsAt = freezed,
    Object? team = null,
    Object? thumbnailURL = null,
    Object? type = null,
    Object? updatedAt = null,
  }) {
    return _then(Call(
      appPK: null == appPK
          ? _self.appPK
          : appPK // ignore: cast_nullable_to_non_nullable
              as int,
      backstage: null == backstage
          ? _self.backstage
          : backstage // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUserIDs: null == blockedUserIDs
          ? _self.blockedUserIDs
          : blockedUserIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedUsers: null == blockedUsers
          ? _self.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      cID: null == cID
          ? _self.cID
          : cID // ignore: cast_nullable_to_non_nullable
              as String,
      callType: freezed == callType
          ? _self.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as CallType?,
      channelCID: null == channelCID
          ? _self.channelCID
          : channelCID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      createdByUserID: null == createdByUserID
          ? _self.createdByUserID
          : createdByUserID // ignore: cast_nullable_to_non_nullable
              as String,
      currentSessionID: null == currentSessionID
          ? _self.currentSessionID
          : currentSessionID // ignore: cast_nullable_to_non_nullable
              as String,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      egressUpdatedAt: freezed == egressUpdatedAt
          ? _self.egressUpdatedAt
          : egressUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      egresses: null == egresses
          ? _self.egresses
          : egresses // ignore: cast_nullable_to_non_nullable
              as List<CallEgress>,
      endedAt: freezed == endedAt
          ? _self.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iD: null == iD
          ? _self.iD
          : iD // ignore: cast_nullable_to_non_nullable
              as String,
      joinAheadTimeSeconds: freezed == joinAheadTimeSeconds
          ? _self.joinAheadTimeSeconds
          : joinAheadTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      lastHeartbeatAt: freezed == lastHeartbeatAt
          ? _self.lastHeartbeatAt
          : lastHeartbeatAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSessionID: null == lastSessionID
          ? _self.lastSessionID
          : lastSessionID // ignore: cast_nullable_to_non_nullable
              as String,
      memberCount: freezed == memberCount
          ? _self.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      memberLookup: freezed == memberLookup
          ? _self.memberLookup
          : memberLookup // ignore: cast_nullable_to_non_nullable
              as MemberLookup?,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<CallMember>,
      session: freezed == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as CallSession?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CallSettings?,
      settingsOverrides: freezed == settingsOverrides
          ? _self.settingsOverrides
          : settingsOverrides // ignore: cast_nullable_to_non_nullable
              as CallSettings?,
      startsAt: freezed == startsAt
          ? _self.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      team: null == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailURL: null == thumbnailURL
          ? _self.thumbnailURL
          : thumbnailURL // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
