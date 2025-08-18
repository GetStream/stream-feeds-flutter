// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screensharing_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScreensharingSettings {
  bool get accessRequestEnabled;
  bool get enabled;
  TargetResolution? get targetResolution;

  /// Create a copy of ScreensharingSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensharingSettingsCopyWith<ScreensharingSettings> get copyWith =>
      _$ScreensharingSettingsCopyWithImpl<ScreensharingSettings>(
          this as ScreensharingSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensharingSettings &&
            (identical(other.accessRequestEnabled, accessRequestEnabled) ||
                other.accessRequestEnabled == accessRequestEnabled) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.targetResolution, targetResolution) ||
                other.targetResolution == targetResolution));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessRequestEnabled, enabled, targetResolution);

  @override
  String toString() {
    return 'ScreensharingSettings(accessRequestEnabled: $accessRequestEnabled, enabled: $enabled, targetResolution: $targetResolution)';
  }
}

/// @nodoc
abstract mixin class $ScreensharingSettingsCopyWith<$Res> {
  factory $ScreensharingSettingsCopyWith(ScreensharingSettings value,
          $Res Function(ScreensharingSettings) _then) =
      _$ScreensharingSettingsCopyWithImpl;
  @useResult
  $Res call(
      {bool accessRequestEnabled,
      bool enabled,
      TargetResolution? targetResolution});
}

/// @nodoc
class _$ScreensharingSettingsCopyWithImpl<$Res>
    implements $ScreensharingSettingsCopyWith<$Res> {
  _$ScreensharingSettingsCopyWithImpl(this._self, this._then);

  final ScreensharingSettings _self;
  final $Res Function(ScreensharingSettings) _then;

  /// Create a copy of ScreensharingSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessRequestEnabled = null,
    Object? enabled = null,
    Object? targetResolution = freezed,
  }) {
    return _then(ScreensharingSettings(
      accessRequestEnabled: null == accessRequestEnabled
          ? _self.accessRequestEnabled
          : accessRequestEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      targetResolution: freezed == targetResolution
          ? _self.targetResolution
          : targetResolution // ignore: cast_nullable_to_non_nullable
              as TargetResolution?,
    ));
  }
}

// dart format on
