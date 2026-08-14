// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReactionResponse _$AddCommentReactionResponseFromJson(
  Map<String, dynamic> json,
) => AddCommentReactionResponse(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
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

Map<String, dynamic> _$AddCommentReactionResponseToJson(
  AddCommentReactionResponse instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'duration': instance.duration,
  'notification_accepted': instance.notificationAccepted,
  'notification_created': instance.notificationCreated,
  'notification_task_id': instance.notificationTaskId,
  'reaction': instance.reaction.toJson(),
  'reference_activity': instance.referenceActivity?.toJson(),
};
