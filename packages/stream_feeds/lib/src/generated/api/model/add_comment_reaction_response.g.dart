// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentReactionResponse _$AddCommentReactionResponseFromJson(Map<String, dynamic> json) =>
    AddCommentReactionResponse(
      comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      notificationCreated: json['notification_created'] as bool?,
      reaction: FeedsReactionResponse.fromJson(json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCommentReactionResponseToJson(AddCommentReactionResponse instance) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'duration': instance.duration,
  'notification_created': instance.notificationCreated,
  'reaction': instance.reaction.toJson(),
};
