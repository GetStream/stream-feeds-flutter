// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtmp_egress_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RTMPEgressConfig {
  CompositeAppSettings? get compositeAppSettings;
  Quality? get quality;
  String? get rtmpLocation;

  /// Create a copy of RTMPEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RTMPEgressConfigCopyWith<RTMPEgressConfig> get copyWith =>
      _$RTMPEgressConfigCopyWithImpl<RTMPEgressConfig>(
          this as RTMPEgressConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RTMPEgressConfig &&
            (identical(other.compositeAppSettings, compositeAppSettings) ||
                other.compositeAppSettings == compositeAppSettings) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.rtmpLocation, rtmpLocation) ||
                other.rtmpLocation == rtmpLocation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, compositeAppSettings, quality, rtmpLocation);

  @override
  String toString() {
    return 'RTMPEgressConfig(compositeAppSettings: $compositeAppSettings, quality: $quality, rtmpLocation: $rtmpLocation)';
  }
}

/// @nodoc
abstract mixin class $RTMPEgressConfigCopyWith<$Res> {
  factory $RTMPEgressConfigCopyWith(
          RTMPEgressConfig value, $Res Function(RTMPEgressConfig) _then) =
      _$RTMPEgressConfigCopyWithImpl;
  @useResult
  $Res call(
      {CompositeAppSettings? compositeAppSettings,
      Quality? quality,
      String? rtmpLocation});
}

/// @nodoc
class _$RTMPEgressConfigCopyWithImpl<$Res>
    implements $RTMPEgressConfigCopyWith<$Res> {
  _$RTMPEgressConfigCopyWithImpl(this._self, this._then);

  final RTMPEgressConfig _self;
  final $Res Function(RTMPEgressConfig) _then;

  /// Create a copy of RTMPEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compositeAppSettings = freezed,
    Object? quality = freezed,
    Object? rtmpLocation = freezed,
  }) {
    return _then(RTMPEgressConfig(
      compositeAppSettings: freezed == compositeAppSettings
          ? _self.compositeAppSettings
          : compositeAppSettings // ignore: cast_nullable_to_non_nullable
              as CompositeAppSettings?,
      quality: freezed == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as Quality?,
      rtmpLocation: freezed == rtmpLocation
          ? _self.rtmpLocation
          : rtmpLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
