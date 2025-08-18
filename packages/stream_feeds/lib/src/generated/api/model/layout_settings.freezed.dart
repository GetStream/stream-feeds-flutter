// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layout_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LayoutSettings {
  bool? get detectOrientation;
  String get externalAppUrl;
  String get externalCssUrl;
  LayoutSettingsName get name;
  Map<String, Object>? get options;

  /// Create a copy of LayoutSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LayoutSettingsCopyWith<LayoutSettings> get copyWith =>
      _$LayoutSettingsCopyWithImpl<LayoutSettings>(
          this as LayoutSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LayoutSettings &&
            (identical(other.detectOrientation, detectOrientation) ||
                other.detectOrientation == detectOrientation) &&
            (identical(other.externalAppUrl, externalAppUrl) ||
                other.externalAppUrl == externalAppUrl) &&
            (identical(other.externalCssUrl, externalCssUrl) ||
                other.externalCssUrl == externalCssUrl) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      detectOrientation,
      externalAppUrl,
      externalCssUrl,
      name,
      const DeepCollectionEquality().hash(options));

  @override
  String toString() {
    return 'LayoutSettings(detectOrientation: $detectOrientation, externalAppUrl: $externalAppUrl, externalCssUrl: $externalCssUrl, name: $name, options: $options)';
  }
}

/// @nodoc
abstract mixin class $LayoutSettingsCopyWith<$Res> {
  factory $LayoutSettingsCopyWith(
          LayoutSettings value, $Res Function(LayoutSettings) _then) =
      _$LayoutSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool? detectOrientation,
      String externalAppUrl,
      String externalCssUrl,
      LayoutSettingsName name,
      Map<String, Object>? options});
}

/// @nodoc
class _$LayoutSettingsCopyWithImpl<$Res>
    implements $LayoutSettingsCopyWith<$Res> {
  _$LayoutSettingsCopyWithImpl(this._self, this._then);

  final LayoutSettings _self;
  final $Res Function(LayoutSettings) _then;

  /// Create a copy of LayoutSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectOrientation = freezed,
    Object? externalAppUrl = null,
    Object? externalCssUrl = null,
    Object? name = null,
    Object? options = freezed,
  }) {
    return _then(LayoutSettings(
      detectOrientation: freezed == detectOrientation
          ? _self.detectOrientation
          : detectOrientation // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalAppUrl: null == externalAppUrl
          ? _self.externalAppUrl
          : externalAppUrl // ignore: cast_nullable_to_non_nullable
              as String,
      externalCssUrl: null == externalCssUrl
          ? _self.externalCssUrl
          : externalCssUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as LayoutSettingsName,
      options: freezed == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
