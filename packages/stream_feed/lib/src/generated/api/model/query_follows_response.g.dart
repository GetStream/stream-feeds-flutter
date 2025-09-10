// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_follows_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFollowsResponse _$QueryFollowsResponseFromJson(
        Map<String, dynamic> json) =>
    QueryFollowsResponse(
      duration: json['duration'] as String,
      follows: (json['follows'] as List<dynamic>)
          .map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryFollowsResponseToJson(
        QueryFollowsResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follows': instance.follows.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'prev': instance.prev,
    };
