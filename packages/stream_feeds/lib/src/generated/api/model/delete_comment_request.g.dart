// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentRequest _$DeleteCommentRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentRequest(
      hardDelete: json['hard_delete'] as bool?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DeleteCommentRequestToJson(
        DeleteCommentRequest instance) =>
    <String, dynamic>{
      'hard_delete': instance.hardDelete,
      'reason': instance.reason,
    };
