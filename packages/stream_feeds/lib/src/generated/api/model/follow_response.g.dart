// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowResponse _$FollowResponseFromJson(Map<String, dynamic> json) =>
    FollowResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      followerRole: json['follower_role'] as String,
      pushPreference: $enumDecode(
          _$FollowResponsePushPreferenceEnumMap, json['push_preference'],
          unknownValue: FollowResponsePushPreference.unknown),
      requestAcceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['request_accepted_at'], const EpochDateTimeConverter().fromJson),
      requestRejectedAt: _$JsonConverterFromJson<int, DateTime>(
          json['request_rejected_at'], const EpochDateTimeConverter().fromJson),
      sourceFeed:
          FeedResponse.fromJson(json['source_feed'] as Map<String, dynamic>),
      status: $enumDecode(_$FollowResponseStatusEnumMap, json['status'],
          unknownValue: FollowResponseStatus.unknown),
      targetFeed:
          FeedResponse.fromJson(json['target_feed'] as Map<String, dynamic>),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$FollowResponseToJson(FollowResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'follower_role': instance.followerRole,
      'push_preference':
          _$FollowResponsePushPreferenceEnumMap[instance.pushPreference]!,
      'request_accepted_at': _$JsonConverterToJson<int, DateTime>(
          instance.requestAcceptedAt, const EpochDateTimeConverter().toJson),
      'request_rejected_at': _$JsonConverterToJson<int, DateTime>(
          instance.requestRejectedAt, const EpochDateTimeConverter().toJson),
      'source_feed': instance.sourceFeed.toJson(),
      'status': _$FollowResponseStatusEnumMap[instance.status]!,
      'target_feed': instance.targetFeed.toJson(),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };

const _$FollowResponsePushPreferenceEnumMap = {
  FollowResponsePushPreference.all: 'all',
  FollowResponsePushPreference.none: 'none',
  FollowResponsePushPreference.unknown: '_unknown',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$FollowResponseStatusEnumMap = {
  FollowResponseStatus.accepted: 'accepted',
  FollowResponseStatus.pending: 'pending',
  FollowResponseStatus.rejected: 'rejected',
  FollowResponseStatus.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
