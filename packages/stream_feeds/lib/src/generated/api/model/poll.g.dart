// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      allowAnswers: json['allow_answers'] as bool,
      allowUserSuggestedOptions: json['allow_user_suggested_options'] as bool,
      answersCount: (json['answers_count'] as num).toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      createdById: json['created_by_id'] as String,
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      description: json['description'] as String,
      enforceUniqueVote: json['enforce_unique_vote'] as bool,
      id: json['id'] as String,
      isClosed: json['is_closed'] as bool?,
      latestAnswers: (json['latest_answers'] as List<dynamic>)
          .map((e) => PollVote.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestVotesByOption:
          (json['latest_votes_by_option'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PollVote.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      maxVotesAllowed: (json['max_votes_allowed'] as num?)?.toInt(),
      name: json['name'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => PollOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownVotes: (json['own_votes'] as List<dynamic>)
          .map((e) => PollVote.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      voteCount: (json['vote_count'] as num).toInt(),
      voteCountsByOption:
          Map<String, int>.from(json['vote_counts_by_option'] as Map),
      votingVisibility: json['voting_visibility'] as String?,
    );

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'allow_answers': instance.allowAnswers,
      'allow_user_suggested_options': instance.allowUserSuggestedOptions,
      'answers_count': instance.answersCount,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy?.toJson(),
      'created_by_id': instance.createdById,
      'custom': instance.custom,
      'description': instance.description,
      'enforce_unique_vote': instance.enforceUniqueVote,
      'id': instance.id,
      'is_closed': instance.isClosed,
      'latest_answers': instance.latestAnswers.map((e) => e.toJson()).toList(),
      'latest_votes_by_option': instance.latestVotesByOption
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'max_votes_allowed': instance.maxVotesAllowed,
      'name': instance.name,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'own_votes': instance.ownVotes.map((e) => e.toJson()).toList(),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'vote_count': instance.voteCount,
      'vote_counts_by_option': instance.voteCountsByOption,
      'voting_visibility': instance.votingVisibility,
    };
