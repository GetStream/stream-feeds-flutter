// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLocation _$ActivityLocationFromJson(Map<String, dynamic> json) =>
    ActivityLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$ActivityLocationToJson(ActivityLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
