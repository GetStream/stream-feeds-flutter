// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserRequest _$DeleteUserRequestFromJson(Map<String, dynamic> json) =>
    DeleteUserRequest(
      deleteConversationChannels: json['delete_conversation_channels'] as bool?,
      deleteFeedsContent: json['delete_feeds_content'] as bool?,
      hardDelete: json['hard_delete'] as bool?,
      markMessagesDeleted: json['mark_messages_deleted'] as bool?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{
      'delete_conversation_channels': instance.deleteConversationChannels,
      'delete_feeds_content': instance.deleteFeedsContent,
      'hard_delete': instance.hardDelete,
      'mark_messages_deleted': instance.markMessagesDeleted,
      'reason': instance.reason,
    };
