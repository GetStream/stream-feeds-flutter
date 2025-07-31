// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_follow_suggestions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFollowSuggestionsResponse _$GetFollowSuggestionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetFollowSuggestionsResponse(
      duration: json['duration'] as String,
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => FeedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFollowSuggestionsResponseToJson(
        GetFollowSuggestionsResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
    };
