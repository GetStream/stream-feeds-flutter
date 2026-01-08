// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_action_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreActionRequest _$RestoreActionRequestFromJson(
        Map<String, dynamic> json) =>
    RestoreActionRequest(
      decisionReason: json['decision_reason'] as String?,
    );

Map<String, dynamic> _$RestoreActionRequestToJson(
        RestoreActionRequest instance) =>
    <String, dynamic>{
      'decision_reason': instance.decisionReason,
    };
