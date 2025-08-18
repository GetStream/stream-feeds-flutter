// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActionLog {
  DateTime get createdAt;
  Map<String, Object> get custom;
  String get id;
  String get reason;
  String get reporterType;
  ReviewQueueItem? get reviewQueueItem;
  String get reviewQueueItemId;
  User? get targetUser;
  String get targetUserId;
  String get type;
  User? get user;

  /// Create a copy of ActionLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActionLogCopyWith<ActionLog> get copyWith =>
      _$ActionLogCopyWithImpl<ActionLog>(this as ActionLog, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionLog &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.reporterType, reporterType) ||
                other.reporterType == reporterType) &&
            (identical(other.reviewQueueItem, reviewQueueItem) ||
                other.reviewQueueItem == reviewQueueItem) &&
            (identical(other.reviewQueueItemId, reviewQueueItemId) ||
                other.reviewQueueItemId == reviewQueueItemId) &&
            (identical(other.targetUser, targetUser) ||
                other.targetUser == targetUser) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      id,
      reason,
      reporterType,
      reviewQueueItem,
      reviewQueueItemId,
      targetUser,
      targetUserId,
      type,
      user);

  @override
  String toString() {
    return 'ActionLog(createdAt: $createdAt, custom: $custom, id: $id, reason: $reason, reporterType: $reporterType, reviewQueueItem: $reviewQueueItem, reviewQueueItemId: $reviewQueueItemId, targetUser: $targetUser, targetUserId: $targetUserId, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActionLogCopyWith<$Res> {
  factory $ActionLogCopyWith(ActionLog value, $Res Function(ActionLog) _then) =
      _$ActionLogCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object> custom,
      String id,
      String reason,
      String reporterType,
      ReviewQueueItem? reviewQueueItem,
      String reviewQueueItemId,
      User? targetUser,
      String targetUserId,
      String type,
      User? user});
}

/// @nodoc
class _$ActionLogCopyWithImpl<$Res> implements $ActionLogCopyWith<$Res> {
  _$ActionLogCopyWithImpl(this._self, this._then);

  final ActionLog _self;
  final $Res Function(ActionLog) _then;

  /// Create a copy of ActionLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? id = null,
    Object? reason = null,
    Object? reporterType = null,
    Object? reviewQueueItem = freezed,
    Object? reviewQueueItemId = null,
    Object? targetUser = freezed,
    Object? targetUserId = null,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(ActionLog(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      reporterType: null == reporterType
          ? _self.reporterType
          : reporterType // ignore: cast_nullable_to_non_nullable
              as String,
      reviewQueueItem: freezed == reviewQueueItem
          ? _self.reviewQueueItem
          : reviewQueueItem // ignore: cast_nullable_to_non_nullable
              as ReviewQueueItem?,
      reviewQueueItemId: null == reviewQueueItemId
          ? _self.reviewQueueItemId
          : reviewQueueItemId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUser: freezed == targetUser
          ? _self.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as User?,
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
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
