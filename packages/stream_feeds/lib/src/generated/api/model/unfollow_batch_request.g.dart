// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollow_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnfollowBatchRequest _$UnfollowBatchRequestFromJson(Map<String, dynamic> json) => UnfollowBatchRequest(
  deleteNotificationActivity: json['delete_notification_activity'] as bool?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  follows: (json['follows'] as List<dynamic>).map((e) => UnfollowPair.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$UnfollowBatchRequestToJson(UnfollowBatchRequest instance) => <String, dynamic>{
  'delete_notification_activity': instance.deleteNotificationActivity,
  'enrich_own_fields': instance.enrichOwnFields,
  'follows': instance.follows.map((e) => e.toJson()).toList(),
};
