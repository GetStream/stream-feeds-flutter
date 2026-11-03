// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedsPreferences _$FeedsPreferencesFromJson(
  Map<String, dynamic> json,
) => FeedsPreferences(
  comment: json['comment'] as FeedsPreferencesComment?,
  commentMention: json['comment_mention'] as FeedsPreferencesCommentMention?,
  commentReaction: json['comment_reaction'] as FeedsPreferencesCommentReaction?,
  commentReply: json['comment_reply'] as FeedsPreferencesCommentReply?,
  customActivityTypes: (json['custom_activity_types'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  follow: json['follow'] as FeedsPreferencesFollow?,
  mention: json['mention'] as FeedsPreferencesMention?,
  reaction: json['reaction'] as FeedsPreferencesReaction?,
);

Map<String, dynamic> _$FeedsPreferencesToJson(FeedsPreferences instance) => <String, dynamic>{
  'comment': instance.comment,
  'comment_mention': instance.commentMention,
  'comment_reaction': instance.commentReaction,
  'comment_reply': instance.commentReply,
  'custom_activity_types': instance.customActivityTypes,
  'follow': instance.follow,
  'mention': instance.mention,
  'reaction': instance.reaction,
};
