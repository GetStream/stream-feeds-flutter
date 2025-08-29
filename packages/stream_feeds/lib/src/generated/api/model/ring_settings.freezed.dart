// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ring_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RingSettings {
  int get autoCancelTimeoutMs;
  int get incomingCallTimeoutMs;
  int get missedCallTimeoutMs;

  /// Create a copy of RingSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RingSettingsCopyWith<RingSettings> get copyWith =>
      _$RingSettingsCopyWithImpl<RingSettings>(
          this as RingSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RingSettings &&
            (identical(other.autoCancelTimeoutMs, autoCancelTimeoutMs) ||
                other.autoCancelTimeoutMs == autoCancelTimeoutMs) &&
            (identical(other.incomingCallTimeoutMs, incomingCallTimeoutMs) ||
                other.incomingCallTimeoutMs == incomingCallTimeoutMs) &&
            (identical(other.missedCallTimeoutMs, missedCallTimeoutMs) ||
                other.missedCallTimeoutMs == missedCallTimeoutMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, autoCancelTimeoutMs,
      incomingCallTimeoutMs, missedCallTimeoutMs);

  @override
  String toString() {
    return 'RingSettings(autoCancelTimeoutMs: $autoCancelTimeoutMs, incomingCallTimeoutMs: $incomingCallTimeoutMs, missedCallTimeoutMs: $missedCallTimeoutMs)';
  }
}

/// @nodoc
abstract mixin class $RingSettingsCopyWith<$Res> {
  factory $RingSettingsCopyWith(
          RingSettings value, $Res Function(RingSettings) _then) =
      _$RingSettingsCopyWithImpl;
  @useResult
  $Res call(
      {int autoCancelTimeoutMs,
      int incomingCallTimeoutMs,
      int missedCallTimeoutMs});
}

/// @nodoc
class _$RingSettingsCopyWithImpl<$Res> implements $RingSettingsCopyWith<$Res> {
  _$RingSettingsCopyWithImpl(this._self, this._then);

  final RingSettings _self;
  final $Res Function(RingSettings) _then;

  /// Create a copy of RingSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoCancelTimeoutMs = null,
    Object? incomingCallTimeoutMs = null,
    Object? missedCallTimeoutMs = null,
  }) {
    return _then(RingSettings(
      autoCancelTimeoutMs: null == autoCancelTimeoutMs
          ? _self.autoCancelTimeoutMs
          : autoCancelTimeoutMs // ignore: cast_nullable_to_non_nullable
              as int,
      incomingCallTimeoutMs: null == incomingCallTimeoutMs
          ? _self.incomingCallTimeoutMs
          : incomingCallTimeoutMs // ignore: cast_nullable_to_non_nullable
              as int,
      missedCallTimeoutMs: null == missedCallTimeoutMs
          ? _self.missedCallTimeoutMs
          : missedCallTimeoutMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
