// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedsReactionResponse _$FeedsReactionResponseFromJson(
        Map<String, dynamic> json) =>
    FeedsReactionResponse(
      activityId: json['activity_id'] as String,
      commentId: json['comment_id'] as String?,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>?,
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedsReactionResponseToJson(
        FeedsReactionResponse instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'comment_id': instance.commentId,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'type': instance.type,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
    };
