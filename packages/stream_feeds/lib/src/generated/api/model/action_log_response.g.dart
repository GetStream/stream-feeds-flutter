// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLogResponse _$ActionLogResponseFromJson(Map<String, dynamic> json) =>
    ActionLogResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      id: json['id'] as String,
      reason: json['reason'] as String,
      reviewQueueItem: json['review_queue_item'] == null
          ? null
          : ReviewQueueItemResponse.fromJson(
              json['review_queue_item'] as Map<String, dynamic>),
      targetUser: json['target_user'] == null
          ? null
          : UserResponse.fromJson(json['target_user'] as Map<String, dynamic>),
      targetUserId: json['target_user_id'] as String,
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$ActionLogResponseToJson(ActionLogResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'id': instance.id,
      'reason': instance.reason,
      'review_queue_item': instance.reviewQueueItem?.toJson(),
      'target_user': instance.targetUser?.toJson(),
      'target_user_id': instance.targetUserId,
      'type': instance.type,
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };
