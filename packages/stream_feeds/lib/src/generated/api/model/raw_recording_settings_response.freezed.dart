// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_recording_settings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RawRecordingSettingsResponse {
  RawRecordingSettingsResponseMode get mode;

  /// Create a copy of RawRecordingSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RawRecordingSettingsResponseCopyWith<RawRecordingSettingsResponse>
      get copyWith => _$RawRecordingSettingsResponseCopyWithImpl<
              RawRecordingSettingsResponse>(
          this as RawRecordingSettingsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RawRecordingSettingsResponse &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @override
  String toString() {
    return 'RawRecordingSettingsResponse(mode: $mode)';
  }
}

/// @nodoc
abstract mixin class $RawRecordingSettingsResponseCopyWith<$Res> {
  factory $RawRecordingSettingsResponseCopyWith(
          RawRecordingSettingsResponse value,
          $Res Function(RawRecordingSettingsResponse) _then) =
      _$RawRecordingSettingsResponseCopyWithImpl;
  @useResult
  $Res call({RawRecordingSettingsResponseMode mode});
}

/// @nodoc
class _$RawRecordingSettingsResponseCopyWithImpl<$Res>
    implements $RawRecordingSettingsResponseCopyWith<$Res> {
  _$RawRecordingSettingsResponseCopyWithImpl(this._self, this._then);

  final RawRecordingSettingsResponse _self;
  final $Res Function(RawRecordingSettingsResponse) _then;

  /// Create a copy of RawRecordingSettingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(RawRecordingSettingsResponse(
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as RawRecordingSettingsResponseMode,
    ));
  }
}

// dart format on
