// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionGroupResponse _$ReactionGroupResponseFromJson(
        Map<String, dynamic> json) =>
    ReactionGroupResponse(
      count: (json['count'] as num).toInt(),
      firstReactionAt: const EpochDateTimeConverter()
          .fromJson((json['first_reaction_at'] as num).toInt()),
      lastReactionAt: const EpochDateTimeConverter()
          .fromJson((json['last_reaction_at'] as num).toInt()),
      sumScores: (json['sum_scores'] as num).toInt(),
    );

Map<String, dynamic> _$ReactionGroupResponseToJson(
        ReactionGroupResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'first_reaction_at':
          const EpochDateTimeConverter().toJson(instance.firstReactionAt),
      'last_reaction_at':
          const EpochDateTimeConverter().toJson(instance.lastReactionAt),
      'sum_scores': instance.sumScores,
    };
