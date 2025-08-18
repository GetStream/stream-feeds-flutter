// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutSettings _$LayoutSettingsFromJson(Map<String, dynamic> json) =>
    LayoutSettings(
      detectOrientation: json['detect_orientation'] as bool?,
      externalAppUrl: json['external_app_url'] as String,
      externalCssUrl: json['external_css_url'] as String,
      name: $enumDecode(_$LayoutSettingsNameEnumMap, json['name'],
          unknownValue: LayoutSettingsName.unknown),
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$LayoutSettingsToJson(LayoutSettings instance) =>
    <String, dynamic>{
      'detect_orientation': instance.detectOrientation,
      'external_app_url': instance.externalAppUrl,
      'external_css_url': instance.externalCssUrl,
      'name': _$LayoutSettingsNameEnumMap[instance.name]!,
      'options': instance.options,
    };

const _$LayoutSettingsNameEnumMap = {
  LayoutSettingsName.custom: 'custom',
  LayoutSettingsName.grid: 'grid',
  LayoutSettingsName.mobile: 'mobile',
  LayoutSettingsName.singleParticipant: 'single-participant',
  LayoutSettingsName.spotlight: 'spotlight',
  LayoutSettingsName.unknown: '_unknown',
};
