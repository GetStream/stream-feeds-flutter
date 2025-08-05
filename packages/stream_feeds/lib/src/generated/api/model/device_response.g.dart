// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceResponse _$DeviceResponseFromJson(Map<String, dynamic> json) =>
    DeviceResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      disabled: json['disabled'] as bool?,
      disabledReason: json['disabled_reason'] as String?,
      id: json['id'] as String,
      pushProvider: json['push_provider'] as String,
      pushProviderName: json['push_provider_name'] as String?,
      userId: json['user_id'] as String,
      voip: json['voip'] as bool?,
    );

Map<String, dynamic> _$DeviceResponseToJson(DeviceResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'disabled': instance.disabled,
      'disabled_reason': instance.disabledReason,
      'id': instance.id,
      'push_provider': instance.pushProvider,
      'push_provider_name': instance.pushProviderName,
      'user_id': instance.userId,
      'voip': instance.voip,
    };
