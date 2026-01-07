// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appeal_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppealItemResponse _$AppealItemResponseFromJson(Map<String, dynamic> json) =>
    AppealItemResponse(
      appealReason: json['appeal_reason'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      decisionReason: json['decision_reason'] as String?,
      entityContent: json['entity_content'] == null
          ? null
          : ModerationPayload.fromJson(
              json['entity_content'] as Map<String, dynamic>),
      entityId: json['entity_id'] as String,
      entityType: json['entity_type'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppealItemResponseToJson(AppealItemResponse instance) =>
    <String, dynamic>{
      'appeal_reason': instance.appealReason,
      'attachments': instance.attachments,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'decision_reason': instance.decisionReason,
      'entity_content': instance.entityContent?.toJson(),
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'id': instance.id,
      'status': instance.status,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
    };
