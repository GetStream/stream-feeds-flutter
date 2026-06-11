// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_or_create_unfollow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrCreateUnfollowRequest _$GetOrCreateUnfollowRequestFromJson(
  Map<String, dynamic> json,
) => GetOrCreateUnfollowRequest(
  deleteNotificationActivity: json['delete_notification_activity'] as bool?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  keepHistory: json['keep_history'] as bool?,
  source: json['source'] as String,
  target: json['target'] as String,
);

Map<String, dynamic> _$GetOrCreateUnfollowRequestToJson(
  GetOrCreateUnfollowRequest instance,
) => <String, dynamic>{
  'delete_notification_activity': instance.deleteNotificationActivity,
  'enrich_own_fields': instance.enrichOwnFields,
  'keep_history': instance.keepHistory,
  'source': instance.source,
  'target': instance.target,
};
