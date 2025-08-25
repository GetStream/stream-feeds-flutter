// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_level_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipLevelResponse _$MembershipLevelResponseFromJson(
        Map<String, dynamic> json) =>
    MembershipLevelResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>?,
      description: json['description'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
      priority: (json['priority'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$MembershipLevelResponseToJson(
        MembershipLevelResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'priority': instance.priority,
      'tags': instance.tags,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };
