// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RankingConfig {
  Map<String, Object?>? get defaults;
  Map<String, DecayFunctionConfig>? get functions;
  String? get score;
  String? get type;

  /// Create a copy of RankingConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RankingConfigCopyWith<RankingConfig> get copyWith =>
      _$RankingConfigCopyWithImpl<RankingConfig>(
          this as RankingConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RankingConfig &&
            const DeepCollectionEquality().equals(other.defaults, defaults) &&
            const DeepCollectionEquality().equals(other.functions, functions) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(defaults),
      const DeepCollectionEquality().hash(functions),
      score,
      type);

  @override
  String toString() {
    return 'RankingConfig(defaults: $defaults, functions: $functions, score: $score, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RankingConfigCopyWith<$Res> {
  factory $RankingConfigCopyWith(
          RankingConfig value, $Res Function(RankingConfig) _then) =
      _$RankingConfigCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object?>? defaults,
      Map<String, DecayFunctionConfig>? functions,
      String? score,
      String? type});
}

/// @nodoc
class _$RankingConfigCopyWithImpl<$Res>
    implements $RankingConfigCopyWith<$Res> {
  _$RankingConfigCopyWithImpl(this._self, this._then);

  final RankingConfig _self;
  final $Res Function(RankingConfig) _then;

  /// Create a copy of RankingConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaults = freezed,
    Object? functions = freezed,
    Object? score = freezed,
    Object? type = freezed,
  }) {
    return _then(RankingConfig(
      defaults: freezed == defaults
          ? _self.defaults
          : defaults // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      functions: freezed == functions
          ? _self.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, DecayFunctionConfig>?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
