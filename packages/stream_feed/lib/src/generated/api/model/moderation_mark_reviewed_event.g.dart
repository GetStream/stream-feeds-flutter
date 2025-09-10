// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_mark_reviewed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModerationMarkReviewedEvent _$ModerationMarkReviewedEventFromJson(
        Map<String, dynamic> json) =>
    ModerationMarkReviewedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      item: json['item'] == null
          ? null
          : ReviewQueueItem.fromJson(json['item'] as Map<String, dynamic>),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModerationMarkReviewedEventToJson(
        ModerationMarkReviewedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'item': instance.item?.toJson(),
      'message': instance.message?.toJson(),
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
