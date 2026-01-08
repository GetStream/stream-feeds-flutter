// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unban_action_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnbanActionRequest _$UnbanActionRequestFromJson(Map<String, dynamic> json) =>
    UnbanActionRequest(
      decisionReason: json['decision_reason'] as String?,
    );

Map<String, dynamic> _$UnbanActionRequestToJson(UnbanActionRequest instance) =>
    <String, dynamic>{
      'decision_reason': instance.decisionReason,
    };
