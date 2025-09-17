// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egress_task_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EgressTaskConfig {
  EgressUser? get egressUser;
  FrameRecordingEgressConfig? get frameRecordingEgressConfig;
  HLSEgressConfig? get hlsEgressConfig;
  RecordingEgressConfig? get recordingEgressConfig;
  RTMPEgressConfig? get rtmpEgressConfig;
  STTEgressConfig? get sttEgressConfig;

  /// Create a copy of EgressTaskConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EgressTaskConfigCopyWith<EgressTaskConfig> get copyWith =>
      _$EgressTaskConfigCopyWithImpl<EgressTaskConfig>(
          this as EgressTaskConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EgressTaskConfig &&
            (identical(other.egressUser, egressUser) ||
                other.egressUser == egressUser) &&
            (identical(other.frameRecordingEgressConfig,
                    frameRecordingEgressConfig) ||
                other.frameRecordingEgressConfig ==
                    frameRecordingEgressConfig) &&
            (identical(other.hlsEgressConfig, hlsEgressConfig) ||
                other.hlsEgressConfig == hlsEgressConfig) &&
            (identical(other.recordingEgressConfig, recordingEgressConfig) ||
                other.recordingEgressConfig == recordingEgressConfig) &&
            (identical(other.rtmpEgressConfig, rtmpEgressConfig) ||
                other.rtmpEgressConfig == rtmpEgressConfig) &&
            (identical(other.sttEgressConfig, sttEgressConfig) ||
                other.sttEgressConfig == sttEgressConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      egressUser,
      frameRecordingEgressConfig,
      hlsEgressConfig,
      recordingEgressConfig,
      rtmpEgressConfig,
      sttEgressConfig);

  @override
  String toString() {
    return 'EgressTaskConfig(egressUser: $egressUser, frameRecordingEgressConfig: $frameRecordingEgressConfig, hlsEgressConfig: $hlsEgressConfig, recordingEgressConfig: $recordingEgressConfig, rtmpEgressConfig: $rtmpEgressConfig, sttEgressConfig: $sttEgressConfig)';
  }
}

/// @nodoc
abstract mixin class $EgressTaskConfigCopyWith<$Res> {
  factory $EgressTaskConfigCopyWith(
          EgressTaskConfig value, $Res Function(EgressTaskConfig) _then) =
      _$EgressTaskConfigCopyWithImpl;
  @useResult
  $Res call(
      {EgressUser? egressUser,
      FrameRecordingEgressConfig? frameRecordingEgressConfig,
      HLSEgressConfig? hlsEgressConfig,
      RecordingEgressConfig? recordingEgressConfig,
      RTMPEgressConfig? rtmpEgressConfig,
      STTEgressConfig? sttEgressConfig});
}

/// @nodoc
class _$EgressTaskConfigCopyWithImpl<$Res>
    implements $EgressTaskConfigCopyWith<$Res> {
  _$EgressTaskConfigCopyWithImpl(this._self, this._then);

  final EgressTaskConfig _self;
  final $Res Function(EgressTaskConfig) _then;

  /// Create a copy of EgressTaskConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? egressUser = freezed,
    Object? frameRecordingEgressConfig = freezed,
    Object? hlsEgressConfig = freezed,
    Object? recordingEgressConfig = freezed,
    Object? rtmpEgressConfig = freezed,
    Object? sttEgressConfig = freezed,
  }) {
    return _then(EgressTaskConfig(
      egressUser: freezed == egressUser
          ? _self.egressUser
          : egressUser // ignore: cast_nullable_to_non_nullable
              as EgressUser?,
      frameRecordingEgressConfig: freezed == frameRecordingEgressConfig
          ? _self.frameRecordingEgressConfig
          : frameRecordingEgressConfig // ignore: cast_nullable_to_non_nullable
              as FrameRecordingEgressConfig?,
      hlsEgressConfig: freezed == hlsEgressConfig
          ? _self.hlsEgressConfig
          : hlsEgressConfig // ignore: cast_nullable_to_non_nullable
              as HLSEgressConfig?,
      recordingEgressConfig: freezed == recordingEgressConfig
          ? _self.recordingEgressConfig
          : recordingEgressConfig // ignore: cast_nullable_to_non_nullable
              as RecordingEgressConfig?,
      rtmpEgressConfig: freezed == rtmpEgressConfig
          ? _self.rtmpEgressConfig
          : rtmpEgressConfig // ignore: cast_nullable_to_non_nullable
              as RTMPEgressConfig?,
      sttEgressConfig: freezed == sttEgressConfig
          ? _self.sttEgressConfig
          : sttEgressConfig // ignore: cast_nullable_to_non_nullable
              as STTEgressConfig?,
    ));
  }
}

// dart format on
