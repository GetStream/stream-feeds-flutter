// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_queue_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewQueueItem {
  List<ActionLog> get actions;
  EnrichedActivity? get activity;
  String get aiTextSeverity;
  User? get assignedTo;
  List<Ban> get bans;
  int get bounceCount;
  Call? get call;
  String get configKey;
  bool get contentChanged;
  DateTime get createdAt;
  EntityCreator? get entityCreator;
  String get entityId;
  String get entityType;
  EnrichedActivity? get feedsV2Activity;
  Reaction? get feedsV2Reaction;
  List<String> get flagLabels;
  List<String> get flagTypes;
  List<Flag> get flags;
  int get flagsCount;
  bool get hasImage;
  bool get hasText;
  bool get hasVideo;
  String get id;
  List<String> get languages;
  Message? get message;
  ModerationPayload? get moderationPayload;
  String get moderationPayloadHash;
  Reaction? get reaction;
  String get recommendedAction;
  List<String> get reporterIds;
  String get reviewedBy;
  int get severity;
  String get status;
  List<String> get teams;
  DateTime get updatedAt;

  /// Create a copy of ReviewQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewQueueItemCopyWith<ReviewQueueItem> get copyWith =>
      _$ReviewQueueItemCopyWithImpl<ReviewQueueItem>(
          this as ReviewQueueItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewQueueItem &&
            const DeepCollectionEquality().equals(other.actions, actions) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.aiTextSeverity, aiTextSeverity) ||
                other.aiTextSeverity == aiTextSeverity) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality().equals(other.bans, bans) &&
            (identical(other.bounceCount, bounceCount) ||
                other.bounceCount == bounceCount) &&
            (identical(other.call, call) || other.call == call) &&
            (identical(other.configKey, configKey) ||
                other.configKey == configKey) &&
            (identical(other.contentChanged, contentChanged) ||
                other.contentChanged == contentChanged) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.entityCreator, entityCreator) ||
                other.entityCreator == entityCreator) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.feedsV2Activity, feedsV2Activity) ||
                other.feedsV2Activity == feedsV2Activity) &&
            (identical(other.feedsV2Reaction, feedsV2Reaction) ||
                other.feedsV2Reaction == feedsV2Reaction) &&
            const DeepCollectionEquality()
                .equals(other.flagLabels, flagLabels) &&
            const DeepCollectionEquality().equals(other.flagTypes, flagTypes) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            (identical(other.flagsCount, flagsCount) ||
                other.flagsCount == flagsCount) &&
            (identical(other.hasImage, hasImage) ||
                other.hasImage == hasImage) &&
            (identical(other.hasText, hasText) || other.hasText == hasText) &&
            (identical(other.hasVideo, hasVideo) ||
                other.hasVideo == hasVideo) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.moderationPayload, moderationPayload) ||
                other.moderationPayload == moderationPayload) &&
            (identical(other.moderationPayloadHash, moderationPayloadHash) ||
                other.moderationPayloadHash == moderationPayloadHash) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction) &&
            (identical(other.recommendedAction, recommendedAction) ||
                other.recommendedAction == recommendedAction) &&
            const DeepCollectionEquality()
                .equals(other.reporterIds, reporterIds) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.teams, teams) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(actions),
        activity,
        aiTextSeverity,
        assignedTo,
        const DeepCollectionEquality().hash(bans),
        bounceCount,
        call,
        configKey,
        contentChanged,
        createdAt,
        entityCreator,
        entityId,
        entityType,
        feedsV2Activity,
        feedsV2Reaction,
        const DeepCollectionEquality().hash(flagLabels),
        const DeepCollectionEquality().hash(flagTypes),
        const DeepCollectionEquality().hash(flags),
        flagsCount,
        hasImage,
        hasText,
        hasVideo,
        id,
        const DeepCollectionEquality().hash(languages),
        message,
        moderationPayload,
        moderationPayloadHash,
        reaction,
        recommendedAction,
        const DeepCollectionEquality().hash(reporterIds),
        reviewedBy,
        severity,
        status,
        const DeepCollectionEquality().hash(teams),
        updatedAt
      ]);

  @override
  String toString() {
    return 'ReviewQueueItem(actions: $actions, activity: $activity, aiTextSeverity: $aiTextSeverity, assignedTo: $assignedTo, bans: $bans, bounceCount: $bounceCount, call: $call, configKey: $configKey, contentChanged: $contentChanged, createdAt: $createdAt, entityCreator: $entityCreator, entityId: $entityId, entityType: $entityType, feedsV2Activity: $feedsV2Activity, feedsV2Reaction: $feedsV2Reaction, flagLabels: $flagLabels, flagTypes: $flagTypes, flags: $flags, flagsCount: $flagsCount, hasImage: $hasImage, hasText: $hasText, hasVideo: $hasVideo, id: $id, languages: $languages, message: $message, moderationPayload: $moderationPayload, moderationPayloadHash: $moderationPayloadHash, reaction: $reaction, recommendedAction: $recommendedAction, reporterIds: $reporterIds, reviewedBy: $reviewedBy, severity: $severity, status: $status, teams: $teams, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewQueueItemCopyWith<$Res> {
  factory $ReviewQueueItemCopyWith(
          ReviewQueueItem value, $Res Function(ReviewQueueItem) _then) =
      _$ReviewQueueItemCopyWithImpl;
  @useResult
  $Res call(
      {List<ActionLog> actions,
      EnrichedActivity? activity,
      String aiTextSeverity,
      User? assignedTo,
      List<Ban> bans,
      int bounceCount,
      Call? call,
      String configKey,
      bool contentChanged,
      DateTime createdAt,
      EntityCreator? entityCreator,
      String entityId,
      String entityType,
      EnrichedActivity? feedsV2Activity,
      Reaction? feedsV2Reaction,
      List<String> flagLabels,
      List<String> flagTypes,
      List<Flag> flags,
      int flagsCount,
      bool hasImage,
      bool hasText,
      bool hasVideo,
      String id,
      List<String> languages,
      Message? message,
      ModerationPayload? moderationPayload,
      String moderationPayloadHash,
      Reaction? reaction,
      String recommendedAction,
      List<String> reporterIds,
      String reviewedBy,
      int severity,
      String status,
      List<String> teams,
      DateTime updatedAt});
}

