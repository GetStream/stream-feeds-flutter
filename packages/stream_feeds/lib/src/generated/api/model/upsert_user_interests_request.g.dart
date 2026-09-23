// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_user_interests_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertUserInterestsRequest _$UpsertUserInterestsRequestFromJson(
  Map<String, dynamic> json,
) => UpsertUserInterestsRequest(
  interests: (json['interests'] as List<dynamic>)
      .map((e) => UserInterestRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UpsertUserInterestsRequestToJson(
  UpsertUserInterestsRequest instance,
) => <String, dynamic>{
  'interests': instance.interests.map((e) => e.toJson()).toList(),
};
