// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reactivated_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReactivatedEvent _$UserReactivatedEventFromJson(
        Map<String, dynamic> json) =>
    UserReactivatedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserReactivatedEventToJson(
        UserReactivatedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
