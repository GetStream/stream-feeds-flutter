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
      collectionRefs: (json['collection_refs'] as List<dynamic>?)
          ?.map((e) => e as String)
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
      restrictReplies: $enumDecodeNullable(
          _$ActivityRequestRestrictRepliesEnumMap, json['restrict_replies'],
          unknownValue: ActivityRequestRestrictReplies.unknown),
      searchData: json['search_data'] as Map<String, dynamic>?,
      skipEnrichUrl: json['skip_enrich_url'] as bool?,
      text: json['text'] as String?,
      type: json['type'] as String,
      visibility: $enumDecodeNullable(
          _$ActivityRequestVisibilityEnumMap, json['visibility'],
          unknownValue: ActivityRequestVisibility.unknown),
      visibilityTag: json['visibility_tag'] as String?,
    );

Map<String, dynamic> _$ActivityRequestToJson(ActivityRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'collection_refs': instance.collectionRefs,
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
      'restrict_replies':
          _$ActivityRequestRestrictRepliesEnumMap[instance.restrictReplies],
      'search_data': instance.searchData,
      'skip_enrich_url': instance.skipEnrichUrl,
      'text': instance.text,
      'type': instance.type,
      'visibility': _$ActivityRequestVisibilityEnumMap[instance.visibility],
      'visibility_tag': instance.visibilityTag,
    };

const _$ActivityRequestRestrictRepliesEnumMap = {
  ActivityRequestRestrictReplies.everyone: 'everyone',
  ActivityRequestRestrictReplies.nobody: 'nobody',
  ActivityRequestRestrictReplies.peopleIFollow: 'people_i_follow',
  ActivityRequestRestrictReplies.unknown: '_unknown',
};

const _$ActivityRequestVisibilityEnumMap = {
  ActivityRequestVisibility.private: 'private',
  ActivityRequestVisibility.public: 'public',
  ActivityRequestVisibility.tag: 'tag',
  ActivityRequestVisibility.unknown: '_unknown',
};
