// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersQuery {
  UsersFilter? get filter;
  List<UsersSort>? get sort;
  int? get limit;
  int? get offset;
  bool? get presence;
  bool? get includeDeactivatedUsers;

  /// Create a copy of UsersQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersQueryCopyWith<UsersQuery> get copyWith => _$UsersQueryCopyWithImpl<UsersQuery>(this as UsersQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersQuery &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.presence, presence) || other.presence == presence) &&
            (identical(
                  other.includeDeactivatedUsers,
                  includeDeactivatedUsers,
                ) ||
                other.includeDeactivatedUsers == includeDeactivatedUsers));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    filter,
    const DeepCollectionEquality().hash(sort),
    limit,
    offset,
    presence,
    includeDeactivatedUsers,
  );

  @override
  String toString() {
    return 'UsersQuery(filter: $filter, sort: $sort, limit: $limit, offset: $offset, presence: $presence, includeDeactivatedUsers: $includeDeactivatedUsers)';
  }
}

/// @nodoc
abstract mixin class $UsersQueryCopyWith<$Res> {
  factory $UsersQueryCopyWith(
    UsersQuery value,
    $Res Function(UsersQuery) _then,
  ) = _$UsersQueryCopyWithImpl;
  @useResult
  $Res call({
    Filter<UserData>? filter,
    List<UsersSort>? sort,
    int? limit,
    int? offset,
    bool? presence,
    bool? includeDeactivatedUsers,
  });
}

/// @nodoc
class _$UsersQueryCopyWithImpl<$Res> implements $UsersQueryCopyWith<$Res> {
  _$UsersQueryCopyWithImpl(this._self, this._then);

  final UsersQuery _self;
  final $Res Function(UsersQuery) _then;

  /// Create a copy of UsersQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? presence = freezed,
    Object? includeDeactivatedUsers = freezed,
  }) {
    return _then(
      UsersQuery(
        filter: freezed == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as Filter<UserData>?,
        sort: freezed == sort
            ? _self.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as List<UsersSort>?,
        limit: freezed == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        offset: freezed == offset
            ? _self.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
        presence: freezed == presence
            ? _self.presence
            : presence // ignore: cast_nullable_to_non_nullable
                  as bool?,
        includeDeactivatedUsers: freezed == includeDeactivatedUsers
            ? _self.includeDeactivatedUsers
            : includeDeactivatedUsers // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
