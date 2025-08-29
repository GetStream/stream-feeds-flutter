// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hls_egress_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HLSEgressConfig {
  CompositeAppSettings? get compositeAppSettings;
  String? get playlistUrl;
  List<Quality>? get qualities;
  int? get startUnixNano;

  /// Create a copy of HLSEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HLSEgressConfigCopyWith<HLSEgressConfig> get copyWith =>
      _$HLSEgressConfigCopyWithImpl<HLSEgressConfig>(
          this as HLSEgressConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HLSEgressConfig &&
            (identical(other.compositeAppSettings, compositeAppSettings) ||
                other.compositeAppSettings == compositeAppSettings) &&
            (identical(other.playlistUrl, playlistUrl) ||
                other.playlistUrl == playlistUrl) &&
            const DeepCollectionEquality().equals(other.qualities, qualities) &&
            (identical(other.startUnixNano, startUnixNano) ||
                other.startUnixNano == startUnixNano));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      compositeAppSettings,
      playlistUrl,
      const DeepCollectionEquality().hash(qualities),
      startUnixNano);

  @override
  String toString() {
    return 'HLSEgressConfig(compositeAppSettings: $compositeAppSettings, playlistUrl: $playlistUrl, qualities: $qualities, startUnixNano: $startUnixNano)';
  }
}

/// @nodoc
abstract mixin class $HLSEgressConfigCopyWith<$Res> {
  factory $HLSEgressConfigCopyWith(
          HLSEgressConfig value, $Res Function(HLSEgressConfig) _then) =
      _$HLSEgressConfigCopyWithImpl;
  @useResult
  $Res call(
      {CompositeAppSettings? compositeAppSettings,
      String? playlistUrl,
      List<Quality>? qualities,
      int? startUnixNano});
}

/// @nodoc
class _$HLSEgressConfigCopyWithImpl<$Res>
    implements $HLSEgressConfigCopyWith<$Res> {
  _$HLSEgressConfigCopyWithImpl(this._self, this._then);

  final HLSEgressConfig _self;
  final $Res Function(HLSEgressConfig) _then;

  /// Create a copy of HLSEgressConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compositeAppSettings = freezed,
    Object? playlistUrl = freezed,
    Object? qualities = freezed,
    Object? startUnixNano = freezed,
  }) {
    return _then(HLSEgressConfig(
      compositeAppSettings: freezed == compositeAppSettings
          ? _self.compositeAppSettings
          : compositeAppSettings // ignore: cast_nullable_to_non_nullable
              as CompositeAppSettings?,
      playlistUrl: freezed == playlistUrl
          ? _self.playlistUrl
          : playlistUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qualities: freezed == qualities
          ? _self.qualities
          : qualities // ignore: cast_nullable_to_non_nullable
              as List<Quality>?,
      startUnixNano: freezed == startUnixNano
          ? _self.startUnixNano
          : startUnixNano // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
