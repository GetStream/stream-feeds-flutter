// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedLocation _$SharedLocationFromJson(Map<String, dynamic> json) =>
    SharedLocation(
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      channelCid: json['channel_cid'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdByDeviceId: json['created_by_device_id'] as String,
      endAt: _$JsonConverterFromJson<int, DateTime>(
          json['end_at'], const EpochDateTimeConverter().fromJson),
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      messageId: json['message_id'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$SharedLocationToJson(SharedLocation instance) =>
    <String, dynamic>{
      'channel': instance.channel?.toJson(),
      'channel_cid': instance.channelCid,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by_device_id': instance.createdByDeviceId,
      'end_at': _$JsonConverterToJson<int, DateTime>(
          instance.endAt, const EpochDateTimeConverter().toJson),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'message': instance.message?.toJson(),
      'message_id': instance.messageId,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user_id': instance.userId,
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
