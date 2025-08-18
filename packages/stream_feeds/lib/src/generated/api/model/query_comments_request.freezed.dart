// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_comments_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryCommentsRequest {
  Map<String, Object> get filter;
  int? get limit;
  String? get next;
  String? get prev;
  QueryCommentsRequestSort? get sort;

  /// Create a copy of QueryCommentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryCommentsRequestCopyWith<QueryCommentsRequest> get copyWith =>
      _$QueryCommentsRequestCopyWithImpl<QueryCommentsRequest>(
          this as QueryCommentsRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryCommentsRequest &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(filter), limit, next, prev, sort);

  @override
  String toString() {
    return 'QueryCommentsRequest(filter: $filter, limit: $limit, next: $next, prev: $prev, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $QueryCommentsRequestCopyWith<$Res> {
  factory $QueryCommentsRequestCopyWith(QueryCommentsRequest value,
          $Res Function(QueryCommentsRequest) _then) =
      _$QueryCommentsRequestCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, Object> filter,
      int? limit,
      String? next,
      String? prev,
      QueryCommentsRequestSort? sort});
}

/// @nodoc
class _$QueryCommentsRequestCopyWithImpl<$Res>
    implements $QueryCommentsRequestCopyWith<$Res> {
  _$QueryCommentsRequestCopyWithImpl(this._self, this._then);

  final QueryCommentsRequest _self;
  final $Res Function(QueryCommentsRequest) _then;

  /// Create a copy of QueryCommentsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? limit = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? sort = freezed,
  }) {
    return _then(QueryCommentsRequest(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as QueryCommentsRequestSort?,
    ));
  }
}

// dart format on
