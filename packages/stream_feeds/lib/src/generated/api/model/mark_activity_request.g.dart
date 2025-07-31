// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkActivityRequest _$MarkActivityRequestFromJson(Map<String, dynamic> json) =>
    MarkActivityRequest(
      markAllRead: json['mark_all_read'] as bool?,
      markAllSeen: json['mark_all_seen'] as bool?,
      markRead: (json['mark_read'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      markWatched: (json['mark_watched'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MarkActivityRequestToJson(
        MarkActivityRequest instance) =>
    <String, dynamic>{
      'mark_all_read': instance.markAllRead,
      'mark_all_seen': instance.markAllSeen,
      'mark_read': instance.markRead,
      'mark_watched': instance.markWatched,
    };
