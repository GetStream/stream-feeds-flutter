// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_feeds_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryFeedsResponse {
  String get duration;
  List<FeedResponse> get feeds;
  String? get next;
  String? get prev;

  /// Create a copy of QueryFeedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryFeedsResponseCopyWith<QueryFeedsResponse> get copyWith =>
      _$QueryFeedsResponseCopyWithImpl<QueryFeedsResponse>(
          this as QueryFeedsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryFeedsResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration,
      const DeepCollectionEquality().hash(feeds), next, prev);

  @override
  String toString() {
    return 'QueryFeedsResponse(duration: $duration, feeds: $feeds, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $QueryFeedsResponseCopyWith<$Res> {
  factory $QueryFeedsResponseCopyWith(
          QueryFeedsResponse value, $Res Function(QueryFeedsResponse) _then) =
      _$QueryFeedsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String duration, List<FeedResponse> feeds, String? next, String? prev});
}

/// @nodoc
class _$QueryFeedsResponseCopyWithImpl<$Res>
    implements $QueryFeedsResponseCopyWith<$Res> {
  _$QueryFeedsResponseCopyWithImpl(this._self, this._then);

  final QueryFeedsResponse _self;
  final $Res Function(QueryFeedsResponse) _then;

  /// Create a copy of QueryFeedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? feeds = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(QueryFeedsResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<FeedResponse>,
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
