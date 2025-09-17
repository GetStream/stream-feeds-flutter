// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_members_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedMembersRequest _$UpdateFeedMembersRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateFeedMembersRequest(
      limit: (json['limit'] as num?)?.toInt(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => FeedMemberRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      operation: $enumDecode(
          _$UpdateFeedMembersRequestOperationEnumMap, json['operation'],
          unknownValue: UpdateFeedMembersRequestOperation.unknown),
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$UpdateFeedMembersRequestToJson(
        UpdateFeedMembersRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'operation':
          _$UpdateFeedMembersRequestOperationEnumMap[instance.operation]!,
      'prev': instance.prev,
    };

const _$UpdateFeedMembersRequestOperationEnumMap = {
  UpdateFeedMembersRequestOperation.remove: 'remove',
  UpdateFeedMembersRequestOperation.set: 'set',
  UpdateFeedMembersRequestOperation.upsert: 'upsert',
  UpdateFeedMembersRequestOperation.unknown: '_unknown',
};
