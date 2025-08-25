// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Flag {
  DateTime get createdAt;
  Map<String, Object?>? get custom;
  String? get entityCreatorId;
  String get entityId;
  String get entityType;
  bool? get isStreamedContent;
  List<String>? get labels;
  ModerationPayload? get moderationPayload;
  String? get moderationPayloadHash;
  String? get reason;
  List<Map<String, Object?>> get result;
  ReviewQueueItem? get reviewQueueItem;
  String? get reviewQueueItemId;
  String? get type;
  DateTime get updatedAt;
  User? get user;

  /// Create a copy of Flag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlagCopyWith<Flag> get copyWith =>
      _$FlagCopyWithImpl<Flag>(this as Flag, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Flag &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.entityCreatorId, entityCreatorId) ||
                other.entityCreatorId == entityCreatorId) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.isStreamedContent, isStreamedContent) ||
                other.isStreamedContent == isStreamedContent) &&
            const DeepCollectionEquality().equals(other.labels, labels) &&
            (identical(other.moderationPayload, moderationPayload) ||
                other.moderationPayload == moderationPayload) &&
            (identical(other.moderationPayloadHash, moderationPayloadHash) ||
                other.moderationPayloadHash == moderationPayloadHash) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.reviewQueueItem, reviewQueueItem) ||
                other.reviewQueueItem == reviewQueueItem) &&
            (identical(other.reviewQueueItemId, reviewQueueItemId) ||
                other.reviewQueueItemId == reviewQueueItemId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      entityCreatorId,
      entityId,
      entityType,
      isStreamedContent,
      const DeepCollectionEquality().hash(labels),
      moderationPayload,
      moderationPayloadHash,
      reason,
      const DeepCollectionEquality().hash(result),
      reviewQueueItem,
      reviewQueueItemId,
      type,
      updatedAt,
      user);

  @override
  String toString() {
    return 'Flag(createdAt: $createdAt, custom: $custom, entityCreatorId: $entityCreatorId, entityId: $entityId, entityType: $entityType, isStreamedContent: $isStreamedContent, labels: $labels, moderationPayload: $moderationPayload, moderationPayloadHash: $moderationPayloadHash, reason: $reason, result: $result, reviewQueueItem: $reviewQueueItem, reviewQueueItemId: $reviewQueueItemId, type: $type, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FlagCopyWith<$Res> {
  factory $FlagCopyWith(Flag value, $Res Function(Flag) _then) =
      _$FlagCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?>? custom,
      String? entityCreatorId,
      String entityId,
      String entityType,
      bool? isStreamedContent,
      List<String>? labels,
      ModerationPayload? moderationPayload,
      String? moderationPayloadHash,
      String? reason,
      List<Map<String, Object?>> result,
      ReviewQueueItem? reviewQueueItem,
      String? reviewQueueItemId,
      String? type,
      DateTime updatedAt,
      User? user});
}

/// @nodoc
class _$FlagCopyWithImpl<$Res> implements $FlagCopyWith<$Res> {
  _$FlagCopyWithImpl(this._self, this._then);

  final Flag _self;
  final $Res Function(Flag) _then;

  /// Create a copy of Flag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = freezed,
    Object? entityCreatorId = freezed,
    Object? entityId = null,
    Object? entityType = null,
    Object? isStreamedContent = freezed,
    Object? labels = freezed,
    Object? moderationPayload = freezed,
    Object? moderationPayloadHash = freezed,
    Object? reason = freezed,
    Object? result = null,
    Object? reviewQueueItem = freezed,
    Object? reviewQueueItemId = freezed,
    Object? type = freezed,
    Object? updatedAt = null,
    Object? user = freezed,
  }) {
    return _then(Flag(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      entityCreatorId: freezed == entityCreatorId
          ? _self.entityCreatorId
          : entityCreatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: null == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      isStreamedContent: freezed == isStreamedContent
          ? _self.isStreamedContent
          : isStreamedContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      labels: freezed == labels
          ? _self.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      moderationPayload: freezed == moderationPayload
          ? _self.moderationPayload
          : moderationPayload // ignore: cast_nullable_to_non_nullable
              as ModerationPayload?,
      moderationPayloadHash: freezed == moderationPayloadHash
          ? _self.moderationPayloadHash
          : moderationPayloadHash // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
      reviewQueueItem: freezed == reviewQueueItem
          ? _self.reviewQueueItem
          : reviewQueueItem // ignore: cast_nullable_to_non_nullable
              as ReviewQueueItem?,
      reviewQueueItemId: freezed == reviewQueueItemId
          ? _self.reviewQueueItemId
          : reviewQueueItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

// dart format on
