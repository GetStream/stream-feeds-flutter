// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockUsersResponse _$BlockUsersResponseFromJson(Map<String, dynamic> json) =>
    BlockUsersResponse(
      blockedByUserId: json['blocked_by_user_id'] as String,
      blockedUserId: json['blocked_user_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$BlockUsersResponseToJson(BlockUsersResponse instance) =>
    <String, dynamic>{
      'blocked_by_user_id': instance.blockedByUserId,
      'blocked_user_id': instance.blockedUserId,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'duration': instance.duration,
    };
