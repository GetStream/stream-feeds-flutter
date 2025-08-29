// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentRequest _$UpdateCommentRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCommentRequest(
      comment: json['comment'] as String?,
      custom: json['custom'] as Map<String, dynamic>?,
      skipPush: json['skip_push'] as bool?,
    );

Map<String, dynamic> _$UpdateCommentRequestToJson(
        UpdateCommentRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'custom': instance.custom,
      'skip_push': instance.skipPush,
    };
