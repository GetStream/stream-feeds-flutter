// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_mark_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityMarkEvent _$ActivityMarkEventFromJson(Map<String, dynamic> json) =>
    ActivityMarkEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      fid: json['fid'] as String,
      markAllRead: json['mark_all_read'] as bool?,
      markAllSeen: json['mark_all_seen'] as bool?,
      markRead: (json['mark_read'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      markWatched: (json['mark_watched'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityMarkEventToJson(ActivityMarkEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'fid': instance.fid,
      'mark_all_read': instance.markAllRead,
      'mark_all_seen': instance.markAllSeen,
      'mark_read': instance.markRead,
      'mark_watched': instance.markWatched,
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
      'user': instance.user?.toJson(),
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
