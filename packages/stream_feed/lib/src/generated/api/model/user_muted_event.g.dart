// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_muted_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMutedEvent _$UserMutedEventFromJson(Map<String, dynamic> json) =>
    UserMutedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      targetUser: json['target_user'] as String?,
      targetUsers: (json['target_users'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMutedEventToJson(UserMutedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'target_user': instance.targetUser,
      'target_users': instance.targetUsers,
      'type': instance.type,
      'user': instance.user?.toJson(),
    };
