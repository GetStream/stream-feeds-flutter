// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_activity_shares_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryActivitySharesResponse _$QueryActivitySharesResponseFromJson(
  Map<String, dynamic> json,
) => QueryActivitySharesResponse(
  duration: json['duration'] as String,
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  shares: (json['shares'] as List<dynamic>).map((e) => ShareResponse.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$QueryActivitySharesResponseToJson(
  QueryActivitySharesResponse instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'next': instance.next,
  'prev': instance.prev,
  'shares': instance.shares.map((e) => e.toJson()).toList(),
};
