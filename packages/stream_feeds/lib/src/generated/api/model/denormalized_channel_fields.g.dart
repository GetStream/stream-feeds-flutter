// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'denormalized_channel_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DenormalizedChannelFields _$DenormalizedChannelFieldsFromJson(
        Map<String, dynamic> json) =>
    DenormalizedChannelFields(
      createdAt: json['created_at'] as String?,
      createdById: json['created_by_id'] as String?,
      custom: json['custom'] as Map<String, dynamic>?,
      disabled: json['disabled'] as bool?,
      frozen: json['frozen'] as bool?,
      id: json['id'] as String?,
      lastMessageAt: json['last_message_at'] as String?,
      memberCount: (json['member_count'] as num?)?.toInt(),
      team: json['team'] as String?,
      type: json['type'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DenormalizedChannelFieldsToJson(
        DenormalizedChannelFields instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'created_by_id': instance.createdById,
      'custom': instance.custom,
      'disabled': instance.disabled,
      'frozen': instance.frozen,
      'id': instance.id,
      'last_message_at': instance.lastMessageAt,
      'member_count': instance.memberCount,
      'team': instance.team,
      'type': instance.type,
      'updated_at': instance.updatedAt,
    };
