// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thumbnails_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThumbnailsSettings {
  bool get enabled;

  /// Create a copy of ThumbnailsSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThumbnailsSettingsCopyWith<ThumbnailsSettings> get copyWith =>
      _$ThumbnailsSettingsCopyWithImpl<ThumbnailsSettings>(
          this as ThumbnailsSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThumbnailsSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'ThumbnailsSettings(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ThumbnailsSettingsCopyWith<$Res> {
  factory $ThumbnailsSettingsCopyWith(
          ThumbnailsSettings value, $Res Function(ThumbnailsSettings) _then) =
      _$ThumbnailsSettingsCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$ThumbnailsSettingsCopyWithImpl<$Res>
    implements $ThumbnailsSettingsCopyWith<$Res> {
  _$ThumbnailsSettingsCopyWithImpl(this._self, this._then);

  final ThumbnailsSettings _self;
  final $Res Function(ThumbnailsSettings) _then;

  /// Create a copy of ThumbnailsSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(ThumbnailsSettings(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
