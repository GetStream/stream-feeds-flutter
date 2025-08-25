// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtmp_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RTMPSettings {
  bool get enabled;
  LayoutSettings? get layout;
  RTMPLocation? get location;
  String? get qualityName;

  /// Create a copy of RTMPSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RTMPSettingsCopyWith<RTMPSettings> get copyWith =>
      _$RTMPSettingsCopyWithImpl<RTMPSettings>(
          this as RTMPSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RTMPSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.qualityName, qualityName) ||
                other.qualityName == qualityName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, enabled, layout, location, qualityName);

  @override
  String toString() {
    return 'RTMPSettings(enabled: $enabled, layout: $layout, location: $location, qualityName: $qualityName)';
  }
}

/// @nodoc
abstract mixin class $RTMPSettingsCopyWith<$Res> {
  factory $RTMPSettingsCopyWith(
          RTMPSettings value, $Res Function(RTMPSettings) _then) =
      _$RTMPSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool enabled,
      LayoutSettings? layout,
      RTMPLocation? location,
      String? qualityName});
}

/// @nodoc
class _$RTMPSettingsCopyWithImpl<$Res> implements $RTMPSettingsCopyWith<$Res> {
  _$RTMPSettingsCopyWithImpl(this._self, this._then);

  final RTMPSettings _self;
  final $Res Function(RTMPSettings) _then;

  /// Create a copy of RTMPSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? layout = freezed,
    Object? location = freezed,
    Object? qualityName = freezed,
  }) {
    return _then(RTMPSettings(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      layout: freezed == layout
          ? _self.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as LayoutSettings?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as RTMPLocation?,
      qualityName: freezed == qualityName
          ? _self.qualityName
          : qualityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
