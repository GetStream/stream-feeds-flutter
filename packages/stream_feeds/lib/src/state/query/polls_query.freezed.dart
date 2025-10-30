// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollsQuery {
  PollsFilter? get filter;
  List<PollsSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;

  /// Create a copy of PollsQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollsQueryCopyWith<PollsQuery> get copyWith =>
      _$PollsQueryCopyWithImpl<PollsQuery>(this as PollsQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollsQuery &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter,
      const DeepCollectionEquality().hash(sort), limit, next, previous);

  @override
  String toString() {
    return 'PollsQuery(filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $PollsQueryCopyWith<$Res> {
  factory $PollsQueryCopyWith(
          PollsQuery value, $Res Function(PollsQuery) _then) =
      _$PollsQueryCopyWithImpl;
  @useResult
  $Res call(
      {Filter<PollData>? filter,
      List<PollsSort>? sort,
      int? limit,
      String? next,
      String? previous});
}

/// @nodoc
class _$PollsQueryCopyWithImpl<$Res> implements $PollsQueryCopyWith<$Res> {
  _$PollsQueryCopyWithImpl(this._self, this._then);

  final PollsQuery _self;
  final $Res Function(PollsQuery) _then;

  /// Create a copy of PollsQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(PollsQuery(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<PollData>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<PollsSort>?,
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
    ));
  }
}

// dart format on
