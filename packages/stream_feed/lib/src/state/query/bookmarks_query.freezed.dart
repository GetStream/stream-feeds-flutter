// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarks_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarksQuery {
  Filter<BookmarksFilterField>? get filter;
  List<BookmarksSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;

  /// Create a copy of BookmarksQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarksQueryCopyWith<BookmarksQuery> get copyWith =>
      _$BookmarksQueryCopyWithImpl<BookmarksQuery>(
          this as BookmarksQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarksQuery &&
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
    return 'BookmarksQuery(filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $BookmarksQueryCopyWith<$Res> {
  factory $BookmarksQueryCopyWith(
          BookmarksQuery value, $Res Function(BookmarksQuery) _then) =
      _$BookmarksQueryCopyWithImpl;
  @useResult
  $Res call(
      {Filter<BookmarksFilterField>? filter,
      List<BookmarksSort>? sort,
      int? limit,
      String? next,
      String? previous});
}

/// @nodoc
class _$BookmarksQueryCopyWithImpl<$Res>
    implements $BookmarksQueryCopyWith<$Res> {
  _$BookmarksQueryCopyWithImpl(this._self, this._then);

  final BookmarksQuery _self;
  final $Res Function(BookmarksQuery) _then;

  /// Create a copy of BookmarksQuery
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
    return _then(BookmarksQuery(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<BookmarksFilterField>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<BookmarksSort>?,
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
