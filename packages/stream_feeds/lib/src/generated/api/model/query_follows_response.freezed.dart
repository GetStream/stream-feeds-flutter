// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_follows_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryFollowsResponse {
  String get duration;
  List<FollowResponse> get follows;
  String? get next;
  String? get prev;

  /// Create a copy of QueryFollowsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryFollowsResponseCopyWith<QueryFollowsResponse> get copyWith =>
      _$QueryFollowsResponseCopyWithImpl<QueryFollowsResponse>(
          this as QueryFollowsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryFollowsResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.follows, follows) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration,
      const DeepCollectionEquality().hash(follows), next, prev);

  @override
  String toString() {
    return 'QueryFollowsResponse(duration: $duration, follows: $follows, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $QueryFollowsResponseCopyWith<$Res> {
  factory $QueryFollowsResponseCopyWith(QueryFollowsResponse value,
          $Res Function(QueryFollowsResponse) _then) =
      _$QueryFollowsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String duration,
      List<FollowResponse> follows,
      String? next,
      String? prev});
}

/// @nodoc
class _$QueryFollowsResponseCopyWithImpl<$Res>
    implements $QueryFollowsResponseCopyWith<$Res> {
  _$QueryFollowsResponseCopyWithImpl(this._self, this._then);

  final QueryFollowsResponse _self;
  final $Res Function(QueryFollowsResponse) _then;

  /// Create a copy of QueryFollowsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? follows = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(QueryFollowsResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      follows: null == follows
          ? _self.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<FollowResponse>,
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
