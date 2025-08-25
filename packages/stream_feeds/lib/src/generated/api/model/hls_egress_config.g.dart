// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hls_egress_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HLSEgressConfig _$HLSEgressConfigFromJson(Map<String, dynamic> json) =>
    HLSEgressConfig(
      compositeAppSettings: json['composite_app_settings'] == null
          ? null
          : CompositeAppSettings.fromJson(
              json['composite_app_settings'] as Map<String, dynamic>),
      playlistUrl: json['playlist_url'] as String?,
      qualities: (json['qualities'] as List<dynamic>?)
          ?.map((e) => Quality.fromJson(e as Map<String, dynamic>))
          .toList(),
      startUnixNano: (json['start_unix_nano'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HLSEgressConfigToJson(HLSEgressConfig instance) =>
    <String, dynamic>{
      'composite_app_settings': instance.compositeAppSettings?.toJson(),
      'playlist_url': instance.playlistUrl,
      'qualities': instance.qualities?.map((e) => e.toJson()).toList(),
      'start_unix_nano': instance.startUnixNano,
    };
