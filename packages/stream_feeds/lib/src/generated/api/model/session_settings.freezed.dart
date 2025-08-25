// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionSettings {
  int get inactivityTimeoutSeconds;

  /// Create a copy of SessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionSettingsCopyWith<SessionSettings> get copyWith =>
      _$SessionSettingsCopyWithImpl<SessionSettings>(
          this as SessionSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionSettings &&
            (identical(
                    other.inactivityTimeoutSeconds, inactivityTimeoutSeconds) ||
                other.inactivityTimeoutSeconds == inactivityTimeoutSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inactivityTimeoutSeconds);

  @override
  String toString() {
    return 'SessionSettings(inactivityTimeoutSeconds: $inactivityTimeoutSeconds)';
  }
}

/// @nodoc
abstract mixin class $SessionSettingsCopyWith<$Res> {
  factory $SessionSettingsCopyWith(
          SessionSettings value, $Res Function(SessionSettings) _then) =
      _$SessionSettingsCopyWithImpl;
  @useResult
  $Res call({int inactivityTimeoutSeconds});
}

/// @nodoc
class _$SessionSettingsCopyWithImpl<$Res>
    implements $SessionSettingsCopyWith<$Res> {
  _$SessionSettingsCopyWithImpl(this._self, this._then);

  final SessionSettings _self;
  final $Res Function(SessionSettings) _then;

  /// Create a copy of SessionSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inactivityTimeoutSeconds = null,
  }) {
    return _then(SessionSettings(
      inactivityTimeoutSeconds: null == inactivityTimeoutSeconds
          ? _self.inactivityTimeoutSeconds
          : inactivityTimeoutSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
