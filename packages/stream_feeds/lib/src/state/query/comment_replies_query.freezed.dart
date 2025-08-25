// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_replies_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentRepliesQuery {
  String get commentId;
  CommentsSort? get sort;
  int? get depth;
  int? get limit;
  int? get repliesLimit;
  String? get next;
  String? get previous;

  /// Create a copy of CommentRepliesQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentRepliesQueryCopyWith<CommentRepliesQuery> get copyWith =>
      _$CommentRepliesQueryCopyWithImpl<CommentRepliesQuery>(
          this as CommentRepliesQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentRepliesQuery &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.repliesLimit, repliesLimit) ||
                other.repliesLimit == repliesLimit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, commentId, sort, depth, limit, repliesLimit, next, previous);

  @override
  String toString() {
    return 'CommentRepliesQuery(commentId: $commentId, sort: $sort, depth: $depth, limit: $limit, repliesLimit: $repliesLimit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $CommentRepliesQueryCopyWith<$Res> {
  factory $CommentRepliesQueryCopyWith(
          CommentRepliesQuery value, $Res Function(CommentRepliesQuery) _then) =
      _$CommentRepliesQueryCopyWithImpl;
  @useResult
  $Res call(
      {String commentId,
      CommentsSort? sort,
      int? depth,
      int? limit,
      int? repliesLimit,
      String? next,
      String? previous});
}

/// @nodoc
class _$CommentRepliesQueryCopyWithImpl<$Res>
    implements $CommentRepliesQueryCopyWith<$Res> {
  _$CommentRepliesQueryCopyWithImpl(this._self, this._then);

  final CommentRepliesQuery _self;
  final $Res Function(CommentRepliesQuery) _then;

  /// Create a copy of CommentRepliesQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? sort = freezed,
    Object? depth = freezed,
    Object? limit = freezed,
    Object? repliesLimit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(CommentRepliesQuery(
      commentId: null == commentId
          ? _self.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as CommentsSort?,
      depth: freezed == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      repliesLimit: freezed == repliesLimit
          ? _self.repliesLimit
          : repliesLimit // ignore: cast_nullable_to_non_nullable
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
