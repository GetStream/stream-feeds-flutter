// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_interests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserInterestsResponse _$DeleteUserInterestsResponseFromJson(
  Map<String, dynamic> json,
) => DeleteUserInterestsResponse(
  duration: json['duration'] as String,
  interests: (json['interests'] as List<dynamic>)
      .map((e) => InterestTagResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeleteUserInterestsResponseToJson(
  DeleteUserInterestsResponse instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'interests': instance.interests.map((e) => e.toJson()).toList(),
};
