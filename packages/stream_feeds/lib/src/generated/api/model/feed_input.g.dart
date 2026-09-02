// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedInput _$FeedInputFromJson(Map<String, dynamic> json) => FeedInput(
  custom: json['custom'] as Map<String, dynamic>?,
  description: json['description'] as String?,
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => FeedMemberRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  visibility: json['visibility'] == null ? null : FeedInputVisibility.fromJson(json['visibility'] as String),
);

Map<String, dynamic> _$FeedInputToJson(FeedInput instance) => <String, dynamic>{
  'custom': instance.custom,
  'description': instance.description,
  'filter_tags': instance.filterTags,
  'location': instance.location?.toJson(),
  'members': instance.members?.map((e) => e.toJson()).toList(),
  'name': instance.name,
  'visibility': instance.visibility?.toJson(),
};
