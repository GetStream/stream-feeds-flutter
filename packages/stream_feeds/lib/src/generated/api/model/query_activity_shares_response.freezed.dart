// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_activity_shares_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryActivitySharesResponse {
  String get duration;
  String? get next;
  String? get prev;
  List<ShareResponse> get shares;

  /// Create a copy of QueryActivitySharesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryActivitySharesResponseCopyWith<QueryActivitySharesResponse> get copyWith =>
      _$QueryActivitySharesResponseCopyWithImpl<QueryActivitySharesResponse>(
        this as QueryActivitySharesResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryActivitySharesResponse &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other.shares, shares));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    next,
    prev,
    const DeepCollectionEquality().hash(shares),
  );

  @override
  String toString() {
    return 'QueryActivitySharesResponse(duration: $duration, next: $next, prev: $prev, shares: $shares)';
  }
}

/// @nodoc
abstract mixin class $QueryActivitySharesResponseCopyWith<$Res> {
  factory $QueryActivitySharesResponseCopyWith(
    QueryActivitySharesResponse value,
    $Res Function(QueryActivitySharesResponse) _then,
  ) = _$QueryActivitySharesResponseCopyWithImpl;
  @useResult
  $Res call({
    String duration,
    String? next,
    String? prev,
    List<ShareResponse> shares,
  });
}

/// @nodoc
class _$QueryActivitySharesResponseCopyWithImpl<$Res> implements $QueryActivitySharesResponseCopyWith<$Res> {
  _$QueryActivitySharesResponseCopyWithImpl(this._self, this._then);

  final QueryActivitySharesResponse _self;
  final $Res Function(QueryActivitySharesResponse) _then;

  /// Create a copy of QueryActivitySharesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? shares = null,
  }) {
    return _then(
      QueryActivitySharesResponse(
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as String?,
        prev: freezed == prev
            ? _self.prev
            : prev // ignore: cast_nullable_to_non_nullable
                  as String?,
        shares: null == shares
            ? _self.shares
            : shares // ignore: cast_nullable_to_non_nullable
                  as List<ShareResponse>,
      ),
    );
  }
}
