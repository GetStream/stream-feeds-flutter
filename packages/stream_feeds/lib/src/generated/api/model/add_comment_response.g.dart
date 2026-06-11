// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentResponse _$AddCommentResponseFromJson(Map<String, dynamic> json) => AddCommentResponse(
  comment: CommentResponse.fromJson(
    json['comment'] as Map<String, dynamic>,
  ),
  duration: json['duration'] as String,
  mentionNotificationsCreated: (json['mention_notifications_created'] as num?)?.toInt(),
  notificationCreated: json['notification_created'] as bool?,
);

Map<String, dynamic> _$AddCommentResponseToJson(AddCommentResponse instance) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'duration': instance.duration,
  'mention_notifications_created': instance.mentionNotificationsCreated,
  'notification_created': instance.notificationCreated,
};
