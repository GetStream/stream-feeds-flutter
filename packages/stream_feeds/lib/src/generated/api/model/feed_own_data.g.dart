// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_own_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedOwnData _$FeedOwnDataFromJson(Map<String, dynamic> json) => FeedOwnData(
  ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
      ?.map((e) => FeedOwnCapability.fromJson(e as String))
      .toList(),
  ownFollowings: (json['own_followings'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownFollows: (json['own_follows'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownMembership: json['own_membership'] == null
      ? null
      : FeedMemberResponse.fromJson(
          json['own_membership'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FeedOwnDataToJson(
  FeedOwnData instance,
) => <String, dynamic>{
  'own_capabilities': instance.ownCapabilities?.map((e) => e.toJson()).toList(),
  'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
  'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
  'own_membership': instance.ownMembership?.toJson(),
};
