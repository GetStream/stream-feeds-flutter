// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_partial_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentPartialRequest _$UpdateCommentPartialRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCommentPartialRequest(
      copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
      handleMentionNotifications: json['handle_mention_notifications'] as bool?,
      set: json['set'] as Map<String, dynamic>?,
      skipEnrichUrl: json['skip_enrich_url'] as bool?,
      skipPush: json['skip_push'] as bool?,
      unset:
          (json['unset'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateCommentPartialRequestToJson(
        UpdateCommentPartialRequest instance) =>
    <String, dynamic>{
      'copy_custom_to_notification': instance.copyCustomToNotification,
      'handle_mention_notifications': instance.handleMentionNotifications,
      'set': instance.set,
      'skip_enrich_url': instance.skipEnrichUrl,
      'skip_push': instance.skipPush,
      'unset': instance.unset,
    };
