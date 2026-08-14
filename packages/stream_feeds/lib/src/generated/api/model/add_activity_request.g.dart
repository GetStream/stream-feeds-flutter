// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddActivityRequest _$AddActivityRequestFromJson(Map<String, dynamic> json) => AddActivityRequest(
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  collectionRefs: (json['collection_refs'] as List<dynamic>?)?.map((e) => e as String).toList(),
  collections: (json['collections'] as List<dynamic>?)
      ?.map((e) => CollectionRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  createNotificationActivity: json['create_notification_activity'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  expiresAt: json['expires_at'] as String?,
  feeds: (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  id: json['id'] as String?,
  interestTags: (json['interest_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  mentionedUserIds: (json['mentioned_user_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
  parentId: json['parent_id'] as String?,
  pollId: json['poll_id'] as String?,
  restrictReplies: json['restrict_replies'] == null
      ? null
      : AddActivityRequestRestrictReplies.fromJson(
          json['restrict_replies'] as String,
        ),
  searchData: json['search_data'] as Map<String, dynamic>?,
  skipEnrichUrl: json['skip_enrich_url'] as bool?,
  skipPush: json['skip_push'] as bool?,
  text: json['text'] as String?,
  type: json['type'] as String,
  visibility: json['visibility'] == null ? null : AddActivityRequestVisibility.fromJson(json['visibility'] as String),
  visibilityTag: json['visibility_tag'] as String?,
);

Map<String, dynamic> _$AddActivityRequestToJson(AddActivityRequest instance) => <String, dynamic>{
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'collection_refs': instance.collectionRefs,
  'collections': instance.collections?.map((e) => e.toJson()).toList(),
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'create_notification_activity': instance.createNotificationActivity,
  'custom': instance.custom,
  'enrich_own_fields': instance.enrichOwnFields,
  'expires_at': instance.expiresAt,
  'feeds': instance.feeds,
  'filter_tags': instance.filterTags,
  'id': instance.id,
  'interest_tags': instance.interestTags,
  'location': instance.location?.toJson(),
  'mentioned_user_ids': instance.mentionedUserIds,
  'parent_id': instance.parentId,
  'poll_id': instance.pollId,
  'restrict_replies': instance.restrictReplies?.toJson(),
  'search_data': instance.searchData,
  'skip_enrich_url': instance.skipEnrichUrl,
  'skip_push': instance.skipPush,
  'text': instance.text,
  'type': instance.type,
  'visibility': instance.visibility?.toJson(),
  'visibility_tag': instance.visibilityTag,
};
