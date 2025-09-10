// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pager_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagerResponse {
  String? get next;
  String? get prev;

  /// Create a copy of PagerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PagerResponseCopyWith<PagerResponse> get copyWith =>
      _$PagerResponseCopyWithImpl<PagerResponse>(
          this as PagerResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PagerResponse &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType, next, prev);

  @override
  String toString() {
    return 'PagerResponse(next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $PagerResponseCopyWith<$Res> {
  factory $PagerResponseCopyWith(
          PagerResponse value, $Res Function(PagerResponse) _then) =
      _$PagerResponseCopyWithImpl;
  @useResult
  $Res call({String? next, String? prev});
}

/// @nodoc
class _$PagerResponseCopyWithImpl<$Res>
    implements $PagerResponseCopyWith<$Res> {
  _$PagerResponseCopyWithImpl(this._self, this._then);

  final PagerResponse _self;
  final $Res Function(PagerResponse) _then;

  /// Create a copy of PagerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(PagerResponse(
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
