// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geofence_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeofenceSettings {
  List<String> get names;

  /// Create a copy of GeofenceSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeofenceSettingsCopyWith<GeofenceSettings> get copyWith =>
      _$GeofenceSettingsCopyWithImpl<GeofenceSettings>(
          this as GeofenceSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeofenceSettings &&
            const DeepCollectionEquality().equals(other.names, names));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(names));

  @override
  String toString() {
    return 'GeofenceSettings(names: $names)';
  }
}

/// @nodoc
abstract mixin class $GeofenceSettingsCopyWith<$Res> {
  factory $GeofenceSettingsCopyWith(
          GeofenceSettings value, $Res Function(GeofenceSettings) _then) =
      _$GeofenceSettingsCopyWithImpl;
  @useResult
  $Res call({List<String> names});
}

/// @nodoc
class _$GeofenceSettingsCopyWithImpl<$Res>
    implements $GeofenceSettingsCopyWith<$Res> {
  _$GeofenceSettingsCopyWithImpl(this._self, this._then);

  final GeofenceSettings _self;
  final $Res Function(GeofenceSettings) _then;

  /// Create a copy of GeofenceSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
  }) {
    return _then(GeofenceSettings(
      names: null == names
          ? _self.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
