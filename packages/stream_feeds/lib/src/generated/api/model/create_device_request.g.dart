// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDeviceRequest _$CreateDeviceRequestFromJson(Map<String, dynamic> json) =>
    CreateDeviceRequest(
      id: json['id'] as String,
      pushProvider: $enumDecode(
          _$CreateDeviceRequestPushProviderEnumMap, json['push_provider'],
          unknownValue: CreateDeviceRequestPushProvider.unknown),
      pushProviderName: json['push_provider_name'] as String?,
      voipToken: json['voip_token'] as bool?,
    );

Map<String, dynamic> _$CreateDeviceRequestToJson(
        CreateDeviceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'push_provider':
          _$CreateDeviceRequestPushProviderEnumMap[instance.pushProvider]!,
      'push_provider_name': instance.pushProviderName,
      'voip_token': instance.voipToken,
    };

const _$CreateDeviceRequestPushProviderEnumMap = {
  CreateDeviceRequestPushProvider.apn: 'apn',
  CreateDeviceRequestPushProvider.firebase: 'firebase',
  CreateDeviceRequestPushProvider.huawei: 'huawei',
  CreateDeviceRequestPushProvider.xiaomi: 'xiaomi',
  CreateDeviceRequestPushProvider.unknown: '_unknown',
};
