// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallSession {
  Map<String, DateTime> get acceptedBy;
  List<SFUIDLastSeen> get activeSFUs;
  int get anonymousParticipantCount;
  int get appPK;
  String get callID;
  String get callType;
  DateTime get createdAt;
  DateTime? get deletedAt;
  DateTime? get endedAt;
  DateTime? get liveEndedAt;
  DateTime? get liveStartedAt;
  Map<String, DateTime> get missedBy;
  List<CallParticipant> get participants;
  Map<String, int> get participantsCountByRole;
  Map<String, DateTime> get rejectedBy;
  DateTime? get ringAt;
  List<String> get sFUIDs;
  String get sessionID;
  DateTime? get startedAt;
  DateTime? get timerEndsAt;
  Map<String, Map<String, bool>> get userPermissionOverrides;

  /// Create a copy of CallSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallSessionCopyWith<CallSession> get copyWith =>
      _$CallSessionCopyWithImpl<CallSession>(this as CallSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallSession &&
            const DeepCollectionEquality()
                .equals(other.acceptedBy, acceptedBy) &&
            const DeepCollectionEquality()
                .equals(other.activeSFUs, activeSFUs) &&
            (identical(other.anonymousParticipantCount,
                    anonymousParticipantCount) ||
                other.anonymousParticipantCount == anonymousParticipantCount) &&
            (identical(other.appPK, appPK) || other.appPK == appPK) &&
            (identical(other.callID, callID) || other.callID == callID) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.liveEndedAt, liveEndedAt) ||
                other.liveEndedAt == liveEndedAt) &&
            (identical(other.liveStartedAt, liveStartedAt) ||
                other.liveStartedAt == liveStartedAt) &&
            const DeepCollectionEquality().equals(other.missedBy, missedBy) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(
                other.participantsCountByRole, participantsCountByRole) &&
            const DeepCollectionEquality()
                .equals(other.rejectedBy, rejectedBy) &&
            (identical(other.ringAt, ringAt) || other.ringAt == ringAt) &&
            const DeepCollectionEquality().equals(other.sFUIDs, sFUIDs) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.timerEndsAt, timerEndsAt) ||
                other.timerEndsAt == timerEndsAt) &&
            const DeepCollectionEquality().equals(
                other.userPermissionOverrides, userPermissionOverrides));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(acceptedBy),
        const DeepCollectionEquality().hash(activeSFUs),
        anonymousParticipantCount,
        appPK,
        callID,
        callType,
        createdAt,
        deletedAt,
        endedAt,
        liveEndedAt,
        liveStartedAt,
        const DeepCollectionEquality().hash(missedBy),
        const DeepCollectionEquality().hash(participants),
        const DeepCollectionEquality().hash(participantsCountByRole),
        const DeepCollectionEquality().hash(rejectedBy),
        ringAt,
        const DeepCollectionEquality().hash(sFUIDs),
        sessionID,
        startedAt,
        timerEndsAt,
        const DeepCollectionEquality().hash(userPermissionOverrides)
      ]);

  @override
  String toString() {
    return 'CallSession(acceptedBy: $acceptedBy, activeSFUs: $activeSFUs, anonymousParticipantCount: $anonymousParticipantCount, appPK: $appPK, callID: $callID, callType: $callType, createdAt: $createdAt, deletedAt: $deletedAt, endedAt: $endedAt, liveEndedAt: $liveEndedAt, liveStartedAt: $liveStartedAt, missedBy: $missedBy, participants: $participants, participantsCountByRole: $participantsCountByRole, rejectedBy: $rejectedBy, ringAt: $ringAt, sFUIDs: $sFUIDs, sessionID: $sessionID, startedAt: $startedAt, timerEndsAt: $timerEndsAt, userPermissionOverrides: $userPermissionOverrides)';
  }
}

/// @nodoc
abstract mixin class $CallSessionCopyWith<$Res> {
  factory $CallSessionCopyWith(
          CallSession value, $Res Function(CallSession) _then) =
      _$CallSessionCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, DateTime> acceptedBy,
      List<SFUIDLastSeen> activeSFUs,
      int anonymousParticipantCount,
      int appPK,
      String callID,
      String callType,
      DateTime createdAt,
      DateTime? deletedAt,
      DateTime? endedAt,
      DateTime? liveEndedAt,
      DateTime? liveStartedAt,
      Map<String, DateTime> missedBy,
      List<CallParticipant> participants,
      Map<String, int> participantsCountByRole,
      Map<String, DateTime> rejectedBy,
      DateTime? ringAt,
      List<String> sFUIDs,
      String sessionID,
      DateTime? startedAt,
      DateTime? timerEndsAt,
      Map<String, Map<String, bool>> userPermissionOverrides});
}

/// @nodoc
class _$CallSessionCopyWithImpl<$Res> implements $CallSessionCopyWith<$Res> {
  _$CallSessionCopyWithImpl(this._self, this._then);

  final CallSession _self;
  final $Res Function(CallSession) _then;

  /// Create a copy of CallSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptedBy = null,
    Object? activeSFUs = null,
    Object? anonymousParticipantCount = null,
    Object? appPK = null,
    Object? callID = null,
    Object? callType = null,
    Object? createdAt = null,
    Object? deletedAt = freezed,
    Object? endedAt = freezed,
    Object? liveEndedAt = freezed,
    Object? liveStartedAt = freezed,
    Object? missedBy = null,
    Object? participants = null,
    Object? participantsCountByRole = null,
    Object? rejectedBy = null,
    Object? ringAt = freezed,
    Object? sFUIDs = null,
    Object? sessionID = null,
    Object? startedAt = freezed,
    Object? timerEndsAt = freezed,
    Object? userPermissionOverrides = null,
  }) {
    return _then(CallSession(
      acceptedBy: null == acceptedBy
          ? _self.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
      activeSFUs: null == activeSFUs
          ? _self.activeSFUs
          : activeSFUs // ignore: cast_nullable_to_non_nullable
              as List<SFUIDLastSeen>,
      anonymousParticipantCount: null == anonymousParticipantCount
          ? _self.anonymousParticipantCount
          : anonymousParticipantCount // ignore: cast_nullable_to_non_nullable
              as int,
      appPK: null == appPK
          ? _self.appPK
          : appPK // ignore: cast_nullable_to_non_nullable
              as int,
      callID: null == callID
          ? _self.callID
          : callID // ignore: cast_nullable_to_non_nullable
              as String,
      callType: null == callType
          ? _self.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedAt: freezed == endedAt
          ? _self.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      liveEndedAt: freezed == liveEndedAt
          ? _self.liveEndedAt
          : liveEndedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      liveStartedAt: freezed == liveStartedAt
          ? _self.liveStartedAt
          : liveStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      missedBy: null == missedBy
          ? _self.missedBy
          : missedBy // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
      participants: null == participants
          ? _self.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<CallParticipant>,
      participantsCountByRole: null == participantsCountByRole
          ? _self.participantsCountByRole
          : participantsCountByRole // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      rejectedBy: null == rejectedBy
          ? _self.rejectedBy
          : rejectedBy // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
      ringAt: freezed == ringAt
          ? _self.ringAt
          : ringAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sFUIDs: null == sFUIDs
          ? _self.sFUIDs
          : sFUIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sessionID: null == sessionID
          ? _self.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timerEndsAt: freezed == timerEndsAt
          ? _self.timerEndsAt
          : timerEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userPermissionOverrides: null == userPermissionOverrides
          ? _self.userPermissionOverrides
          : userPermissionOverrides // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, bool>>,
    ));
  }
}

// dart format on
