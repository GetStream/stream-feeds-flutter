// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_creator_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityCreatorResponse _$EntityCreatorResponseFromJson(
        Map<String, dynamic> json) =>
    EntityCreatorResponse(
      avgResponseTime: (json['avg_response_time'] as num?)?.toInt(),
      banCount: (json['ban_count'] as num).toInt(),
      banned: json['banned'] as bool,
      blockedUserIds: (json['blocked_user_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      deactivatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deactivated_at'], const EpochDateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      deletedContentCount: (json['deleted_content_count'] as num).toInt(),
      flaggedCount: (json['flagged_count'] as num).toInt(),
      id: json['id'] as String,
      image: json['image'] as String?,
      language: json['language'] as String,
      lastActive: _$JsonConverterFromJson<int, DateTime>(
          json['last_active'], const EpochDateTimeConverter().fromJson),
      name: json['name'] as String?,
      online: json['online'] as bool,
      revokeTokensIssuedBefore: _$JsonConverterFromJson<int, DateTime>(
          json['revoke_tokens_issued_before'],
          const EpochDateTimeConverter().fromJson),
      role: json['role'] as String,
      teams: (json['teams'] as List<dynamic>).map((e) => e as String).toList(),
      teamsRole: (json['teams_role'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$EntityCreatorResponseToJson(
        EntityCreatorResponse instance) =>
    <String, dynamic>{
      'avg_response_time': instance.avgResponseTime,
      'ban_count': instance.banCount,
      'banned': instance.banned,
      'blocked_user_ids': instance.blockedUserIds,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deactivated_at': _$JsonConverterToJson<int, DateTime>(
          instance.deactivatedAt, const EpochDateTimeConverter().toJson),
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'deleted_content_count': instance.deletedContentCount,
      'flagged_count': instance.flaggedCount,
      'id': instance.id,
      'image': instance.image,
      'language': instance.language,
      'last_active': _$JsonConverterToJson<int, DateTime>(
          instance.lastActive, const EpochDateTimeConverter().toJson),
      'name': instance.name,
      'online': instance.online,
      'revoke_tokens_issued_before': _$JsonConverterToJson<int, DateTime>(
          instance.revokeTokensIssuedBefore,
          const EpochDateTimeConverter().toJson),
      'role': instance.role,
      'teams': instance.teams,
      'teams_role': instance.teamsRole,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
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
