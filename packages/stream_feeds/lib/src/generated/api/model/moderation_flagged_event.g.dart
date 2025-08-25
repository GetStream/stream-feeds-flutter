// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_flagged_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModerationFlaggedEvent _$ModerationFlaggedEventFromJson(
        Map<String, dynamic> json) =>
    ModerationFlaggedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      item: json['item'] as String?,
      objectId: json['object_id'] as String?,
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModerationFlaggedEventToJson(
        ModerationFlaggedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'item': instance.item,
      'object_id': instance.objectId,
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
