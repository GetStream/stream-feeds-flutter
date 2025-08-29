// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decay_function_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DecayFunctionConfig {
  String? get base;
  String? get decay;
  String? get direction;
  String? get offset;
  String? get origin;
  String? get scale;

  /// Create a copy of DecayFunctionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DecayFunctionConfigCopyWith<DecayFunctionConfig> get copyWith =>
      _$DecayFunctionConfigCopyWithImpl<DecayFunctionConfig>(
          this as DecayFunctionConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecayFunctionConfig &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.decay, decay) || other.decay == decay) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, base, decay, direction, offset, origin, scale);

  @override
  String toString() {
    return 'DecayFunctionConfig(base: $base, decay: $decay, direction: $direction, offset: $offset, origin: $origin, scale: $scale)';
  }
}

/// @nodoc
abstract mixin class $DecayFunctionConfigCopyWith<$Res> {
  factory $DecayFunctionConfigCopyWith(
          DecayFunctionConfig value, $Res Function(DecayFunctionConfig) _then) =
      _$DecayFunctionConfigCopyWithImpl;
  @useResult
  $Res call(
      {String? base,
      String? decay,
      String? direction,
      String? offset,
      String? origin,
      String? scale});
}

/// @nodoc
class _$DecayFunctionConfigCopyWithImpl<$Res>
    implements $DecayFunctionConfigCopyWith<$Res> {
  _$DecayFunctionConfigCopyWithImpl(this._self, this._then);

  final DecayFunctionConfig _self;
  final $Res Function(DecayFunctionConfig) _then;

  /// Create a copy of DecayFunctionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = freezed,
    Object? decay = freezed,
    Object? direction = freezed,
    Object? offset = freezed,
    Object? origin = freezed,
    Object? scale = freezed,
  }) {
    return _then(DecayFunctionConfig(
      base: freezed == base
          ? _self.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      decay: freezed == decay
          ? _self.decay
          : decay // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      offset: freezed == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      scale: freezed == scale
          ? _self.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
