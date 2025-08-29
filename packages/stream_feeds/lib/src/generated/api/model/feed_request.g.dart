// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedRequest _$FeedRequestFromJson(Map<String, dynamic> json) => FeedRequest(
      createdById: json['created_by_id'] as String?,
      custom: json['custom'] as Map<String, dynamic>?,
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
          _$FeedRequestVisibilityEnumMap, json['visibility'],
          unknownValue: FeedRequestVisibility.unknown),
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
      'visibility': _$FeedRequestVisibilityEnumMap[instance.visibility],
    };

const _$FeedRequestVisibilityEnumMap = {
  FeedRequestVisibility.followers: 'followers',
  FeedRequestVisibility.members: 'members',
  FeedRequestVisibility.private: 'private',
  FeedRequestVisibility.public: 'public',
  FeedRequestVisibility.visible: 'visible',
  FeedRequestVisibility.unknown: '_unknown',
};
