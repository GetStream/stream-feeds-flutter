// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_queue_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewQueueItem _$ReviewQueueItemFromJson(Map<String, dynamic> json) =>
    ReviewQueueItem(
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      activity: json['activity'] == null
          ? null
          : EnrichedActivity.fromJson(json['activity'] as Map<String, dynamic>),
      aiTextSeverity: json['ai_text_severity'] as String,
      assignedTo: json['assigned_to'] == null
          ? null
          : User.fromJson(json['assigned_to'] as Map<String, dynamic>),
      bans: (json['bans'] as List<dynamic>)
          .map((e) => Ban.fromJson(e as Map<String, dynamic>))
          .toList(),
      bounceCount: (json['bounce_count'] as num).toInt(),
      call: json['call'] == null
          ? null
          : Call.fromJson(json['call'] as Map<String, dynamic>),
      configKey: json['config_key'] as String,
      contentChanged: json['content_changed'] as bool,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      entityCreator: json['entity_creator'] == null
          ? null
          : EntityCreator.fromJson(
              json['entity_creator'] as Map<String, dynamic>),
      entityId: json['entity_id'] as String,
      entityType: json['entity_type'] as String,
      feedsV2Activity: json['feeds_v2_activity'] == null
          ? null
          : EnrichedActivity.fromJson(
              json['feeds_v2_activity'] as Map<String, dynamic>),
      feedsV2Reaction: json['feeds_v2_reaction'] == null
          ? null
          : Reaction.fromJson(
              json['feeds_v2_reaction'] as Map<String, dynamic>),
      flagLabels: (json['flag_labels'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flagTypes: (json['flag_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flags: (json['flags'] as List<dynamic>)
          .map((e) => Flag.fromJson(e as Map<String, dynamic>))
          .toList(),
      flagsCount: (json['flags_count'] as num).toInt(),
      hasImage: json['has_image'] as bool,
      hasText: json['has_text'] as bool,
      hasVideo: json['has_video'] as bool,
      id: json['id'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      moderationPayload: json['moderation_payload'] == null
          ? null
          : ModerationPayload.fromJson(
              json['moderation_payload'] as Map<String, dynamic>),
      moderationPayloadHash: json['moderation_payload_hash'] as String,
      reaction: json['reaction'] == null
          ? null
          : Reaction.fromJson(json['reaction'] as Map<String, dynamic>),
      recommendedAction: json['recommended_action'] as String,
      reporterIds: (json['reporter_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reviewedBy: json['reviewed_by'] as String,
      severity: (json['severity'] as num).toInt(),
      status: json['status'] as String,
      teams: (json['teams'] as List<dynamic>).map((e) => e as String).toList(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$ReviewQueueItemToJson(ReviewQueueItem instance) =>
    <String, dynamic>{
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'activity': instance.activity?.toJson(),
      'ai_text_severity': instance.aiTextSeverity,
      'assigned_to': instance.assignedTo?.toJson(),
      'bans': instance.bans.map((e) => e.toJson()).toList(),
      'bounce_count': instance.bounceCount,
      'call': instance.call?.toJson(),
      'config_key': instance.configKey,
      'content_changed': instance.contentChanged,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'entity_creator': instance.entityCreator?.toJson(),
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'feeds_v2_activity': instance.feedsV2Activity?.toJson(),
      'feeds_v2_reaction': instance.feedsV2Reaction?.toJson(),
      'flag_labels': instance.flagLabels,
      'flag_types': instance.flagTypes,
      'flags': instance.flags.map((e) => e.toJson()).toList(),
      'flags_count': instance.flagsCount,
      'has_image': instance.hasImage,
      'has_text': instance.hasText,
      'has_video': instance.hasVideo,
      'id': instance.id,
      'languages': instance.languages,
      'message': instance.message?.toJson(),
      'moderation_payload': instance.moderationPayload?.toJson(),
      'moderation_payload_hash': instance.moderationPayloadHash,
      'reaction': instance.reaction?.toJson(),
      'recommended_action': instance.recommendedAction,
      'reporter_ids': instance.reporterIds,
      'reviewed_by': instance.reviewedBy,
      'severity': instance.severity,
      'status': instance.status,
      'teams': instance.teams,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };
