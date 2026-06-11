// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flood_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FloodConfig {
  FloodIdenticalConfig? get identical;
  FloodSimilarConfig? get similar;

  /// Create a copy of FloodConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FloodConfigCopyWith<FloodConfig> get copyWith =>
      _$FloodConfigCopyWithImpl<FloodConfig>(this as FloodConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FloodConfig &&
            (identical(other.identical, identical) ||
                other.identical == identical) &&
            (identical(other.similar, similar) || other.similar == similar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identical, similar);

  @override
  String toString() {
    return 'FloodConfig(identical: $identical, similar: $similar)';
  }
}

/// @nodoc
abstract mixin class $FloodConfigCopyWith<$Res> {
  factory $FloodConfigCopyWith(
          FloodConfig value, $Res Function(FloodConfig) _then) =
      _$FloodConfigCopyWithImpl;
  @useResult
  $Res call({FloodIdenticalConfig? identical, FloodSimilarConfig? similar});
}

/// @nodoc
class _$FloodConfigCopyWithImpl<$Res> implements $FloodConfigCopyWith<$Res> {
  _$FloodConfigCopyWithImpl(this._self, this._then);

  final FloodConfig _self;
  final $Res Function(FloodConfig) _then;

  /// Create a copy of FloodConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identical = freezed,
    Object? similar = freezed,
  }) {
    return _then(FloodConfig(
      identical: freezed == identical
          ? _self.identical
          : identical // ignore: cast_nullable_to_non_nullable
              as FloodIdenticalConfig?,
      similar: freezed == similar
          ? _self.similar
          : similar // ignore: cast_nullable_to_non_nullable
              as FloodSimilarConfig?,
    ));
  }
}

// dart format on
