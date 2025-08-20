// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeds_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedsQuery {
  Filter? get filter;
  List<FeedsSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;
  bool get watch;

  /// Create a copy of FeedsQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedsQueryCopyWith<FeedsQuery> get copyWith =>
      _$FeedsQueryCopyWithImpl<FeedsQuery>(this as FeedsQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedsQuery &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.watch, watch) || other.watch == watch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter,
      const DeepCollectionEquality().hash(sort), limit, next, previous, watch);

  @override
  String toString() {
    return 'FeedsQuery(filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous, watch: $watch)';
  }
}

/// @nodoc
abstract mixin class $FeedsQueryCopyWith<$Res> {
  factory $FeedsQueryCopyWith(
          FeedsQuery value, $Res Function(FeedsQuery) _then) =
      _$FeedsQueryCopyWithImpl;
  @useResult
  $Res call(
      {Filter? filter,
      List<FeedsSort>? sort,
      int? limit,
      String? next,
      String? previous,
      bool watch});
}

/// @nodoc
class _$FeedsQueryCopyWithImpl<$Res> implements $FeedsQueryCopyWith<$Res> {
  _$FeedsQueryCopyWithImpl(this._self, this._then);

  final FeedsQuery _self;
  final $Res Function(FeedsQuery) _then;

  /// Create a copy of FeedsQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? watch = null,
  }) {
    return _then(FeedsQuery(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<FeedsSort>?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _self.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      watch: null == watch
          ? _self.watch
          : watch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
