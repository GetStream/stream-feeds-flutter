// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pager_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagerRequest {
  int? get limit;
  String? get next;
  String? get prev;

  /// Create a copy of PagerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PagerRequestCopyWith<PagerRequest> get copyWith =>
      _$PagerRequestCopyWithImpl<PagerRequest>(
          this as PagerRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PagerRequest &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, next, prev);

  @override
  String toString() {
    return 'PagerRequest(limit: $limit, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $PagerRequestCopyWith<$Res> {
  factory $PagerRequestCopyWith(
          PagerRequest value, $Res Function(PagerRequest) _then) =
      _$PagerRequestCopyWithImpl;
  @useResult
  $Res call({int? limit, String? next, String? prev});
}

/// @nodoc
class _$PagerRequestCopyWithImpl<$Res> implements $PagerRequestCopyWith<$Res> {
  _$PagerRequestCopyWithImpl(this._self, this._then);

  final PagerRequest _self;
  final $Res Function(PagerRequest) _then;

  /// Create a copy of PagerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(PagerRequest(
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
    ));
  }
}

// dart format on
