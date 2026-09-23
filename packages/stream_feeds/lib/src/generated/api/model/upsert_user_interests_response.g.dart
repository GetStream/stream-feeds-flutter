// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_user_interests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertUserInterestsResponse _$UpsertUserInterestsResponseFromJson(
  Map<String, dynamic> json,
) => UpsertUserInterestsResponse(
  duration: json['duration'] as String,
  interests: (json['interests'] as List<dynamic>)
      .map((e) => InterestTagResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpsertUserInterestsResponseToJson(
  UpsertUserInterestsResponse instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'interests': instance.interests.map((e) => e.toJson()).toList(),
};
