// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedGroup _$FeedGroupFromJson(Map<String, dynamic> json) => FeedGroup(
      activityProcessors: (json['activity_processors'] as List<dynamic>)
          .map((e) =>
              ActivityProcessorConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      activitySelectors: (json['activity_selectors'] as List<dynamic>)
          .map(
              (e) => ActivitySelectorConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregation: json['aggregation'] == null
          ? null
          : AggregationConfig.fromJson(
              json['aggregation'] as Map<String, dynamic>),
      aggregationVersion: (json['aggregation_version'] as num).toInt(),
      appPk: (json['app_pk'] as num).toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      defaultVisibility: json['default_visibility'] as String,
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      groupId: json['group_id'] as String,
      lastFeedGetAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_feed_get_at'], const EpochDateTimeConverter().fromJson),
      notification: json['notification'] == null
          ? null
          : NotificationConfig.fromJson(
              json['notification'] as Map<String, dynamic>),
      pushNotification: json['push_notification'] == null
          ? null
          : PushNotificationConfig.fromJson(
              json['push_notification'] as Map<String, dynamic>),
      ranking: json['ranking'] == null
          ? null
          : RankingConfig.fromJson(json['ranking'] as Map<String, dynamic>),
      stories: json['stories'] == null
          ? null
          : StoriesConfig.fromJson(json['stories'] as Map<String, dynamic>),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$FeedGroupToJson(FeedGroup instance) => <String, dynamic>{
      'activity_processors':
          instance.activityProcessors.map((e) => e.toJson()).toList(),
      'activity_selectors':
          instance.activitySelectors.map((e) => e.toJson()).toList(),
      'aggregation': instance.aggregation?.toJson(),
      'aggregation_version': instance.aggregationVersion,
      'app_pk': instance.appPk,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'default_visibility': instance.defaultVisibility,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'group_id': instance.groupId,
      'last_feed_get_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastFeedGetAt, const EpochDateTimeConverter().toJson),
      'notification': instance.notification?.toJson(),
      'push_notification': instance.pushNotification?.toJson(),
      'ranking': instance.ranking?.toJson(),
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
