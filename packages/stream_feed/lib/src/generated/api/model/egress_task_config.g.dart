// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egress_task_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EgressTaskConfig _$EgressTaskConfigFromJson(Map<String, dynamic> json) =>
    EgressTaskConfig(
      egressUser: json['egress_user'] == null
          ? null
          : EgressUser.fromJson(json['egress_user'] as Map<String, dynamic>),
      frameRecordingEgressConfig: json['frame_recording_egress_config'] == null
          ? null
          : FrameRecordingEgressConfig.fromJson(
              json['frame_recording_egress_config'] as Map<String, dynamic>),
      hlsEgressConfig: json['hls_egress_config'] == null
          ? null
          : HLSEgressConfig.fromJson(
              json['hls_egress_config'] as Map<String, dynamic>),
      recordingEgressConfig: json['recording_egress_config'] == null
          ? null
          : RecordingEgressConfig.fromJson(
              json['recording_egress_config'] as Map<String, dynamic>),
      rtmpEgressConfig: json['rtmp_egress_config'] == null
          ? null
          : RTMPEgressConfig.fromJson(
              json['rtmp_egress_config'] as Map<String, dynamic>),
      sttEgressConfig: json['stt_egress_config'] == null
          ? null
          : STTEgressConfig.fromJson(
              json['stt_egress_config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EgressTaskConfigToJson(EgressTaskConfig instance) =>
    <String, dynamic>{
      'egress_user': instance.egressUser?.toJson(),
      'frame_recording_egress_config':
          instance.frameRecordingEgressConfig?.toJson(),
      'hls_egress_config': instance.hlsEgressConfig?.toJson(),
      'recording_egress_config': instance.recordingEgressConfig?.toJson(),
      'rtmp_egress_config': instance.rtmpEgressConfig?.toJson(),
      'stt_egress_config': instance.sttEgressConfig?.toJson(),
    };
