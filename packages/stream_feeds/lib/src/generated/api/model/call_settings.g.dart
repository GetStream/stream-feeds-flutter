// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallSettings _$CallSettingsFromJson(Map<String, dynamic> json) => CallSettings(
      audio: json['audio'] == null
          ? null
          : AudioSettings.fromJson(json['audio'] as Map<String, dynamic>),
      backstage: json['backstage'] == null
          ? null
          : BackstageSettings.fromJson(
              json['backstage'] as Map<String, dynamic>),
      broadcasting: json['broadcasting'] == null
          ? null
          : BroadcastSettings.fromJson(
              json['broadcasting'] as Map<String, dynamic>),
      frameRecording: json['frame_recording'] == null
          ? null
          : FrameRecordSettings.fromJson(
              json['frame_recording'] as Map<String, dynamic>),
      geofencing: json['geofencing'] == null
          ? null
          : GeofenceSettings.fromJson(
              json['geofencing'] as Map<String, dynamic>),
      ingress: json['ingress'] == null
          ? null
          : IngressSettings.fromJson(json['ingress'] as Map<String, dynamic>),
      limits: json['limits'] == null
          ? null
          : LimitsSettings.fromJson(json['limits'] as Map<String, dynamic>),
      recording: json['recording'] == null
          ? null
          : RecordSettings.fromJson(json['recording'] as Map<String, dynamic>),
      ring: json['ring'] == null
          ? null
          : RingSettings.fromJson(json['ring'] as Map<String, dynamic>),
      screensharing: json['screensharing'] == null
          ? null
          : ScreensharingSettings.fromJson(
              json['screensharing'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : SessionSettings.fromJson(json['session'] as Map<String, dynamic>),
      thumbnails: json['thumbnails'] == null
          ? null
          : ThumbnailsSettings.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      transcription: json['transcription'] == null
          ? null
          : TranscriptionSettings.fromJson(
              json['transcription'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : VideoSettings.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallSettingsToJson(CallSettings instance) =>
    <String, dynamic>{
      'audio': instance.audio?.toJson(),
      'backstage': instance.backstage?.toJson(),
      'broadcasting': instance.broadcasting?.toJson(),
      'frame_recording': instance.frameRecording?.toJson(),
      'geofencing': instance.geofencing?.toJson(),
      'ingress': instance.ingress?.toJson(),
      'limits': instance.limits?.toJson(),
      'recording': instance.recording?.toJson(),
      'ring': instance.ring?.toJson(),
      'screensharing': instance.screensharing?.toJson(),
      'session': instance.session?.toJson(),
      'thumbnails': instance.thumbnails?.toJson(),
      'transcription': instance.transcription?.toJson(),
      'video': instance.video?.toJson(),
    };
