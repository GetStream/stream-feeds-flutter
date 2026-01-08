// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_action_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitActionRequest _$SubmitActionRequestFromJson(Map<String, dynamic> json) =>
    SubmitActionRequest(
      actionType: $enumDecode(
          _$SubmitActionRequestActionTypeEnumMap, json['action_type'],
          unknownValue: SubmitActionRequestActionType.unknown),
      appealId: json['appeal_id'] as String?,
      ban: json['ban'] == null
          ? null
          : BanActionRequest.fromJson(json['ban'] as Map<String, dynamic>),
      block: json['block'] == null
          ? null
          : BlockActionRequest.fromJson(json['block'] as Map<String, dynamic>),
      custom: json['custom'] == null
          ? null
          : CustomActionRequest.fromJson(
              json['custom'] as Map<String, dynamic>),
      deleteActivity: json['delete_activity'] == null
          ? null
          : DeleteActivityRequest.fromJson(
              json['delete_activity'] as Map<String, dynamic>),
      deleteComment: json['delete_comment'] == null
          ? null
          : DeleteCommentRequest.fromJson(
              json['delete_comment'] as Map<String, dynamic>),
      deleteMessage: json['delete_message'] == null
          ? null
          : DeleteMessageRequest.fromJson(
              json['delete_message'] as Map<String, dynamic>),
      deleteReaction: json['delete_reaction'] == null
          ? null
          : DeleteReactionRequest.fromJson(
              json['delete_reaction'] as Map<String, dynamic>),
      deleteUser: json['delete_user'] == null
          ? null
          : DeleteUserRequest.fromJson(
              json['delete_user'] as Map<String, dynamic>),
      itemId: json['item_id'] as String?,
      markReviewed: json['mark_reviewed'] == null
          ? null
          : MarkReviewedRequest.fromJson(
              json['mark_reviewed'] as Map<String, dynamic>),
      rejectAppeal: json['reject_appeal'] == null
          ? null
          : RejectAppealRequest.fromJson(
              json['reject_appeal'] as Map<String, dynamic>),
      restore: json['restore'] == null
          ? null
          : RestoreActionRequest.fromJson(
              json['restore'] as Map<String, dynamic>),
      shadowBlock: json['shadow_block'] == null
          ? null
          : ShadowBlockActionRequest.fromJson(
              json['shadow_block'] as Map<String, dynamic>),
      unban: json['unban'] == null
          ? null
          : UnbanActionRequest.fromJson(json['unban'] as Map<String, dynamic>),
      unblock: json['unblock'] == null
          ? null
          : UnblockActionRequest.fromJson(
              json['unblock'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitActionRequestToJson(
        SubmitActionRequest instance) =>
    <String, dynamic>{
      'action_type':
          _$SubmitActionRequestActionTypeEnumMap[instance.actionType]!,
      'appeal_id': instance.appealId,
      'ban': instance.ban?.toJson(),
      'block': instance.block?.toJson(),
      'custom': instance.custom?.toJson(),
      'delete_activity': instance.deleteActivity?.toJson(),
      'delete_comment': instance.deleteComment?.toJson(),
      'delete_message': instance.deleteMessage?.toJson(),
      'delete_reaction': instance.deleteReaction?.toJson(),
      'delete_user': instance.deleteUser?.toJson(),
      'item_id': instance.itemId,
      'mark_reviewed': instance.markReviewed?.toJson(),
      'reject_appeal': instance.rejectAppeal?.toJson(),
      'restore': instance.restore?.toJson(),
      'shadow_block': instance.shadowBlock?.toJson(),
      'unban': instance.unban?.toJson(),
      'unblock': instance.unblock?.toJson(),
    };

const _$SubmitActionRequestActionTypeEnumMap = {
  SubmitActionRequestActionType.ban: 'ban',
  SubmitActionRequestActionType.block: 'block',
  SubmitActionRequestActionType.custom: 'custom',
  SubmitActionRequestActionType.deleteActivity: 'delete_activity',
  SubmitActionRequestActionType.deleteComment: 'delete_comment',
  SubmitActionRequestActionType.deleteMessage: 'delete_message',
  SubmitActionRequestActionType.deleteReaction: 'delete_reaction',
  SubmitActionRequestActionType.deleteUser: 'delete_user',
  SubmitActionRequestActionType.endCall: 'end_call',
  SubmitActionRequestActionType.kickUser: 'kick_user',
  SubmitActionRequestActionType.markReviewed: 'mark_reviewed',
  SubmitActionRequestActionType.rejectAppeal: 'reject_appeal',
  SubmitActionRequestActionType.restore: 'restore',
  SubmitActionRequestActionType.shadowBlock: 'shadow_block',
  SubmitActionRequestActionType.unban: 'unban',
  SubmitActionRequestActionType.unblock: 'unblock',
  SubmitActionRequestActionType.unmask: 'unmask',
  SubmitActionRequestActionType.unknown: '_unknown',
};
