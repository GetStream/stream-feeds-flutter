// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLog _$ActionLogFromJson(Map<String, dynamic> json) => ActionLog(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      id: json['id'] as String,
      reason: json['reason'] as String,
      reporterType: json['reporter_type'] as String,
      reviewQueueItem: json['review_queue_item'] == null
          ? null
          : ReviewQueueItem.fromJson(
              json['review_queue_item'] as Map<String, dynamic>),
      reviewQueueItemId: json['review_queue_item_id'] as String,
      targetUser: json['target_user'] == null
          ? null
          : User.fromJson(json['target_user'] as Map<String, dynamic>),
      targetUserId: json['target_user_id'] as String,
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionLogToJson(ActionLog instance) => <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'id': instance.id,
      'reason': instance.reason,
      'reporter_type': instance.reporterType,
      'review_queue_item': instance.reviewQueueItem?.toJson(),
      'review_queue_item_id': instance.reviewQueueItemId,
      'target_user': instance.targetUser?.toJson(),
      'target_user_id': instance.targetUserId,
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
