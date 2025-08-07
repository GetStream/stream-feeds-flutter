// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentReactionResponse _$DeleteCommentReactionResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentReactionResponse(
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      reaction: FeedsReactionResponse.fromJson(
          json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteCommentReactionResponseToJson(
        DeleteCommentReactionResponse instance) =>
    <String, dynamic>{
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
      'reaction': instance.reaction.toJson(),
    };
