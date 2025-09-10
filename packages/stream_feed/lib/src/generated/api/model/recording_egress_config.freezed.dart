// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_egress_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordingEgressConfig {
  bool? get audioOnly;
  CompositeAppSettings? get compositeAppSettings;
  ExternalStorage? get externalStorage;
  Quality? get quality;
  String? get storageName;
  VideoOrientation? get videoOrientationHint;

  /// Create a copy of RecordingEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecordingEgressConfigCopyWith<RecordingEgressConfig> get copyWith =>
      _$RecordingEgressConfigCopyWithImpl<RecordingEgressConfig>(
          this as RecordingEgressConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecordingEgressConfig &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.compositeAppSettings, compositeAppSettings) ||
                other.compositeAppSettings == compositeAppSettings) &&
            (identical(other.externalStorage, externalStorage) ||
                other.externalStorage == externalStorage) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName) &&
            (identical(other.videoOrientationHint, videoOrientationHint) ||
                other.videoOrientationHint == videoOrientationHint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioOnly, compositeAppSettings,
      externalStorage, quality, storageName, videoOrientationHint);

  @override
  String toString() {
    return 'RecordingEgressConfig(audioOnly: $audioOnly, compositeAppSettings: $compositeAppSettings, externalStorage: $externalStorage, quality: $quality, storageName: $storageName, videoOrientationHint: $videoOrientationHint)';
  }
}

/// @nodoc
abstract mixin class $RecordingEgressConfigCopyWith<$Res> {
  factory $RecordingEgressConfigCopyWith(RecordingEgressConfig value,
          $Res Function(RecordingEgressConfig) _then) =
      _$RecordingEgressConfigCopyWithImpl;
  @useResult
  $Res call(
      {bool? audioOnly,
      CompositeAppSettings? compositeAppSettings,
      ExternalStorage? externalStorage,
      Quality? quality,
      String? storageName,
      VideoOrientation? videoOrientationHint});
}

/// @nodoc
class _$RecordingEgressConfigCopyWithImpl<$Res>
    implements $RecordingEgressConfigCopyWith<$Res> {
  _$RecordingEgressConfigCopyWithImpl(this._self, this._then);

  final RecordingEgressConfig _self;
  final $Res Function(RecordingEgressConfig) _then;

  /// Create a copy of RecordingEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = freezed,
    Object? compositeAppSettings = freezed,
    Object? externalStorage = freezed,
    Object? quality = freezed,
    Object? storageName = freezed,
    Object? videoOrientationHint = freezed,
  }) {
    return _then(RecordingEgressConfig(
      audioOnly: freezed == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      compositeAppSettings: freezed == compositeAppSettings
          ? _self.compositeAppSettings
          : compositeAppSettings // ignore: cast_nullable_to_non_nullable
              as CompositeAppSettings?,
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
      videoOrientationHint: freezed == videoOrientationHint
          ? _self.videoOrientationHint
          : videoOrientationHint // ignore: cast_nullable_to_non_nullable
              as VideoOrientation?,
    ));
  }
}

// dart format on
