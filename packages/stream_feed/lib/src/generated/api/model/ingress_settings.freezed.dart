// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingress_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngressSettings {
  IngressAudioEncodingOptions? get audioEncodingOptions;
  bool get enabled;
  Map<String, IngressVideoEncodingOptions>? get videoEncodingOptions;

  /// Create a copy of IngressSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngressSettingsCopyWith<IngressSettings> get copyWith =>
      _$IngressSettingsCopyWithImpl<IngressSettings>(
          this as IngressSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngressSettings &&
            (identical(other.audioEncodingOptions, audioEncodingOptions) ||
                other.audioEncodingOptions == audioEncodingOptions) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            const DeepCollectionEquality()
                .equals(other.videoEncodingOptions, videoEncodingOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioEncodingOptions, enabled,
      const DeepCollectionEquality().hash(videoEncodingOptions));

  @override
  String toString() {
    return 'IngressSettings(audioEncodingOptions: $audioEncodingOptions, enabled: $enabled, videoEncodingOptions: $videoEncodingOptions)';
  }
}

/// @nodoc
abstract mixin class $IngressSettingsCopyWith<$Res> {
  factory $IngressSettingsCopyWith(
          IngressSettings value, $Res Function(IngressSettings) _then) =
      _$IngressSettingsCopyWithImpl;
  @useResult
  $Res call(
      {IngressAudioEncodingOptions? audioEncodingOptions,
      bool enabled,
      Map<String, IngressVideoEncodingOptions>? videoEncodingOptions});
}

/// @nodoc
class _$IngressSettingsCopyWithImpl<$Res>
    implements $IngressSettingsCopyWith<$Res> {
  _$IngressSettingsCopyWithImpl(this._self, this._then);

  final IngressSettings _self;
  final $Res Function(IngressSettings) _then;

  /// Create a copy of IngressSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioEncodingOptions = freezed,
    Object? enabled = null,
    Object? videoEncodingOptions = freezed,
  }) {
    return _then(IngressSettings(
      audioEncodingOptions: freezed == audioEncodingOptions
          ? _self.audioEncodingOptions
          : audioEncodingOptions // ignore: cast_nullable_to_non_nullable
              as IngressAudioEncodingOptions?,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      videoEncodingOptions: freezed == videoEncodingOptions
          ? _self.videoEncodingOptions
          : videoEncodingOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, IngressVideoEncodingOptions>?,
    ));
  }
}

// dart format on
