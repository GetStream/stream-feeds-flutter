// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_recording_egress_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrameRecordingEgressConfig {
  int? get captureIntervalInSeconds;
  ExternalStorage? get externalStorage;
  Quality? get quality;
  String? get storageName;

  /// Create a copy of FrameRecordingEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FrameRecordingEgressConfigCopyWith<FrameRecordingEgressConfig>
      get copyWith =>
          _$FrameRecordingEgressConfigCopyWithImpl<FrameRecordingEgressConfig>(
              this as FrameRecordingEgressConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FrameRecordingEgressConfig &&
            (identical(
                    other.captureIntervalInSeconds, captureIntervalInSeconds) ||
                other.captureIntervalInSeconds == captureIntervalInSeconds) &&
            (identical(other.externalStorage, externalStorage) ||
                other.externalStorage == externalStorage) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, captureIntervalInSeconds,
      externalStorage, quality, storageName);

  @override
  String toString() {
    return 'FrameRecordingEgressConfig(captureIntervalInSeconds: $captureIntervalInSeconds, externalStorage: $externalStorage, quality: $quality, storageName: $storageName)';
  }
}

/// @nodoc
abstract mixin class $FrameRecordingEgressConfigCopyWith<$Res> {
  factory $FrameRecordingEgressConfigCopyWith(FrameRecordingEgressConfig value,
          $Res Function(FrameRecordingEgressConfig) _then) =
      _$FrameRecordingEgressConfigCopyWithImpl;
  @useResult
  $Res call(
      {int? captureIntervalInSeconds,
      ExternalStorage? externalStorage,
      Quality? quality,
      String? storageName});
}

/// @nodoc
class _$FrameRecordingEgressConfigCopyWithImpl<$Res>
    implements $FrameRecordingEgressConfigCopyWith<$Res> {
  _$FrameRecordingEgressConfigCopyWithImpl(this._self, this._then);

  final FrameRecordingEgressConfig _self;
  final $Res Function(FrameRecordingEgressConfig) _then;

  /// Create a copy of FrameRecordingEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captureIntervalInSeconds = freezed,
    Object? externalStorage = freezed,
    Object? quality = freezed,
    Object? storageName = freezed,
  }) {
    return _then(FrameRecordingEgressConfig(
      captureIntervalInSeconds: freezed == captureIntervalInSeconds
          ? _self.captureIntervalInSeconds
          : captureIntervalInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      externalStorage: freezed == externalStorage
          ? _self.externalStorage
          : externalStorage // ignore: cast_nullable_to_non_nullable
              as ExternalStorage?,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as Quality?,
      storageName: freezed == storageName
          ? _self.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
