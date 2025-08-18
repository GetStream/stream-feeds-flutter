// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidenceScore: (json['confidence_score'] as num).toDouble(),
      controversyScore: (json['controversy_score'] as num?)?.toDouble(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      downvoteCount: (json['downvote_count'] as num).toInt(),
      id: json['id'] as String,
      latestReactions: (json['latest_reactions'] as List<dynamic>?)
          ?.map(
              (e) => FeedsReactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentionedUsers: (json['mentioned_users'] as List<dynamic>)
          .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderation: json['moderation'] == null
          ? null
          : ModerationV2Response.fromJson(
              json['moderation'] as Map<String, dynamic>),
      objectId: json['object_id'] as String,
      objectType: json['object_type'] as String,
      ownReactions: (json['own_reactions'] as List<dynamic>)
          .map((e) => FeedsReactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: json['parent_id'] as String?,
      reactionCount: (json['reaction_count'] as num).toInt(),
      reactionGroups: (json['reaction_groups'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, ReactionGroupResponse.fromJson(e as Map<String, dynamic>)),
      ),
      replyCount: (json['reply_count'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      status: json['status'] as String,
      text: json['text'] as String?,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      upvoteCount: (json['upvote_count'] as num).toInt(),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'confidence_score': instance.confidenceScore,
      'controversy_score': instance.controversyScore,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'downvote_count': instance.downvoteCount,
      'id': instance.id,
      'latest_reactions':
          instance.latestReactions?.map((e) => e.toJson()).toList(),
      'mentioned_users':
          instance.mentionedUsers.map((e) => e.toJson()).toList(),
      'moderation': instance.moderation?.toJson(),
      'object_id': instance.objectId,
      'object_type': instance.objectType,
      'own_reactions': instance.ownReactions.map((e) => e.toJson()).toList(),
      'parent_id': instance.parentId,
      'reaction_count': instance.reactionCount,
      'reaction_groups':
          instance.reactionGroups?.map((k, e) => MapEntry(k, e.toJson())),
      'reply_count': instance.replyCount,
      'score': instance.score,
      'status': instance.status,
      'text': instance.text,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'upvote_count': instance.upvoteCount,
      'user': instance.user.toJson(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
