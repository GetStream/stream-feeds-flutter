// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flag _$FlagFromJson(Map<String, dynamic> json) => Flag(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      entityCreatorId: json['entity_creator_id'] as String?,
      entityId: json['entity_id'] as String,
      entityType: json['entity_type'] as String,
      isStreamedContent: json['is_streamed_content'] as bool?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      moderationPayload: json['moderation_payload'] == null
          ? null
          : ModerationPayload.fromJson(
              json['moderation_payload'] as Map<String, dynamic>),
      moderationPayloadHash: json['moderation_payload_hash'] as String?,
      reason: json['reason'] as String?,
      result: (json['result'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, e as Object),
              ))
          .toList(),
      reviewQueueItem: json['review_queue_item'] == null
          ? null
          : ReviewQueueItem.fromJson(
              json['review_queue_item'] as Map<String, dynamic>),
      reviewQueueItemId: json['review_queue_item_id'] as String?,
      type: json['type'] as String?,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlagToJson(Flag instance) => <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'entity_creator_id': instance.entityCreatorId,
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'is_streamed_content': instance.isStreamedContent,
      'labels': instance.labels,
      'moderation_payload': instance.moderationPayload?.toJson(),
      'moderation_payload_hash': instance.moderationPayloadHash,
      'reason': instance.reason,
      'result': instance.result,
      'review_queue_item': instance.reviewQueueItem?.toJson(),
      'review_queue_item_id': instance.reviewQueueItemId,
      'type': instance.type,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
    };
