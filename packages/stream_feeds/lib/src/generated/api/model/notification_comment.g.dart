// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationComment _$NotificationCommentFromJson(Map<String, dynamic> json) =>
    NotificationComment(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String,
      id: json['id'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$NotificationCommentToJson(
        NotificationComment instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'comment': instance.comment,
      'id': instance.id,
      'user_id': instance.userId,
    };
