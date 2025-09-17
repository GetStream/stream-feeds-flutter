// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BroadcastSettings {
  bool get enabled;
  HLSSettings? get hls;
  RTMPSettings? get rtmp;

  /// Create a copy of BroadcastSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BroadcastSettingsCopyWith<BroadcastSettings> get copyWith =>
      _$BroadcastSettingsCopyWithImpl<BroadcastSettings>(
          this as BroadcastSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BroadcastSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.hls, hls) || other.hls == hls) &&
            (identical(other.rtmp, rtmp) || other.rtmp == rtmp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, hls, rtmp);

  @override
  String toString() {
    return 'BroadcastSettings(enabled: $enabled, hls: $hls, rtmp: $rtmp)';
  }
}

/// @nodoc
abstract mixin class $BroadcastSettingsCopyWith<$Res> {
  factory $BroadcastSettingsCopyWith(
          BroadcastSettings value, $Res Function(BroadcastSettings) _then) =
      _$BroadcastSettingsCopyWithImpl;
  @useResult
  $Res call({bool enabled, HLSSettings? hls, RTMPSettings? rtmp});
}

/// @nodoc
class _$BroadcastSettingsCopyWithImpl<$Res>
    implements $BroadcastSettingsCopyWith<$Res> {
  _$BroadcastSettingsCopyWithImpl(this._self, this._then);

  final BroadcastSettings _self;
  final $Res Function(BroadcastSettings) _then;

  /// Create a copy of BroadcastSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? hls = freezed,
    Object? rtmp = freezed,
  }) {
    return _then(BroadcastSettings(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hls: freezed == hls
          ? _self.hls
          : hls // ignore: cast_nullable_to_non_nullable
              as HLSSettings?,
      rtmp: freezed == rtmp
          ? _self.rtmp
          : rtmp // ignore: cast_nullable_to_non_nullable
              as RTMPSettings?,
    ));
  }
}

// dart format on
