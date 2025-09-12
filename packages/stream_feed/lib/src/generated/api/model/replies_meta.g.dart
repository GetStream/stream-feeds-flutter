// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replies_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepliesMeta _$RepliesMetaFromJson(Map<String, dynamic> json) => RepliesMeta(
      depthTruncated: json['depth_truncated'] as bool,
      hasMore: json['has_more'] as bool,
      nextCursor: json['next_cursor'] as String?,
      remaining: (json['remaining'] as num).toInt(),
    );

Map<String, dynamic> _$RepliesMetaToJson(RepliesMeta instance) =>
    <String, dynamic>{
      'depth_truncated': instance.depthTruncated,
      'has_more': instance.hasMore,
      'next_cursor': instance.nextCursor,
      'remaining': instance.remaining,
    };
