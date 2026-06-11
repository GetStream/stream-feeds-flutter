// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_interests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInterestsResponse _$GetUserInterestsResponseFromJson(
  Map<String, dynamic> json,
) => GetUserInterestsResponse(
  duration: json['duration'] as String,
  interests: (json['interests'] as List<dynamic>)
      .map((e) => InterestTagResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetUserInterestsResponseToJson(
  GetUserInterestsResponse instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'interests': instance.interests.map((e) => e.toJson()).toList(),
};
