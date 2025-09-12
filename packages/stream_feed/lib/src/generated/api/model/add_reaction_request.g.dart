// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReactionRequest _$AddReactionRequestFromJson(Map<String, dynamic> json) =>
    AddReactionRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: json['custom'] as Map<String, dynamic>?,
      skipPush: json['skip_push'] as bool?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AddReactionRequestToJson(AddReactionRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'skip_push': instance.skipPush,
      'type': instance.type,
    };
