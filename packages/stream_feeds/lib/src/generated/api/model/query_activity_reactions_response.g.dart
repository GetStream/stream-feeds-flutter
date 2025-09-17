// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_activity_reactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryActivityReactionsResponse _$QueryActivityReactionsResponseFromJson(
        Map<String, dynamic> json) =>
    QueryActivityReactionsResponse(
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      reactions: (json['reactions'] as List<dynamic>)
          .map((e) => FeedsReactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QueryActivityReactionsResponseToJson(
        QueryActivityReactionsResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
      'reactions': instance.reactions.map((e) => e.toJson()).toList(),
    };