/// @nodoc
class _$ReviewQueueItemCopyWithImpl<$Res>
    implements $ReviewQueueItemCopyWith<$Res> {
  _$ReviewQueueItemCopyWithImpl(this._self, this._then);

  final ReviewQueueItem _self;
  final $Res Function(ReviewQueueItem) _then;

  /// Create a copy of ReviewQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actions = null,
    Object? activity = freezed,
    Object? aiTextSeverity = null,
    Object? assignedTo = freezed,
    Object? bans = null,
    Object? bounceCount = null,
    Object? call = freezed,
    Object? configKey = null,
    Object? contentChanged = null,
    Object? createdAt = null,
    Object? entityCreator = freezed,
    Object? entityId = null,
    Object? entityType = null,
    Object? feedsV2Activity = freezed,
    Object? feedsV2Reaction = freezed,
    Object? flagLabels = null,
    Object? flagTypes = null,
    Object? flags = null,
    Object? flagsCount = null,
    Object? hasImage = null,
    Object? hasText = null,
    Object? hasVideo = null,
    Object? id = null,
    Object? languages = null,
    Object? message = freezed,
    Object? moderationPayload = freezed,
    Object? moderationPayloadHash = null,
    Object? reaction = freezed,
    Object? recommendedAction = null,
    Object? reporterIds = null,
    Object? reviewedBy = null,
    Object? severity = null,
    Object? status = null,
    Object? teams = null,
    Object? updatedAt = null,
  }) {
    return _then(ReviewQueueItem(
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionLog>,
      activity: freezed == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as EnrichedActivity?,
      aiTextSeverity: null == aiTextSeverity
          ? _self.aiTextSeverity
          : aiTextSeverity // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as User?,
      bans: null == bans
          ? _self.bans
          : bans // ignore: cast_nullable_to_non_nullable
              as List<Ban>,
      bounceCount: null == bounceCount
          ? _self.bounceCount
          : bounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      call: freezed == call
          ? _self.call
          : call // ignore: cast_nullable_to_non_nullable
              as Call?,
      configKey: null == configKey
          ? _self.configKey
          : configKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentChanged: null == contentChanged
          ? _self.contentChanged
          : contentChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entityCreator: freezed == entityCreator
          ? _self.entityCreator
          : entityCreator // ignore: cast_nullable_to_non_nullable
              as EntityCreator?,
      entityId: null == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      feedsV2Activity: freezed == feedsV2Activity
          ? _self.feedsV2Activity
          : feedsV2Activity // ignore: cast_nullable_to_non_nullable
              as EnrichedActivity?,
      feedsV2Reaction: freezed == feedsV2Reaction
          ? _self.feedsV2Reaction
          : feedsV2Reaction // ignore: cast_nullable_to_non_nullable
              as Reaction?,
      flagLabels: null == flagLabels
          ? _self.flagLabels
          : flagLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flagTypes: null == flagTypes
          ? _self.flagTypes
          : flagTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flags: null == flags
          ? _self.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<Flag>,
      flagsCount: null == flagsCount
          ? _self.flagsCount
          : flagsCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasImage: null == hasImage
          ? _self.hasImage
          : hasImage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasText: null == hasText
          ? _self.hasText
          : hasText // ignore: cast_nullable_to_non_nullable
              as bool,
      hasVideo: null == hasVideo
          ? _self.hasVideo
          : hasVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      moderationPayload: freezed == moderationPayload
          ? _self.moderationPayload
          : moderationPayload // ignore: cast_nullable_to_non_nullable
              as ModerationPayload?,
      moderationPayloadHash: null == moderationPayloadHash
          ? _self.moderationPayloadHash
          : moderationPayloadHash // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: freezed == reaction
          ? _self.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as Reaction?,
      recommendedAction: null == recommendedAction
          ? _self.recommendedAction
          : recommendedAction // ignore: cast_nullable_to_non_nullable
              as String,
      reporterIds: null == reporterIds
          ? _self.reporterIds
          : reporterIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewedBy: null == reviewedBy
          ? _self.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      teams: null == teams
          ? _self.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
