// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activity_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivityReactionResponse _$DeleteActivityReactionResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteActivityReactionResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      reaction: FeedsReactionResponse.fromJson(
          json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteActivityReactionResponseToJson(
        DeleteActivityReactionResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
      'reaction': instance.reaction.toJson(),
    };
