// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_vote_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollVoteResponseData _$PollVoteResponseDataFromJson(
        Map<String, dynamic> json) =>
    PollVoteResponseData(
      answerText: json['answer_text'] as String?,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      id: json['id'] as String,
      isAnswer: json['is_answer'] as bool?,
      optionId: json['option_id'] as String,
      pollId: json['poll_id'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$PollVoteResponseDataToJson(
        PollVoteResponseData instance) =>
    <String, dynamic>{
      'answer_text': instance.answerText,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'id': instance.id,
      'is_answer': instance.isAnswer,
      'option_id': instance.optionId,
      'poll_id': instance.pollId,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };
