// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_queue_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewQueueItemResponse _$ReviewQueueItemResponseFromJson(
        Map<String, dynamic> json) =>
    ReviewQueueItemResponse(
      actions: (json['actions'] as List<dynamic>)
          .map((e) => ActionLogResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      activity: json['activity'] == null
          ? null
          : EnrichedActivity.fromJson(json['activity'] as Map<String, dynamic>),
      aiTextSeverity: json['ai_text_severity'] as String,
      assignedTo: json['assigned_to'] == null
          ? null
          : UserResponse.fromJson(json['assigned_to'] as Map<String, dynamic>),
      bans: (json['bans'] as List<dynamic>)
          .map((e) => Ban.fromJson(e as Map<String, dynamic>))
          .toList(),
      call: json['call'] == null
          ? null
          : CallResponse.fromJson(json['call'] as Map<String, dynamic>),
      completedAt: _$JsonConverterFromJson<int, DateTime>(
          json['completed_at'], const EpochDateTimeConverter().fromJson),
      configKey: json['config_key'] as String?,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      entityCreator: json['entity_creator'] == null
          ? null
          : EntityCreatorResponse.fromJson(
              json['entity_creator'] as Map<String, dynamic>),
      entityCreatorId: json['entity_creator_id'] as String?,
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
      flags: (json['flags'] as List<dynamic>)
          .map(
              (e) => ModerationFlagResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      flagsCount: (json['flags_count'] as num).toInt(),
      id: json['id'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      message: json['message'] == null
          ? null
          : MessageResponse.fromJson(json['message'] as Map<String, dynamic>),
      moderationPayload: json['moderation_payload'] == null
          ? null
          : ModerationPayload.fromJson(
              json['moderation_payload'] as Map<String, dynamic>),
      reaction: json['reaction'] == null
          ? null
          : Reaction.fromJson(json['reaction'] as Map<String, dynamic>),
      recommendedAction: json['recommended_action'] as String,
      reviewedAt: _$JsonConverterFromJson<int, DateTime>(
          json['reviewed_at'], const EpochDateTimeConverter().fromJson),
      reviewedBy: json['reviewed_by'] as String,
      severity: (json['severity'] as num).toInt(),
      status: json['status'] as String,
      teams:
          (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$ReviewQueueItemResponseToJson(
        ReviewQueueItemResponse instance) =>
    <String, dynamic>{
      'actions': instance.actions.map((e) => e.toJson()).toList(),
      'activity': instance.activity?.toJson(),
      'ai_text_severity': instance.aiTextSeverity,
      'assigned_to': instance.assignedTo?.toJson(),
      'bans': instance.bans.map((e) => e.toJson()).toList(),
      'call': instance.call?.toJson(),
      'completed_at': _$JsonConverterToJson<int, DateTime>(
          instance.completedAt, const EpochDateTimeConverter().toJson),
      'config_key': instance.configKey,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'entity_creator': instance.entityCreator?.toJson(),
      'entity_creator_id': instance.entityCreatorId,
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'feeds_v2_activity': instance.feedsV2Activity?.toJson(),
      'feeds_v2_reaction': instance.feedsV2Reaction?.toJson(),
      'flags': instance.flags.map((e) => e.toJson()).toList(),
      'flags_count': instance.flagsCount,
      'id': instance.id,
      'languages': instance.languages,
      'message': instance.message?.toJson(),
      'moderation_payload': instance.moderationPayload?.toJson(),
      'reaction': instance.reaction?.toJson(),
      'recommended_action': instance.recommendedAction,
      'reviewed_at': _$JsonConverterToJson<int, DateTime>(
          instance.reviewedAt, const EpochDateTimeConverter().toJson),
      'reviewed_by': instance.reviewedBy,
      'severity': instance.severity,
      'status': instance.status,
      'teams': instance.teams,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
