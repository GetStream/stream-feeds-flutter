// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_query_activity_reactions_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchQueryActivityReactionsRequest {
  List<String> get activityIds;
  Map<String, Object?>? get filter;
  int? get limit;
  String? get next;
  String? get prev;
  List<SortParamRequest>? get sort;

  /// Create a copy of BatchQueryActivityReactionsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchQueryActivityReactionsRequestCopyWith<BatchQueryActivityReactionsRequest> get copyWith =>
      _$BatchQueryActivityReactionsRequestCopyWithImpl<BatchQueryActivityReactionsRequest>(
        this as BatchQueryActivityReactionsRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchQueryActivityReactionsRequest &&
            const DeepCollectionEquality().equals(
              other.activityIds,
              activityIds,
            ) &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(activityIds),
    const DeepCollectionEquality().hash(filter),
    limit,
    next,
    prev,
    const DeepCollectionEquality().hash(sort),
  );

  @override
  String toString() {
    return 'BatchQueryActivityReactionsRequest(activityIds: $activityIds, filter: $filter, limit: $limit, next: $next, prev: $prev, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $BatchQueryActivityReactionsRequestCopyWith<$Res> {
  factory $BatchQueryActivityReactionsRequestCopyWith(
    BatchQueryActivityReactionsRequest value,
    $Res Function(BatchQueryActivityReactionsRequest) _then,
  ) = _$BatchQueryActivityReactionsRequestCopyWithImpl;
  @useResult
  $Res call({
    List<String> activityIds,
    Map<String, Object?>? filter,
    int? limit,
    String? next,
    String? prev,
    List<SortParamRequest>? sort,
  });
}

/// @nodoc
class _$BatchQueryActivityReactionsRequestCopyWithImpl<$Res>
    implements $BatchQueryActivityReactionsRequestCopyWith<$Res> {
  _$BatchQueryActivityReactionsRequestCopyWithImpl(this._self, this._then);

  final BatchQueryActivityReactionsRequest _self;
  final $Res Function(BatchQueryActivityReactionsRequest) _then;

  /// Create a copy of BatchQueryActivityReactionsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityIds = null,
    Object? filter = freezed,
    Object? limit = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? sort = freezed,
  }) {
    return _then(
      BatchQueryActivityReactionsRequest(
        activityIds: null == activityIds
            ? _self.activityIds
            : activityIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        filter: freezed == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
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
