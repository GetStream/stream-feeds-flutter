// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTarget _$NotificationTargetFromJson(Map<String, dynamic> json) =>
    NotificationTarget(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String?,
      text: json['text'] as String?,
      type: json['type'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$NotificationTargetToJson(NotificationTarget instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'type': instance.type,
      'user_id': instance.userId,
    };
