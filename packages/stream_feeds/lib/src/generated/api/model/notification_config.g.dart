// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationConfig _$NotificationConfigFromJson(Map<String, dynamic> json) =>
    NotificationConfig(
      deduplicationWindow: json['deduplication_window'] as String?,
      trackRead: json['track_read'] as bool?,
      trackSeen: json['track_seen'] as bool?,
    );

Map<String, dynamic> _$NotificationConfigToJson(NotificationConfig instance) =>
    <String, dynamic>{
      'deduplication_window': instance.deduplicationWindow,
      'track_read': instance.trackRead,
      'track_seen': instance.trackSeen,
    };
