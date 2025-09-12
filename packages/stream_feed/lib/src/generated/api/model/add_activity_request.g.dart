// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddActivityRequest _$AddActivityRequestFromJson(Map<String, dynamic> json) =>
    AddActivityRequest(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      custom: json['custom'] as Map<String, dynamic>?,
      expiresAt: json['expires_at'] as String?,
      feeds: (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      interestTags: (json['interest_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] == null
          ? null
          : ActivityLocation.fromJson(json['location'] as Map<String, dynamic>),
      mentionedUserIds: (json['mentioned_user_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parentId: json['parent_id'] as String?,
      pollId: json['poll_id'] as String?,
      searchData: json['search_data'] as Map<String, dynamic>?,
      text: json['text'] as String?,
      type: json['type'] as String,
      visibility: $enumDecodeNullable(
          _$AddActivityRequestVisibilityEnumMap, json['visibility'],
          unknownValue: AddActivityRequestVisibility.unknown),
      visibilityTag: json['visibility_tag'] as String?,
    );

Map<String, dynamic> _$AddActivityRequestToJson(AddActivityRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'custom': instance.custom,
      'expires_at': instance.expiresAt,
      'feeds': instance.feeds,
      'filter_tags': instance.filterTags,
      'id': instance.id,
      'interest_tags': instance.interestTags,
      'location': instance.location?.toJson(),
      'mentioned_user_ids': instance.mentionedUserIds,
      'parent_id': instance.parentId,
      'poll_id': instance.pollId,
      'search_data': instance.searchData,
      'text': instance.text,
      'type': instance.type,
      'visibility': _$AddActivityRequestVisibilityEnumMap[instance.visibility],
      'visibility_tag': instance.visibilityTag,
    };

const _$AddActivityRequestVisibilityEnumMap = {
  AddActivityRequestVisibility.private: 'private',
  AddActivityRequestVisibility.public: 'public',
  AddActivityRequestVisibility.tag: 'tag',
  AddActivityRequestVisibility.unknown: '_unknown',
};
