// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'harm_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HarmConfig {
  List<ActionSequence> get actionSequences;
  int get severity;

  /// Create a copy of HarmConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HarmConfigCopyWith<HarmConfig> get copyWith =>
      _$HarmConfigCopyWithImpl<HarmConfig>(this as HarmConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HarmConfig &&
            const DeepCollectionEquality()
                .equals(other.actionSequences, actionSequences) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(actionSequences), severity);

  @override
  String toString() {
    return 'HarmConfig(actionSequences: $actionSequences, severity: $severity)';
  }
}

/// @nodoc
abstract mixin class $HarmConfigCopyWith<$Res> {
  factory $HarmConfigCopyWith(
          HarmConfig value, $Res Function(HarmConfig) _then) =
      _$HarmConfigCopyWithImpl;
  @useResult
  $Res call({List<ActionSequence> actionSequences, int severity});
}

/// @nodoc
class _$HarmConfigCopyWithImpl<$Res> implements $HarmConfigCopyWith<$Res> {
  _$HarmConfigCopyWithImpl(this._self, this._then);

  final HarmConfig _self;
  final $Res Function(HarmConfig) _then;

  /// Create a copy of HarmConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionSequences = null,
    Object? severity = null,
  }) {
    return _then(HarmConfig(
      actionSequences: null == actionSequences
          ? _self.actionSequences
          : actionSequences // ignore: cast_nullable_to_non_nullable
              as List<ActionSequence>,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
