// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentRequest _$UpdateCommentRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCommentRequest(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String?,
      custom: json['custom'] as Map<String, dynamic>?,
      skipEnrichUrl: json['skip_enrich_url'] as bool?,
      skipPush: json['skip_push'] as bool?,
    );

Map<String, dynamic> _$UpdateCommentRequestToJson(
        UpdateCommentRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'comment': instance.comment,
      'custom': instance.custom,
      'skip_enrich_url': instance.skipEnrichUrl,
      'skip_push': instance.skipPush,
    };
