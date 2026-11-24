// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_feedback_event_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentFeedbackEventPayload _$CommentFeedbackEventPayloadFromJson(
  Map<String, dynamic> json,
) => CommentFeedbackEventPayload(
  commentId: json['comment_id'] as String,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  hide: json['hide'] as bool,
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentFeedbackEventPayloadToJson(
  CommentFeedbackEventPayload instance,
) => <String, dynamic>{
  'comment_id': instance.commentId,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'hide': instance.hide,
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
  'user': instance.user.toJson(),
};
