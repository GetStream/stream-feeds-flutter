// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReactionResponse _$AddReactionResponseFromJson(Map<String, dynamic> json) => AddReactionResponse(
  activity: ActivityResponse.fromJson(
    json['activity'] as Map<String, dynamic>,
  ),
  duration: json['duration'] as String,
  notificationAccepted: json['notification_accepted'] as bool?,
  notificationCreated: json['notification_created'] as bool?,
  notificationTaskId: json['notification_task_id'] as String?,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  referenceActivity: json['reference_activity'] == null
      ? null
      : ActivityResponse.fromJson(
          json['reference_activity'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AddReactionResponseToJson(
  AddReactionResponse instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'duration': instance.duration,
  'notification_accepted': instance.notificationAccepted,
  'notification_created': instance.notificationCreated,
  'notification_task_id': instance.notificationTaskId,
  'reaction': instance.reaction.toJson(),
  'reference_activity': instance.referenceActivity?.toJson(),
};
