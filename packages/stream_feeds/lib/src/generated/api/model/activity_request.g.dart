// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRequest _$ActivityRequestFromJson(Map<String, dynamic> json) =>
    ActivityRequest(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      expiresAt: json['expires_at'] as String?,
      fids: (json['fids'] as List<dynamic>).map((e) => e as String).toList(),
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
      searchData: (json['search_data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      text: json['text'] as String?,
      type: json['type'] as String,
      visibility: $enumDecodeNullable(
          _$ActivityRequestVisibilityEnumEnumMap, json['visibility']),
      visibilityTag: json['visibility_tag'] as String?,
    );

Map<String, dynamic> _$ActivityRequestToJson(ActivityRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'custom': instance.custom,
      'expires_at': instance.expiresAt,
      'fids': instance.fids,
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
      'visibility': _$ActivityRequestVisibilityEnumEnumMap[instance.visibility],
      'visibility_tag': instance.visibilityTag,
    };

const _$ActivityRequestVisibilityEnumEnumMap = {
  ActivityRequestVisibilityEnum.private: 'private',
  ActivityRequestVisibilityEnum.public: 'public',
  ActivityRequestVisibilityEnum.tag: 'tag',
  ActivityRequestVisibilityEnum.unknown: 'unknown',
};
