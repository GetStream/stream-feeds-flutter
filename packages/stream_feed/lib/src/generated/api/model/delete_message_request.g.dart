// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMessageRequest _$DeleteMessageRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteMessageRequest(
      hardDelete: json['hard_delete'] as bool?,
    );

Map<String, dynamic> _$DeleteMessageRequestToJson(
        DeleteMessageRequest instance) =>
    <String, dynamic>{
      'hard_delete': instance.hardDelete,
    };
