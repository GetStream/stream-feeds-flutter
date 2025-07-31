// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_deactivated_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDeactivatedEvent _$UserDeactivatedEventFromJson(
        Map<String, dynamic> json) =>
    UserDeactivatedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: User.fromJson(json['created_by'] as Map<String, dynamic>),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDeactivatedEventToJson(
        UserDeactivatedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy.toJson(),
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
