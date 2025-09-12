// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityAddedNotification _$ActivityAddedNotificationFromJson(
        Map<String, dynamic> json) =>
    ActivityAddedNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      activityId: json['activity_id'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ActivityAddedNotificationToJson(
        ActivityAddedNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
      'activity_id': instance.activityId,
    };

CommentAddedNotification _$CommentAddedNotificationFromJson(
        Map<String, dynamic> json) =>
    CommentAddedNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      activityId: json['activity_id'] as String,
      commentId: json['comment_id'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CommentAddedNotificationToJson(
        CommentAddedNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
      'activity_id': instance.activityId,
      'comment_id': instance.commentId,
    };

ActivityReactionNotification _$ActivityReactionNotificationFromJson(
        Map<String, dynamic> json) =>
    ActivityReactionNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      activityId: json['activity_id'] as String,
      reactionType: json['reaction_type'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ActivityReactionNotificationToJson(
        ActivityReactionNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
      'activity_id': instance.activityId,
      'reaction_type': instance.reactionType,
    };

CommentReactionNotification _$CommentReactionNotificationFromJson(
        Map<String, dynamic> json) =>
    CommentReactionNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      activityId: json['activity_id'] as String,
      commentId: json['comment_id'] as String,
      reactionType: json['reaction_type'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CommentReactionNotificationToJson(
        CommentReactionNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
      'activity_id': instance.activityId,
      'comment_id': instance.commentId,
      'reaction_type': instance.reactionType,
    };

FollowCreatedNotification _$FollowCreatedNotificationFromJson(
        Map<String, dynamic> json) =>
    FollowCreatedNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      sourceFid: json['source_fid'] as String,
      targetFid: json['target_fid'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$FollowCreatedNotificationToJson(
        FollowCreatedNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
      'source_fid': instance.sourceFid,
      'target_fid': instance.targetFid,
    };

FeedUpdatedNotification _$FeedUpdatedNotificationFromJson(
        Map<String, dynamic> json) =>
    FeedUpdatedNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$FeedUpdatedNotificationToJson(
        FeedUpdatedNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
    };

UnknownNotification _$UnknownNotificationFromJson(Map<String, dynamic> json) =>
    UnknownNotification(
      sender: json['sender'] as String,
      type: json['type'] as String,
      fid: json['fid'] as String,
      receiverId: json['receiver_id'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      custom: json['custom'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UnknownNotificationToJson(
        UnknownNotification instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'type': instance.type,
      'fid': instance.fid,
      'receiver_id': instance.receiverId,
      'title': instance.title,
      'body': instance.body,
      'custom': instance.custom,
    };
