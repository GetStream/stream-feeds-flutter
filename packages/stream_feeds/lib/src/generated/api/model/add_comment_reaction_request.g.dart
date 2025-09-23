// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReactionRequest _$AddCommentReactionRequestFromJson(
        Map<String, dynamic> json) =>
    AddCommentReactionRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: json['custom'] as Map<String, dynamic>?,
      enforceUnique: json['enforce_unique'] as bool?,
      skipPush: json['skip_push'] as bool?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AddCommentReactionRequestToJson(
        AddCommentReactionRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'enforce_unique': instance.enforceUnique,
      'skip_push': instance.skipPush,
      'type': instance.type,
    };
