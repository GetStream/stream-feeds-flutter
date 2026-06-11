// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_partial_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityPartialRequest _$UpdateActivityPartialRequestFromJson(
  Map<String, dynamic> json,
) => UpdateActivityPartialRequest(
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  handleMentionNotifications: json['handle_mention_notifications'] as bool?,
  runActivityProcessors: json['run_activity_processors'] as bool?,
  set: json['set'] as Map<String, dynamic>?,
  unset: (json['unset'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$UpdateActivityPartialRequestToJson(
  UpdateActivityPartialRequest instance,
) => <String, dynamic>{
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'enrich_own_fields': instance.enrichOwnFields,
  'handle_mention_notifications': instance.handleMentionNotifications,
  'run_activity_processors': instance.runActivityProcessors,
  'set': instance.set,
  'unset': instance.unset,
};
