// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityRequest _$UpdateActivityRequestFromJson(
  Map<String, dynamic> json,
) => UpdateActivityRequest(
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  collectionRefs: (json['collection_refs'] as List<dynamic>?)?.map((e) => e as String).toList(),
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  expiresAt: _$JsonConverterFromJson<Object, DateTime>(
    json['expires_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  feeds: (json['feeds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  handleMentionNotifications: json['handle_mention_notifications'] as bool?,
  interestTags: (json['interest_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  mentionedUserIds: (json['mentioned_user_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
  pollId: json['poll_id'] as String?,
  restrictReplies: $enumDecodeNullable(
    _$UpdateActivityRequestRestrictRepliesEnumMap,
    json['restrict_replies'],
    unknownValue: UpdateActivityRequestRestrictReplies.unknown,
  ),
  runActivityProcessors: json['run_activity_processors'] as bool?,
  searchData: json['search_data'] as Map<String, dynamic>?,
  skipEnrichUrl: json['skip_enrich_url'] as bool?,
  text: json['text'] as String?,
  visibility: $enumDecodeNullable(
    _$UpdateActivityRequestVisibilityEnumMap,
    json['visibility'],
    unknownValue: UpdateActivityRequestVisibility.unknown,
  ),
  visibilityTag: json['visibility_tag'] as String?,
);

Map<String, dynamic> _$UpdateActivityRequestToJson(
  UpdateActivityRequest instance,
) => <String, dynamic>{
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'collection_refs': instance.collectionRefs,
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'custom': instance.custom,
  'enrich_own_fields': instance.enrichOwnFields,
  'expires_at': _$JsonConverterToJson<Object, DateTime>(
    instance.expiresAt,
    const EpochDateTimeConverter().toJson,
  ),
  'feeds': instance.feeds,
  'filter_tags': instance.filterTags,
  'handle_mention_notifications': instance.handleMentionNotifications,
  'interest_tags': instance.interestTags,
  'location': instance.location?.toJson(),
  'mentioned_user_ids': instance.mentionedUserIds,
  'poll_id': instance.pollId,
  'restrict_replies': _$UpdateActivityRequestRestrictRepliesEnumMap[instance.restrictReplies],
  'run_activity_processors': instance.runActivityProcessors,
  'search_data': instance.searchData,
  'skip_enrich_url': instance.skipEnrichUrl,
  'text': instance.text,
  'visibility': _$UpdateActivityRequestVisibilityEnumMap[instance.visibility],
  'visibility_tag': instance.visibilityTag,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$UpdateActivityRequestRestrictRepliesEnumMap = {
  UpdateActivityRequestRestrictReplies.everyone: 'everyone',
  UpdateActivityRequestRestrictReplies.nobody: 'nobody',
  UpdateActivityRequestRestrictReplies.peopleIFollow: 'people_i_follow',
  UpdateActivityRequestRestrictReplies.unknown: '_unknown',
};

const _$UpdateActivityRequestVisibilityEnumMap = {
  UpdateActivityRequestVisibility.private: 'private',
  UpdateActivityRequestVisibility.public: 'public',
  UpdateActivityRequestVisibility.tag: 'tag',
  UpdateActivityRequestVisibility.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
