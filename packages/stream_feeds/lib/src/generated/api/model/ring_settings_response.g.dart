// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ring_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RingSettingsResponse _$RingSettingsResponseFromJson(
        Map<String, dynamic> json) =>
    RingSettingsResponse(
      autoCancelTimeoutMs: (json['auto_cancel_timeout_ms'] as num).toInt(),
      incomingCallTimeoutMs: (json['incoming_call_timeout_ms'] as num).toInt(),
      missedCallTimeoutMs: (json['missed_call_timeout_ms'] as num).toInt(),
    );

Map<String, dynamic> _$RingSettingsResponseToJson(
        RingSettingsResponse instance) =>
    <String, dynamic>{
      'auto_cancel_timeout_ms': instance.autoCancelTimeoutMs,
      'incoming_call_timeout_ms': instance.incomingCallTimeoutMs,
      'missed_call_timeout_ms': instance.missedCallTimeoutMs,
    };
