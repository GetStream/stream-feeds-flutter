// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryConfiguration<S extends Sort<Object>, F extends FilterField> {
  Filter<F>? get filter;
  List<S>? get sort;

  /// Create a copy of QueryConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryConfigurationCopyWith<S, F, QueryConfiguration<S, F>> get copyWith =>
      _$QueryConfigurationCopyWithImpl<S, F, QueryConfiguration<S, F>>(
          this as QueryConfiguration<S, F>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryConfiguration<S, F> &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, filter, const DeepCollectionEquality().hash(sort));

  @override
  String toString() {
    return 'QueryConfiguration<$S, $F>(filter: $filter, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $QueryConfigurationCopyWith<S extends Sort<Object>,
    F extends FilterField, $Res> {
  factory $QueryConfigurationCopyWith(QueryConfiguration<S, F> value,
          $Res Function(QueryConfiguration<S, F>) _then) =
      _$QueryConfigurationCopyWithImpl;
  @useResult
  $Res call({Filter<F>? filter, List<S>? sort});
}

/// @nodoc
class _$QueryConfigurationCopyWithImpl<
    S extends Sort<Object>,
    F extends FilterField,
    $Res> implements $QueryConfigurationCopyWith<S, F, $Res> {
  _$QueryConfigurationCopyWithImpl(this._self, this._then);

  final QueryConfiguration<S, F> _self;
  final $Res Function(QueryConfiguration<S, F>) _then;

  /// Create a copy of QueryConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? sort = freezed,
  }) {
    return _then(QueryConfiguration(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<F>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<S>?,
    ));
  }
}

// dart format on
