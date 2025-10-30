// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_reactions_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentReactionsQuery {
  String get commentId;
  CommentReactionsFilter? get filter;
  List<CommentReactionsSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;

  /// Create a copy of CommentReactionsQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionsQueryCopyWith<CommentReactionsQuery> get copyWith =>
      _$CommentReactionsQueryCopyWithImpl<CommentReactionsQuery>(
          this as CommentReactionsQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionsQuery &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentId, filter,
      const DeepCollectionEquality().hash(sort), limit, next, previous);

  @override
  String toString() {
    return 'CommentReactionsQuery(commentId: $commentId, filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionsQueryCopyWith<$Res> {
  factory $CommentReactionsQueryCopyWith(CommentReactionsQuery value,
          $Res Function(CommentReactionsQuery) _then) =
      _$CommentReactionsQueryCopyWithImpl;
  @useResult
  $Res call(
      {String commentId,
      Filter<FeedsReactionData>? filter,
      List<CommentReactionsSort>? sort,
      int? limit,
      String? next,
      String? previous});
}

/// @nodoc
class _$CommentReactionsQueryCopyWithImpl<$Res>
    implements $CommentReactionsQueryCopyWith<$Res> {
  _$CommentReactionsQueryCopyWithImpl(this._self, this._then);

  final CommentReactionsQuery _self;
  final $Res Function(CommentReactionsQuery) _then;

  /// Create a copy of CommentReactionsQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(CommentReactionsQuery(
      commentId: null == commentId
          ? _self.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<FeedsReactionData>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<CommentReactionsSort>?,
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
