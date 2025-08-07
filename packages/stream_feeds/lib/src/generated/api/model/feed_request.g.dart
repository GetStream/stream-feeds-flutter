// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedRequest _$FeedRequestFromJson(Map<String, dynamic> json) => FeedRequest(
      createdById: json['created_by_id'] as String?,
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      description: json['description'] as String?,
      feedGroupId: json['feed_group_id'] as String,
      feedId: json['feed_id'] as String,
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => FeedMemberRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      visibility: $enumDecodeNullable(
          _$FeedRequestVisibilityEnumEnumMap, json['visibility']),
    );

Map<String, dynamic> _$FeedRequestToJson(FeedRequest instance) =>
    <String, dynamic>{
      'created_by_id': instance.createdById,
      'custom': instance.custom,
      'description': instance.description,
      'feed_group_id': instance.feedGroupId,
      'feed_id': instance.feedId,
      'filter_tags': instance.filterTags,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'visibility': _$FeedRequestVisibilityEnumEnumMap[instance.visibility],
    };

const _$FeedRequestVisibilityEnumEnumMap = {
  FeedRequestVisibilityEnum.followers: 'followers',
  FeedRequestVisibilityEnum.members: 'members',
  FeedRequestVisibilityEnum.private: 'private',
  FeedRequestVisibilityEnum.public: 'public',
  FeedRequestVisibilityEnum.visible: 'visible',
  FeedRequestVisibilityEnum.unknown: 'unknown',
};
