// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMemberResponse _$FeedMemberResponseFromJson(Map<String, dynamic> json) =>
    FeedMemberResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      inviteAcceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['invite_accepted_at'], const EpochDateTimeConverter().fromJson),
      inviteRejectedAt: _$JsonConverterFromJson<int, DateTime>(
          json['invite_rejected_at'], const EpochDateTimeConverter().fromJson),
      role: json['role'] as String,
      status: $enumDecode(_$FeedMemberResponseStatusEnumMap, json['status'],
          unknownValue: FeedMemberResponseStatus.unknown),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedMemberResponseToJson(FeedMemberResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'invite_accepted_at': _$JsonConverterToJson<int, DateTime>(
          instance.inviteAcceptedAt, const EpochDateTimeConverter().toJson),
      'invite_rejected_at': _$JsonConverterToJson<int, DateTime>(
          instance.inviteRejectedAt, const EpochDateTimeConverter().toJson),
      'role': instance.role,
      'status': _$FeedMemberResponseStatusEnumMap[instance.status]!,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$FeedMemberResponseStatusEnumMap = {
  FeedMemberResponseStatus.member: 'member',
  FeedMemberResponseStatus.pending: 'pending',
  FeedMemberResponseStatus.rejected: 'rejected',
  FeedMemberResponseStatus.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
