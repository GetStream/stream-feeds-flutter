// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'members_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MembersQuery {
  FeedId get fid;
  MembersFilter? get filter;
  List<MembersSort>? get sort;
  int? get limit;
  String? get next;
  String? get previous;

  /// Create a copy of MembersQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MembersQueryCopyWith<MembersQuery> get copyWith =>
      _$MembersQueryCopyWithImpl<MembersQuery>(
          this as MembersQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MembersQuery &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fid, filter,
      const DeepCollectionEquality().hash(sort), limit, next, previous);

  @override
  String toString() {
    return 'MembersQuery(fid: $fid, filter: $filter, sort: $sort, limit: $limit, next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $MembersQueryCopyWith<$Res> {
  factory $MembersQueryCopyWith(
          MembersQuery value, $Res Function(MembersQuery) _then) =
      _$MembersQueryCopyWithImpl;
  @useResult
  $Res call(
      {FeedId fid,
      Filter<FeedMemberData>? filter,
      List<MembersSort>? sort,
      int? limit,
      String? next,
      String? previous});
}

/// @nodoc
class _$MembersQueryCopyWithImpl<$Res> implements $MembersQueryCopyWith<$Res> {
  _$MembersQueryCopyWithImpl(this._self, this._then);

  final MembersQuery _self;
  final $Res Function(MembersQuery) _then;

  /// Create a copy of MembersQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fid = null,
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(MembersQuery(
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as FeedId,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter<FeedMemberData>?,
      sort: freezed == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<MembersSort>?,
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
