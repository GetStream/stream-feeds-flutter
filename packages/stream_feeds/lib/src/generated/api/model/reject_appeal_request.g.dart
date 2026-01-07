// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_appeal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectAppealRequest _$RejectAppealRequestFromJson(Map<String, dynamic> json) =>
    RejectAppealRequest(
      decisionReason: json['decision_reason'] as String,
    );

Map<String, dynamic> _$RejectAppealRequestToJson(
        RejectAppealRequest instance) =>
    <String, dynamic>{
      'decision_reason': instance.decisionReason,
    };
