// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_vote_casted_feed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollVoteCastedFeedEvent _$PollVoteCastedFeedEventFromJson(
        Map<String, dynamic> json) =>
    PollVoteCastedFeedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      feedVisibility: json['feed_visibility'] as String?,
      fid: json['fid'] as String,
      poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
      pollVote: PollVoteResponseData.fromJson(
          json['poll_vote'] as Map<String, dynamic>),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
    );

Map<String, dynamic> _$PollVoteCastedFeedEventToJson(
        PollVoteCastedFeedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'feed_visibility': instance.feedVisibility,
      'fid': instance.fid,
      'poll': instance.poll.toJson(),
      'poll_vote': instance.pollVote.toJson(),
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
