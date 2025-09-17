// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_votes_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollVotesQuery {
  String get pollId;
  String? get userId;
  Filter<PollVotesFilterField>? get filter;
  List<PollVotesSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;

  /// Create a copy of PollVotesQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVotesQueryCopyWith<PollVotesQuery> get copyWith =>
      _$PollVotesQueryCopyWithImpl<PollVotesQuery>(
          this as PollVotesQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVotesQuery &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pollId, userId, filter,
      const DeepCollectionEquality().hash(sort), limit, next, previous);

  @override
  String toString() {
    return 'PollVotesQuery(pollId: $pollId, userId: $userId, filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $PollVotesQueryCopyWith<$Res> {
  factory $PollVotesQueryCopyWith(
          PollVotesQuery value, $Res Function(PollVotesQuery) _then) =
      _$PollVotesQueryCopyWithImpl;
  @useResult
  $Res call(
      {String pollId,
      String? userId,
      Filter<PollVotesFilterField>? filter,
      List<PollVotesSort>? sort,
      int? limit,
      String? next,
      String? previous});
}

/// @nodoc
class _$PollVotesQueryCopyWithImpl<$Res>
    implements $PollVotesQueryCopyWith<$Res> {
  _$PollVotesQueryCopyWithImpl(this._self, this._then);

  final PollVotesQuery _self;
  final $Res Function(PollVotesQuery) _then;

  /// Create a copy of PollVotesQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollId = null,
    Object? userId = freezed,
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(PollVotesQuery(
      pollId: null == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<PollVotesFilterField>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<PollVotesSort>?,
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
