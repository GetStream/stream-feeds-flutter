// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_trigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTrigger _$NotificationTriggerFromJson(Map<String, dynamic> json) => NotificationTrigger(
  comment: json['comment'] == null
      ? null
      : NotificationComment.fromJson(
          json['comment'] as Map<String, dynamic>,
        ),
  custom: json['custom'] as Map<String, dynamic>?,
  text: json['text'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$NotificationTriggerToJson(
  NotificationTrigger instance,
) => <String, dynamic>{
  'comment': instance.comment?.toJson(),
  'custom': instance.custom,
  'text': instance.text,
  'type': instance.type,
};
