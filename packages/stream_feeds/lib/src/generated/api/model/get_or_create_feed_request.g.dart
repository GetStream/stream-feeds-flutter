// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_or_create_feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrCreateFeedRequest _$GetOrCreateFeedRequestFromJson(
        Map<String, dynamic> json) =>
    GetOrCreateFeedRequest(
      data: json['data'] == null
          ? null
          : FeedInput.fromJson(json['data'] as Map<String, dynamic>),
      externalRanking: json['external_ranking'] as Map<String, dynamic>?,
      filter: json['filter'] as Map<String, dynamic>?,
      followersPagination: json['followers_pagination'] == null
          ? null
          : PagerRequest.fromJson(
              json['followers_pagination'] as Map<String, dynamic>),
      followingPagination: json['following_pagination'] == null
          ? null
          : PagerRequest.fromJson(
              json['following_pagination'] as Map<String, dynamic>),
      interestWeights: (json['interest_weights'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      limit: (json['limit'] as num?)?.toInt(),
      memberPagination: json['member_pagination'] == null
          ? null
          : PagerRequest.fromJson(
              json['member_pagination'] as Map<String, dynamic>),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      view: json['view'] as String?,
      watch: json['watch'] as bool?,
    );

Map<String, dynamic> _$GetOrCreateFeedRequestToJson(
        GetOrCreateFeedRequest instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'external_ranking': instance.externalRanking,
      'filter': instance.filter,
      'followers_pagination': instance.followersPagination?.toJson(),
      'following_pagination': instance.followingPagination?.toJson(),
      'interest_weights': instance.interestWeights,
      'limit': instance.limit,
      'member_pagination': instance.memberPagination?.toJson(),
      'next': instance.next,
      'prev': instance.prev,
      'view': instance.view,
      'watch': instance.watch,
    };
