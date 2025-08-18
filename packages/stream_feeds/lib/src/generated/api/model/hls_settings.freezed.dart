// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hls_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HLSSettings {
  bool get autoOn;
  bool get enabled;
  LayoutSettings? get layout;
  List<String> get qualityTracks;

  /// Create a copy of HLSSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HLSSettingsCopyWith<HLSSettings> get copyWith =>
      _$HLSSettingsCopyWithImpl<HLSSettings>(this as HLSSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HLSSettings &&
            (identical(other.autoOn, autoOn) || other.autoOn == autoOn) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            const DeepCollectionEquality()
                .equals(other.qualityTracks, qualityTracks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, autoOn, enabled, layout,
      const DeepCollectionEquality().hash(qualityTracks));

  @override
  String toString() {
    return 'HLSSettings(autoOn: $autoOn, enabled: $enabled, layout: $layout, qualityTracks: $qualityTracks)';
  }
}

/// @nodoc
abstract mixin class $HLSSettingsCopyWith<$Res> {
  factory $HLSSettingsCopyWith(
          HLSSettings value, $Res Function(HLSSettings) _then) =
      _$HLSSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool autoOn,
      bool enabled,
      LayoutSettings? layout,
      List<String> qualityTracks});
}

/// @nodoc
class _$HLSSettingsCopyWithImpl<$Res> implements $HLSSettingsCopyWith<$Res> {
  _$HLSSettingsCopyWithImpl(this._self, this._then);

  final HLSSettings _self;
  final $Res Function(HLSSettings) _then;

  /// Create a copy of HLSSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoOn = null,
    Object? enabled = null,
    Object? layout = freezed,
    Object? qualityTracks = null,
  }) {
    return _then(HLSSettings(
      autoOn: null == autoOn
          ? _self.autoOn
          : autoOn // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      layout: freezed == layout
          ? _self.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as LayoutSettings?,
      qualityTracks: null == qualityTracks
          ? _self.qualityTracks
          : qualityTracks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
