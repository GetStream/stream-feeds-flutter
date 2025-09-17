// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'limits_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LimitsSettings {
  int? get maxDurationSeconds;
  int? get maxParticipants;
  bool? get maxParticipantsExcludeOwner;
  List<String> get maxParticipantsExcludeRoles;

  /// Create a copy of LimitsSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LimitsSettingsCopyWith<LimitsSettings> get copyWith =>
      _$LimitsSettingsCopyWithImpl<LimitsSettings>(
          this as LimitsSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LimitsSettings &&
            (identical(other.maxDurationSeconds, maxDurationSeconds) ||
                other.maxDurationSeconds == maxDurationSeconds) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.maxParticipantsExcludeOwner,
                    maxParticipantsExcludeOwner) ||
                other.maxParticipantsExcludeOwner ==
                    maxParticipantsExcludeOwner) &&
            const DeepCollectionEquality().equals(
                other.maxParticipantsExcludeRoles,
                maxParticipantsExcludeRoles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      maxDurationSeconds,
      maxParticipants,
      maxParticipantsExcludeOwner,
      const DeepCollectionEquality().hash(maxParticipantsExcludeRoles));

  @override
  String toString() {
    return 'LimitsSettings(maxDurationSeconds: $maxDurationSeconds, maxParticipants: $maxParticipants, maxParticipantsExcludeOwner: $maxParticipantsExcludeOwner, maxParticipantsExcludeRoles: $maxParticipantsExcludeRoles)';
  }
}

/// @nodoc
abstract mixin class $LimitsSettingsCopyWith<$Res> {
  factory $LimitsSettingsCopyWith(
          LimitsSettings value, $Res Function(LimitsSettings) _then) =
      _$LimitsSettingsCopyWithImpl;
  @useResult
  $Res call(
      {int? maxDurationSeconds,
      int? maxParticipants,
      bool? maxParticipantsExcludeOwner,
      List<String> maxParticipantsExcludeRoles});
}

/// @nodoc
class _$LimitsSettingsCopyWithImpl<$Res>
    implements $LimitsSettingsCopyWith<$Res> {
  _$LimitsSettingsCopyWithImpl(this._self, this._then);

  final LimitsSettings _self;
  final $Res Function(LimitsSettings) _then;

  /// Create a copy of LimitsSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxDurationSeconds = freezed,
    Object? maxParticipants = freezed,
    Object? maxParticipantsExcludeOwner = freezed,
    Object? maxParticipantsExcludeRoles = null,
  }) {
    return _then(LimitsSettings(
      maxDurationSeconds: freezed == maxDurationSeconds
          ? _self.maxDurationSeconds
          : maxDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParticipants: freezed == maxParticipants
          ? _self.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParticipantsExcludeOwner: freezed == maxParticipantsExcludeOwner
          ? _self.maxParticipantsExcludeOwner
          : maxParticipantsExcludeOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      maxParticipantsExcludeRoles: null == maxParticipantsExcludeRoles
          ? _self.maxParticipantsExcludeRoles
          : maxParticipantsExcludeRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
