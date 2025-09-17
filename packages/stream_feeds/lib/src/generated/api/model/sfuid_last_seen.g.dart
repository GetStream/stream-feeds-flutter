// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfuid_last_seen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SFUIDLastSeen _$SFUIDLastSeenFromJson(Map<String, dynamic> json) =>
    SFUIDLastSeen(
      id: json['id'] as String,
      lastSeen: const EpochDateTimeConverter()
          .fromJson((json['last_seen'] as num).toInt()),
      processStartTime: (json['process_start_time'] as num).toInt(),
    );

Map<String, dynamic> _$SFUIDLastSeenToJson(SFUIDLastSeen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_seen': const EpochDateTimeConverter().toJson(instance.lastSeen),
      'process_start_time': instance.processStartTime,
    };
