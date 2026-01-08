// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedRequest _$UpdateFeedRequestFromJson(Map<String, dynamic> json) =>
    UpdateFeedRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      description: json['description'] as String?,
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UpdateFeedRequestToJson(UpdateFeedRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'description': instance.description,
      'filter_tags': instance.filterTags,
      'name': instance.name,
    };
