// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backstage_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackstageSettings {
  bool get enabled;
  int? get joinAheadTimeSeconds;

  /// Create a copy of BackstageSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackstageSettingsCopyWith<BackstageSettings> get copyWith =>
      _$BackstageSettingsCopyWithImpl<BackstageSettings>(
          this as BackstageSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackstageSettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.joinAheadTimeSeconds, joinAheadTimeSeconds) ||
                other.joinAheadTimeSeconds == joinAheadTimeSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, joinAheadTimeSeconds);

  @override
  String toString() {
    return 'BackstageSettings(enabled: $enabled, joinAheadTimeSeconds: $joinAheadTimeSeconds)';
  }
}

/// @nodoc
abstract mixin class $BackstageSettingsCopyWith<$Res> {
  factory $BackstageSettingsCopyWith(
          BackstageSettings value, $Res Function(BackstageSettings) _then) =
      _$BackstageSettingsCopyWithImpl;
  @useResult
  $Res call({bool enabled, int? joinAheadTimeSeconds});
}

/// @nodoc
class _$BackstageSettingsCopyWithImpl<$Res>
    implements $BackstageSettingsCopyWith<$Res> {
  _$BackstageSettingsCopyWithImpl(this._self, this._then);

  final BackstageSettings _self;
  final $Res Function(BackstageSettings) _then;

  /// Create a copy of BackstageSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? joinAheadTimeSeconds = freezed,
  }) {
    return _then(BackstageSettings(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      joinAheadTimeSeconds: freezed == joinAheadTimeSeconds
          ? _self.joinAheadTimeSeconds
          : joinAheadTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
