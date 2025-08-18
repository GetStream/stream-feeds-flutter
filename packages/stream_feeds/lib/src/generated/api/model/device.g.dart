// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      disabled: json['disabled'] as bool?,
      disabledReason: json['disabled_reason'] as String?,
      id: json['id'] as String,
      pushProvider: $enumDecode(
          _$DevicePushProviderEnumMap, json['push_provider'],
          unknownValue: DevicePushProvider.unknown),
      pushProviderName: json['push_provider_name'] as String?,
      userId: json['user_id'] as String,
      voip: json['voip'] as bool?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'disabled': instance.disabled,
      'disabled_reason': instance.disabledReason,
      'id': instance.id,
      'push_provider': _$DevicePushProviderEnumMap[instance.pushProvider]!,
      'push_provider_name': instance.pushProviderName,
      'user_id': instance.userId,
      'voip': instance.voip,
    };

const _$DevicePushProviderEnumMap = {
  DevicePushProvider.apn: 'apn',
  DevicePushProvider.firebase: 'firebase',
  DevicePushProvider.huawei: 'huawei',
  DevicePushProvider.xiaomi: 'xiaomi',
  DevicePushProvider.unknown: '_unknown',
};
