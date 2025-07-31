// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReactionRequest _$AddCommentReactionRequestFromJson(
        Map<String, dynamic> json) =>
    AddCommentReactionRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      type: json['type'] as String,
    );

Map<String, dynamic> _$AddCommentReactionRequestToJson(
        AddCommentReactionRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'type': instance.type,
    };
