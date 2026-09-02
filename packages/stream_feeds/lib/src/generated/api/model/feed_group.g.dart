// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedGroup _$FeedGroupFromJson(Map<String, dynamic> json) => FeedGroup(
  activityFilter: json['activity_filter'] == null
      ? null
      : ActivityFilterConfig.fromJson(
          json['activity_filter'] as Map<String, dynamic>,
        ),
  activityProcessors: (json['activity_processors'] as List<dynamic>)
      .map((e) => ActivityProcessorConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  activitySelectors: (json['activity_selectors'] as List<dynamic>)
      .map((e) => ActivitySelectorConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  aggregation: json['aggregation'] == null
      ? null
      : AggregationConfig.fromJson(json['aggregation'] as Map<String, dynamic>),
  aggregationVersion: (json['aggregation_version'] as num).toInt(),
  appPk: (json['app_pk'] as num).toInt(),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  defaultFollowerRole: json['default_follower_role'] as String,
  defaultVisibility: json['default_visibility'] as String,
  deletedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['deleted_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  groupId: json['group_id'] as String,
  lastFeedGetAt: _$JsonConverterFromJson<Object, DateTime>(
    json['last_feed_get_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  notification: json['notification'] == null
      ? null
      : NotificationConfig.fromJson(
          json['notification'] as Map<String, dynamic>,
        ),
  pushNotification: json['push_notification'] == null
      ? null
      : PushNotificationConfig.fromJson(
          json['push_notification'] as Map<String, dynamic>,
        ),
  ranking: json['ranking'] == null ? null : RankingConfig.fromJson(json['ranking'] as Map<String, dynamic>),
  stories: json['stories'] == null ? null : StoriesConfig.fromJson(json['stories'] as Map<String, dynamic>),
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
);

Map<String, dynamic> _$FeedGroupToJson(FeedGroup instance) => <String, dynamic>{
  'activity_filter': instance.activityFilter?.toJson(),
  'activity_processors': instance.activityProcessors.map((e) => e.toJson()).toList(),
  'activity_selectors': instance.activitySelectors.map((e) => e.toJson()).toList(),
  'aggregation': instance.aggregation?.toJson(),
  'aggregation_version': instance.aggregationVersion,
  'app_pk': instance.appPk,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'default_follower_role': instance.defaultFollowerRole,
  'default_visibility': instance.defaultVisibility,
  'deleted_at': _$JsonConverterToJson<Object, DateTime>(
    instance.deletedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'group_id': instance.groupId,
  'last_feed_get_at': _$JsonConverterToJson<Object, DateTime>(
    instance.lastFeedGetAt,
    const StreamDateTimeConverter().toJson,
  ),
  'notification': instance.notification?.toJson(),
  'push_notification': instance.pushNotification?.toJson(),
  'ranking': instance.ranking?.toJson(),
  'stories': instance.stories?.toJson(),
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
