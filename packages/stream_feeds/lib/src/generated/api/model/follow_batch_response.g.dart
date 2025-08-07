// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowBatchResponse _$FollowBatchResponseFromJson(Map<String, dynamic> json) =>
    FollowBatchResponse(
      duration: json['duration'] as String,
      follows: (json['follows'] as List<dynamic>)
          .map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FollowBatchResponseToJson(
        FollowBatchResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follows': instance.follows.map((e) => e.toJson()).toList(),
    };
