// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepliesMeta {
  bool get depthTruncated;
  bool get hasMore;
  String? get nextCursor;
  int get remaining;

  /// Create a copy of RepliesMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepliesMetaCopyWith<RepliesMeta> get copyWith =>
      _$RepliesMetaCopyWithImpl<RepliesMeta>(this as RepliesMeta, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepliesMeta &&
            (identical(other.depthTruncated, depthTruncated) ||
                other.depthTruncated == depthTruncated) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, depthTruncated, hasMore, nextCursor, remaining);

  @override
  String toString() {
    return 'RepliesMeta(depthTruncated: $depthTruncated, hasMore: $hasMore, nextCursor: $nextCursor, remaining: $remaining)';
  }
}

/// @nodoc
abstract mixin class $RepliesMetaCopyWith<$Res> {
  factory $RepliesMetaCopyWith(
          RepliesMeta value, $Res Function(RepliesMeta) _then) =
      _$RepliesMetaCopyWithImpl;
  @useResult
  $Res call(
      {bool depthTruncated, bool hasMore, String? nextCursor, int remaining});
}

/// @nodoc
class _$RepliesMetaCopyWithImpl<$Res> implements $RepliesMetaCopyWith<$Res> {
  _$RepliesMetaCopyWithImpl(this._self, this._then);

  final RepliesMeta _self;
  final $Res Function(RepliesMeta) _then;

  /// Create a copy of RepliesMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depthTruncated = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
    Object? remaining = null,
  }) {
    return _then(RepliesMeta(
      depthTruncated: null == depthTruncated
          ? _self.depthTruncated
          : depthTruncated // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _self.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      remaining: null == remaining
          ? _self.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
