// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityRequest _$UpdateActivityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityRequest(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      collectionRefs: (json['collection_refs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      custom: json['custom'] as Map<String, dynamic>?,
      expiresAt: _$JsonConverterFromJson<int, DateTime>(
          json['expires_at'], const EpochDateTimeConverter().fromJson),
      feeds:
          (json['feeds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      interestTags: (json['interest_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] == null
          ? null
          : ActivityLocation.fromJson(json['location'] as Map<String, dynamic>),
      pollId: json['poll_id'] as String?,
      restrictReplies: $enumDecodeNullable(
          _$UpdateActivityRequestRestrictRepliesEnumMap,
          json['restrict_replies'],
          unknownValue: UpdateActivityRequestRestrictReplies.unknown),
      skipEnrichUrl: json['skip_enrich_url'] as bool?,
      text: json['text'] as String?,
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$UpdateActivityRequestToJson(
        UpdateActivityRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'collection_refs': instance.collectionRefs,
      'custom': instance.custom,
      'expires_at': _$JsonConverterToJson<int, DateTime>(
          instance.expiresAt, const EpochDateTimeConverter().toJson),
      'feeds': instance.feeds,
      'filter_tags': instance.filterTags,
      'interest_tags': instance.interestTags,
      'location': instance.location?.toJson(),
      'poll_id': instance.pollId,
      'restrict_replies': _$UpdateActivityRequestRestrictRepliesEnumMap[
          instance.restrictReplies],
      'skip_enrich_url': instance.skipEnrichUrl,
      'text': instance.text,
      'visibility': instance.visibility,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$UpdateActivityRequestRestrictRepliesEnumMap = {
  UpdateActivityRequestRestrictReplies.everyone: 'everyone',
  UpdateActivityRequestRestrictReplies.nobody: 'nobody',
  UpdateActivityRequestRestrictReplies.peopleIFollow: 'people_i_follow',
  UpdateActivityRequestRestrictReplies.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
