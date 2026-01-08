// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollow_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnfollowBatchResponse _$UnfollowBatchResponseFromJson(
        Map<String, dynamic> json) =>
    UnfollowBatchResponse(
      duration: json['duration'] as String,
      follows: (json['follows'] as List<dynamic>)
          .map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnfollowBatchResponseToJson(
        UnfollowBatchResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follows': instance.follows.map((e) => e.toJson()).toList(),
    };
