// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedRequest _$UpdateFeedRequestFromJson(Map<String, dynamic> json) => UpdateFeedRequest(
  clearLocation: json['clear_location'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  description: json['description'] as String?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  name: json['name'] as String?,
);

Map<String, dynamic> _$UpdateFeedRequestToJson(UpdateFeedRequest instance) => <String, dynamic>{
  'clear_location': instance.clearLocation,
  'custom': instance.custom,
  'description': instance.description,
  'enrich_own_fields': instance.enrichOwnFields,
  'filter_tags': instance.filterTags,
  'location': instance.location?.toJson(),
  'name': instance.name,
};
