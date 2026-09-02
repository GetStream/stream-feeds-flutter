// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) => FeedResponse(
  activityCount: (json['activity_count'] as num).toInt(),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  createdBy: UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
  custom: json['custom'] as Map<String, dynamic>?,
  deletedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['deleted_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  description: json['description'] as String,
  feed: json['feed'] as String,
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  followerCount: (json['follower_count'] as num).toInt(),
  followingCount: (json['following_count'] as num).toInt(),
  groupId: json['group_id'] as String,
  id: json['id'] as String,
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  memberCount: (json['member_count'] as num).toInt(),
  name: json['name'] as String,
  ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
      ?.map((e) => FeedOwnCapability.fromJson(e as String))
      .toList(),
  ownFollowings: (json['own_followings'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownFollows: (json['own_follows'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownMembership: json['own_membership'] == null
      ? null
      : FeedMemberResponse.fromJson(
          json['own_membership'] as Map<String, dynamic>,
        ),
  pinCount: (json['pin_count'] as num).toInt(),
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
  visibility: json['visibility'] == null ? null : FeedResponseVisibility.fromJson(json['visibility'] as String),
);

Map<String, dynamic> _$FeedResponseToJson(
  FeedResponse instance,
) => <String, dynamic>{
  'activity_count': instance.activityCount,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy.toJson(),
  'custom': instance.custom,
  'deleted_at': _$JsonConverterToJson<Object, DateTime>(
    instance.deletedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'description': instance.description,
  'feed': instance.feed,
  'filter_tags': instance.filterTags,
  'follower_count': instance.followerCount,
  'following_count': instance.followingCount,
  'group_id': instance.groupId,
  'id': instance.id,
  'location': instance.location?.toJson(),
  'member_count': instance.memberCount,
  'name': instance.name,
  'own_capabilities': instance.ownCapabilities?.map((e) => e.toJson()).toList(),
  'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
  'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
  'own_membership': instance.ownMembership?.toJson(),
  'pin_count': instance.pinCount,
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
  'visibility': instance.visibility?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
