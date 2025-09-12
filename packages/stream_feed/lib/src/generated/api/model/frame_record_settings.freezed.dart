// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_record_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrameRecordSettings {
  int get captureIntervalInSeconds;
  FrameRecordSettingsMode get mode;
  String? get quality;

  /// Create a copy of FrameRecordSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FrameRecordSettingsCopyWith<FrameRecordSettings> get copyWith =>
      _$FrameRecordSettingsCopyWithImpl<FrameRecordSettings>(
          this as FrameRecordSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FrameRecordSettings &&
            (identical(
                    other.captureIntervalInSeconds, captureIntervalInSeconds) ||
                other.captureIntervalInSeconds == captureIntervalInSeconds) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, captureIntervalInSeconds, mode, quality);

  @override
  String toString() {
    return 'FrameRecordSettings(captureIntervalInSeconds: $captureIntervalInSeconds, mode: $mode, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $FrameRecordSettingsCopyWith<$Res> {
  factory $FrameRecordSettingsCopyWith(
          FrameRecordSettings value, $Res Function(FrameRecordSettings) _then) =
      _$FrameRecordSettingsCopyWithImpl;
  @useResult
  $Res call(
      {int captureIntervalInSeconds,
      FrameRecordSettingsMode mode,
      String? quality});
}

/// @nodoc
class _$FrameRecordSettingsCopyWithImpl<$Res>
    implements $FrameRecordSettingsCopyWith<$Res> {
  _$FrameRecordSettingsCopyWithImpl(this._self, this._then);

  final FrameRecordSettings _self;
  final $Res Function(FrameRecordSettings) _then;

  /// Create a copy of FrameRecordSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captureIntervalInSeconds = null,
    Object? mode = null,
    Object? quality = freezed,
  }) {
    return _then(FrameRecordSettings(
      captureIntervalInSeconds: null == captureIntervalInSeconds
          ? _self.captureIntervalInSeconds
          : captureIntervalInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as FrameRecordSettingsMode,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
