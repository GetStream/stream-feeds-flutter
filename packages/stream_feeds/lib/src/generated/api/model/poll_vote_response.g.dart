// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_vote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollVoteResponse _$PollVoteResponseFromJson(Map<String, dynamic> json) =>
    PollVoteResponse(
      duration: json['duration'] as String,
      vote: json['vote'] == null
          ? null
          : PollVoteResponseData.fromJson(json['vote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PollVoteResponseToJson(PollVoteResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'vote': instance.vote?.toJson(),
    };
