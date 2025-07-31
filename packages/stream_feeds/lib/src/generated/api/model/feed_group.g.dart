// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedGroup _$FeedGroupFromJson(Map<String, dynamic> json) => FeedGroup(
      appPK: (json['app_p_k'] as num).toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      defaultViewID: json['default_view_i_d'] as String,
      defaultVisibility: json['default_visibility'] as String,
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      iD: json['i_d'] as String,
      lastFeedGetAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_feed_get_at'], const EpochDateTimeConverter().fromJson),
      notification: json['notification'] == null
          ? null
          : NotificationConfig.fromJson(
              json['notification'] as Map<String, dynamic>),
      stories: json['stories'] == null
          ? null
          : StoriesConfig.fromJson(json['stories'] as Map<String, dynamic>),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$FeedGroupToJson(FeedGroup instance) => <String, dynamic>{
      'app_p_k': instance.appPK,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'default_view_i_d': instance.defaultViewID,
      'default_visibility': instance.defaultVisibility,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'i_d': instance.iD,
      'last_feed_get_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastFeedGetAt, const EpochDateTimeConverter().toJson),
      'notification': instance.notification?.toJson(),
      'stories': instance.stories?.toJson(),
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
