// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'composite_app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompositeAppSettings {
  String? get jsonEncodedSettings;
  String? get url;

  /// Create a copy of CompositeAppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompositeAppSettingsCopyWith<CompositeAppSettings> get copyWith =>
      _$CompositeAppSettingsCopyWithImpl<CompositeAppSettings>(
          this as CompositeAppSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompositeAppSettings &&
            (identical(other.jsonEncodedSettings, jsonEncodedSettings) ||
                other.jsonEncodedSettings == jsonEncodedSettings) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jsonEncodedSettings, url);

  @override
  String toString() {
    return 'CompositeAppSettings(jsonEncodedSettings: $jsonEncodedSettings, url: $url)';
  }
}

/// @nodoc
abstract mixin class $CompositeAppSettingsCopyWith<$Res> {
  factory $CompositeAppSettingsCopyWith(CompositeAppSettings value,
          $Res Function(CompositeAppSettings) _then) =
      _$CompositeAppSettingsCopyWithImpl;
  @useResult
  $Res call({String? jsonEncodedSettings, String? url});
}

/// @nodoc
class _$CompositeAppSettingsCopyWithImpl<$Res>
    implements $CompositeAppSettingsCopyWith<$Res> {
  _$CompositeAppSettingsCopyWithImpl(this._self, this._then);

  final CompositeAppSettings _self;
  final $Res Function(CompositeAppSettings) _then;

  /// Create a copy of CompositeAppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonEncodedSettings = freezed,
    Object? url = freezed,
  }) {
    return _then(CompositeAppSettings(
      jsonEncodedSettings: freezed == jsonEncodedSettings
          ? _self.jsonEncodedSettings
          : jsonEncodedSettings // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
