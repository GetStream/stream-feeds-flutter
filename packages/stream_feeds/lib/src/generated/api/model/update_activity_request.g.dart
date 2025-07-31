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
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      expiresAt: _$JsonConverterFromJson<int, DateTime>(
          json['expires_at'], const EpochDateTimeConverter().fromJson),
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
      text: json['text'] as String?,
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$UpdateActivityRequestToJson(
        UpdateActivityRequest instance) =>
    <String, dynamic>{
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'custom': instance.custom,
      'expires_at': _$JsonConverterToJson<int, DateTime>(
          instance.expiresAt, const EpochDateTimeConverter().toJson),
      'filter_tags': instance.filterTags,
      'interest_tags': instance.interestTags,
      'location': instance.location?.toJson(),
      'poll_id': instance.pollId,
      'text': instance.text,
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
