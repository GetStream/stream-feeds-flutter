// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_reaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteReactionRequest _$DeleteReactionRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteReactionRequest(
      hardDelete: json['hard_delete'] as bool?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DeleteReactionRequestToJson(
        DeleteReactionRequest instance) =>
    <String, dynamic>{
      'hard_delete': instance.hardDelete,
      'reason': instance.reason,
    };
