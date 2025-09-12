// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReactionResponse _$AddCommentReactionResponseFromJson(
        Map<String, dynamic> json) =>
    AddCommentReactionResponse(
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      reaction: FeedsReactionResponse.fromJson(
          json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCommentReactionResponseToJson(
        AddCommentReactionResponse instance) =>
    <String, dynamic>{
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
      'reaction': instance.reaction.toJson(),
    };
