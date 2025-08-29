// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_custom_action_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModerationCustomActionEvent _$ModerationCustomActionEventFromJson(
        Map<String, dynamic> json) =>
    ModerationCustomActionEvent(
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

Map<String, dynamic> _$ModerationCustomActionEventToJson(
        ModerationCustomActionEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'item': instance.item?.toJson(),
      'message': instance.message?.toJson(),
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
