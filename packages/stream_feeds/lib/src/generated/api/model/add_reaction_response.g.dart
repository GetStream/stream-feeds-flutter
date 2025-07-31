// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReactionResponse _$AddReactionResponseFromJson(Map<String, dynamic> json) =>
    AddReactionResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      reaction: FeedsReactionResponse.fromJson(
          json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddReactionResponseToJson(
        AddReactionResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
      'reaction': instance.reaction.toJson(),
    };
