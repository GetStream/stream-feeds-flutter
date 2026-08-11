// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMemberResponse _$FeedMemberResponseFromJson(Map<String, dynamic> json) => FeedMemberResponse(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>?,
  inviteAcceptedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['invite_accepted_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  inviteRejectedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['invite_rejected_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  membershipLevel: json['membership_level'] == null
      ? null
      : MembershipLevelResponse.fromJson(
          json['membership_level'] as Map<String, dynamic>,
        ),
  role: json['role'] as String,
  status: $enumDecode(
    _$FeedMemberResponseStatusEnumMap,
    json['status'],
    unknownValue: FeedMemberResponseStatus.unknown,
  ),
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedMemberResponseToJson(FeedMemberResponse instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'invite_accepted_at': _$JsonConverterToJson<Object, DateTime>(
    instance.inviteAcceptedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'invite_rejected_at': _$JsonConverterToJson<Object, DateTime>(
    instance.inviteRejectedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'membership_level': instance.membershipLevel?.toJson(),
  'role': instance.role,
  'status': _$FeedMemberResponseStatusEnumMap[instance.status]!,
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
  'user': instance.user.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$FeedMemberResponseStatusEnumMap = {
  FeedMemberResponseStatus.member: 'member',
  FeedMemberResponseStatus.pending: 'pending',
  FeedMemberResponseStatus.rejected: 'rejected',
  FeedMemberResponseStatus.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
