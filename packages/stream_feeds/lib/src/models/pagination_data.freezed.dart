// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationData {
  String? get next;
  String? get previous;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationDataCopyWith<PaginationData> get copyWith =>
      _$PaginationDataCopyWithImpl<PaginationData>(
          this as PaginationData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationData &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, next, previous);

  @override
  String toString() {
    return 'PaginationData(next: $next, previous: $previous)';
  }
}

/// @nodoc
abstract mixin class $PaginationDataCopyWith<$Res> {
  factory $PaginationDataCopyWith(
          PaginationData value, $Res Function(PaginationData) _then) =
      _$PaginationDataCopyWithImpl;
  @useResult
  $Res call({String? next, String? previous});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<$Res>
    implements $PaginationDataCopyWith<$Res> {
  _$PaginationDataCopyWithImpl(this._self, this._then);

  final PaginationData _self;
  final $Res Function(PaginationData) _then;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(PaginationData(
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

/// @nodoc
mixin _$PaginationResult<T> {
  List<T> get items;
  PaginationData get pagination;

  /// Create a copy of PaginationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationResultCopyWith<T, PaginationResult<T>> get copyWith =>
      _$PaginationResultCopyWithImpl<T, PaginationResult<T>>(
          this as PaginationResult<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationResult<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(items), pagination);

  @override
  String toString() {
    return 'PaginationResult<$T>(items: $items, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $PaginationResultCopyWith<T, $Res> {
  factory $PaginationResultCopyWith(
          PaginationResult<T> value, $Res Function(PaginationResult<T>) _then) =
      _$PaginationResultCopyWithImpl;
  @useResult
  $Res call({List<T> items, PaginationData pagination});
}

/// @nodoc
class _$PaginationResultCopyWithImpl<T, $Res>
    implements $PaginationResultCopyWith<T, $Res> {
  _$PaginationResultCopyWithImpl(this._self, this._then);

  final PaginationResult<T> _self;
  final $Res Function(PaginationResult<T>) _then;

  /// Create a copy of PaginationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
  }) {
    return _then(PaginationResult(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: null == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData,
    ));
  }
}

// dart format on
