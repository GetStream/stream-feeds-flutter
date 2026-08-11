// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReactionRequest _$AddReactionRequestFromJson(Map<String, dynamic> json) => AddReactionRequest(
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  createNotificationActivity: json['create_notification_activity'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  enforceUnique: json['enforce_unique'] as bool?,
  skipPush: json['skip_push'] as bool?,
  targetFeeds: (json['target_feeds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  type: json['type'] as String,
);

Map<String, dynamic> _$AddReactionRequestToJson(AddReactionRequest instance) => <String, dynamic>{
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'create_notification_activity': instance.createNotificationActivity,
  'custom': instance.custom,
  'enforce_unique': instance.enforceUnique,
  'skip_push': instance.skipPush,
  'target_feeds': instance.targetFeeds,
  'type': instance.type,
};
