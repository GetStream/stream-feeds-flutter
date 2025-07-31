// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) => FeedResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy:
          UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      description: json['description'] as String,
      fid: json['fid'] as String,
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followerCount: (json['follower_count'] as num).toInt(),
      followingCount: (json['following_count'] as num).toInt(),
      groupId: json['group_id'] as String,
      id: json['id'] as String,
      memberCount: (json['member_count'] as num).toInt(),
      name: json['name'] as String,
      pinCount: (json['pin_count'] as num).toInt(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$FeedResponseToJson(FeedResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy.toJson(),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'description': instance.description,
      'fid': instance.fid,
      'filter_tags': instance.filterTags,
      'follower_count': instance.followerCount,
      'following_count': instance.followingCount,
      'group_id': instance.groupId,
      'id': instance.id,
      'member_count': instance.memberCount,
      'name': instance.name,
      'pin_count': instance.pinCount,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'visibility': instance.visibility,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
