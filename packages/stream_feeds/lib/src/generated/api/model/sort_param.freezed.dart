// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SortParam {
  int get direction;
  String get field;

  /// Create a copy of SortParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SortParamCopyWith<SortParam> get copyWith =>
      _$SortParamCopyWithImpl<SortParam>(this as SortParam, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SortParam &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction, field);

  @override
  String toString() {
    return 'SortParam(direction: $direction, field: $field)';
  }
}

/// @nodoc
abstract mixin class $SortParamCopyWith<$Res> {
  factory $SortParamCopyWith(SortParam value, $Res Function(SortParam) _then) =
      _$SortParamCopyWithImpl;
  @useResult
  $Res call({int direction, String field});
}

/// @nodoc
class _$SortParamCopyWithImpl<$Res> implements $SortParamCopyWith<$Res> {
  _$SortParamCopyWithImpl(this._self, this._then);

  final SortParam _self;
  final $Res Function(SortParam) _then;

  /// Create a copy of SortParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? field = null,
  }) {
    return _then(SortParam(
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as int,
      field: null == field
          ? _self.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
