// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unblock_action_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnblockActionRequest _$UnblockActionRequestFromJson(
        Map<String, dynamic> json) =>
    UnblockActionRequest(
      decisionReason: json['decision_reason'] as String?,
    );

Map<String, dynamic> _$UnblockActionRequestToJson(
        UnblockActionRequest instance) =>
    <String, dynamic>{
      'decision_reason': instance.decisionReason,
    };
