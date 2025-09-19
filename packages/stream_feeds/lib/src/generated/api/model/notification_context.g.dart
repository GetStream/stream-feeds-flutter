// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationContext _$NotificationContextFromJson(Map<String, dynamic> json) =>
    NotificationContext(
      target: json['target'] == null
          ? null
          : NotificationTarget.fromJson(json['target'] as Map<String, dynamic>),
      trigger: json['trigger'] == null
          ? null
          : NotificationTrigger.fromJson(
              json['trigger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationContextToJson(
        NotificationContext instance) =>
    <String, dynamic>{
      'target': instance.target?.toJson(),
      'trigger': instance.trigger?.toJson(),
    };
