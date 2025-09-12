// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeofenceSettings _$GeofenceSettingsFromJson(Map<String, dynamic> json) =>
    GeofenceSettings(
      names: (json['names'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GeofenceSettingsToJson(GeofenceSettings instance) =>
    <String, dynamic>{
      'names': instance.names,
    };
