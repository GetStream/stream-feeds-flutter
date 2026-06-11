// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_activities_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryActivitiesRequest {
  bool? get enrichOwnFields;
  Map<String, Object?>? get filter;
  bool? get includeSoftDeletedActivities;
  int? get limit;
  String? get next;
  String? get prev;
  List<SortParamRequest>? get sort;

  /// Create a copy of QueryActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryActivitiesRequestCopyWith<QueryActivitiesRequest> get copyWith =>
      _$QueryActivitiesRequestCopyWithImpl<QueryActivitiesRequest>(
        this as QueryActivitiesRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryActivitiesRequest &&
            (identical(other.enrichOwnFields, enrichOwnFields) || other.enrichOwnFields == enrichOwnFields) &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(
                  other.includeSoftDeletedActivities,
                  includeSoftDeletedActivities,
                ) ||
                other.includeSoftDeletedActivities == includeSoftDeletedActivities) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enrichOwnFields,
    const DeepCollectionEquality().hash(filter),
    includeSoftDeletedActivities,
    limit,
    next,
    prev,
    const DeepCollectionEquality().hash(sort),
  );

  @override
  String toString() {
    return 'QueryActivitiesRequest(enrichOwnFields: $enrichOwnFields, filter: $filter, includeSoftDeletedActivities: $includeSoftDeletedActivities, limit: $limit, next: $next, prev: $prev, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $QueryActivitiesRequestCopyWith<$Res> {
  factory $QueryActivitiesRequestCopyWith(
    QueryActivitiesRequest value,
    $Res Function(QueryActivitiesRequest) _then,
  ) = _$QueryActivitiesRequestCopyWithImpl;
  @useResult
  $Res call({
    bool? enrichOwnFields,
    Map<String, Object?>? filter,
    bool? includeSoftDeletedActivities,
    int? limit,
    String? next,
    String? prev,
    List<SortParamRequest>? sort,
  });
}

/// @nodoc
class _$QueryActivitiesRequestCopyWithImpl<$Res> implements $QueryActivitiesRequestCopyWith<$Res> {
  _$QueryActivitiesRequestCopyWithImpl(this._self, this._then);

  final QueryActivitiesRequest _self;
  final $Res Function(QueryActivitiesRequest) _then;

  /// Create a copy of QueryActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrichOwnFields = freezed,
    Object? filter = freezed,
    Object? includeSoftDeletedActivities = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? sort = freezed,
  }) {
    return _then(
      QueryActivitiesRequest(
        enrichOwnFields: freezed == enrichOwnFields
            ? _self.enrichOwnFields
            : enrichOwnFields // ignore: cast_nullable_to_non_nullable
                  as bool?,
        filter: freezed == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        includeSoftDeletedActivities: freezed == includeSoftDeletedActivities
            ? _self.includeSoftDeletedActivities
            : includeSoftDeletedActivities // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
                  as List<SortParamRequest>?,
      ),
    );
  }
}
