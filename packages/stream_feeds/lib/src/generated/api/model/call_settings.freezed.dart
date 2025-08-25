// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallSettings {
  AudioSettings? get audio;
  BackstageSettings? get backstage;
  BroadcastSettings? get broadcasting;
  FrameRecordSettings? get frameRecording;
  GeofenceSettings? get geofencing;
  IngressSettings? get ingress;
  LimitsSettings? get limits;
  RecordSettings? get recording;
  RingSettings? get ring;
  ScreensharingSettings? get screensharing;
  SessionSettings? get session;
  ThumbnailsSettings? get thumbnails;
  TranscriptionSettings? get transcription;
  VideoSettings? get video;

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallSettingsCopyWith<CallSettings> get copyWith =>
      _$CallSettingsCopyWithImpl<CallSettings>(
          this as CallSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallSettings &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.backstage, backstage) ||
                other.backstage == backstage) &&
            (identical(other.broadcasting, broadcasting) ||
                other.broadcasting == broadcasting) &&
            (identical(other.frameRecording, frameRecording) ||
                other.frameRecording == frameRecording) &&
            (identical(other.geofencing, geofencing) ||
                other.geofencing == geofencing) &&
            (identical(other.ingress, ingress) || other.ingress == ingress) &&
            (identical(other.limits, limits) || other.limits == limits) &&
            (identical(other.recording, recording) ||
                other.recording == recording) &&
            (identical(other.ring, ring) || other.ring == ring) &&
            (identical(other.screensharing, screensharing) ||
                other.screensharing == screensharing) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.thumbnails, thumbnails) ||
                other.thumbnails == thumbnails) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      audio,
      backstage,
      broadcasting,
      frameRecording,
      geofencing,
      ingress,
      limits,
      recording,
      ring,
      screensharing,
      session,
      thumbnails,
      transcription,
      video);

  @override
  String toString() {
    return 'CallSettings(audio: $audio, backstage: $backstage, broadcasting: $broadcasting, frameRecording: $frameRecording, geofencing: $geofencing, ingress: $ingress, limits: $limits, recording: $recording, ring: $ring, screensharing: $screensharing, session: $session, thumbnails: $thumbnails, transcription: $transcription, video: $video)';
  }
}

/// @nodoc
abstract mixin class $CallSettingsCopyWith<$Res> {
  factory $CallSettingsCopyWith(
          CallSettings value, $Res Function(CallSettings) _then) =
      _$CallSettingsCopyWithImpl;
  @useResult
  $Res call(
      {AudioSettings? audio,
      BackstageSettings? backstage,
      BroadcastSettings? broadcasting,
      FrameRecordSettings? frameRecording,
      GeofenceSettings? geofencing,
      IngressSettings? ingress,
      LimitsSettings? limits,
      RecordSettings? recording,
      RingSettings? ring,
      ScreensharingSettings? screensharing,
      SessionSettings? session,
      ThumbnailsSettings? thumbnails,
      TranscriptionSettings? transcription,
      VideoSettings? video});
}

/// @nodoc
class _$CallSettingsCopyWithImpl<$Res> implements $CallSettingsCopyWith<$Res> {
  _$CallSettingsCopyWithImpl(this._self, this._then);

  final CallSettings _self;
  final $Res Function(CallSettings) _then;

  /// Create a copy of CallSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = freezed,
    Object? backstage = freezed,
    Object? broadcasting = freezed,
    Object? frameRecording = freezed,
    Object? geofencing = freezed,
    Object? ingress = freezed,
    Object? limits = freezed,
    Object? recording = freezed,
    Object? ring = freezed,
    Object? screensharing = freezed,
    Object? session = freezed,
    Object? thumbnails = freezed,
    Object? transcription = freezed,
    Object? video = freezed,
  }) {
    return _then(CallSettings(
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as AudioSettings?,
      backstage: freezed == backstage
          ? _self.backstage
          : backstage // ignore: cast_nullable_to_non_nullable
              as BackstageSettings?,
      broadcasting: freezed == broadcasting
          ? _self.broadcasting
          : broadcasting // ignore: cast_nullable_to_non_nullable
              as BroadcastSettings?,
      frameRecording: freezed == frameRecording
          ? _self.frameRecording
          : frameRecording // ignore: cast_nullable_to_non_nullable
              as FrameRecordSettings?,
      geofencing: freezed == geofencing
          ? _self.geofencing
          : geofencing // ignore: cast_nullable_to_non_nullable
              as GeofenceSettings?,
      ingress: freezed == ingress
          ? _self.ingress
          : ingress // ignore: cast_nullable_to_non_nullable
              as IngressSettings?,
      limits: freezed == limits
          ? _self.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as LimitsSettings?,
      recording: freezed == recording
          ? _self.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as RecordSettings?,
      ring: freezed == ring
          ? _self.ring
          : ring // ignore: cast_nullable_to_non_nullable
              as RingSettings?,
      screensharing: freezed == screensharing
          ? _self.screensharing
          : screensharing // ignore: cast_nullable_to_non_nullable
              as ScreensharingSettings?,
      session: freezed == session
          ? _self.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionSettings?,
      thumbnails: freezed == thumbnails
          ? _self.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as ThumbnailsSettings?,
      transcription: freezed == transcription
          ? _self.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as TranscriptionSettings?,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoSettings?,
    ));
  }
}

// dart format on
