// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityPinResponse _$ActivityPinResponseFromJson(Map<String, dynamic> json) =>
    ActivityPinResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      feed: json['feed'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityPinResponseToJson(
        ActivityPinResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'feed': instance.feed,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
    };
