// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentRequest _$UpdateCommentRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCommentRequest(
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  comment: json['comment'] as String?,
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  handleMentionNotifications: json['handle_mention_notifications'] as bool?,
  mentionedUserIds: (json['mentioned_user_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
  skipEnrichUrl: json['skip_enrich_url'] as bool?,
  skipPush: json['skip_push'] as bool?,
);

Map<String, dynamic> _$UpdateCommentRequestToJson(
  UpdateCommentRequest instance,
) => <String, dynamic>{
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'comment': instance.comment,
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'custom': instance.custom,
  'handle_mention_notifications': instance.handleMentionNotifications,
  'mentioned_user_ids': instance.mentionedUserIds,
  'skip_enrich_url': instance.skipEnrichUrl,
  'skip_push': instance.skipPush,
};
