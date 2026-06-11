// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollow_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnfollowPair _$UnfollowPairFromJson(Map<String, dynamic> json) => UnfollowPair(
  keepHistory: json['keep_history'] as bool?,
  source: json['source'] as String,
  target: json['target'] as String,
);

Map<String, dynamic> _$UnfollowPairToJson(UnfollowPair instance) => <String, dynamic>{
  'keep_history': instance.keepHistory,
  'source': instance.source,
  'target': instance.target,
};
