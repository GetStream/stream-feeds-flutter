// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_review_queue_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryReviewQueueResponse {
  Map<String, List<ModerationActionConfig>> get actionConfig;
  String get duration;
  List<ReviewQueueItemResponse> get items;
  String? get next;
  String? get prev;
  Map<String, Object> get stats;

  /// Create a copy of QueryReviewQueueResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryReviewQueueResponseCopyWith<QueryReviewQueueResponse> get copyWith =>
      _$QueryReviewQueueResponseCopyWithImpl<QueryReviewQueueResponse>(
          this as QueryReviewQueueResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryReviewQueueResponse &&
            const DeepCollectionEquality()
                .equals(other.actionConfig, actionConfig) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other.stats, stats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(actionConfig),
      duration,
      const DeepCollectionEquality().hash(items),
      next,
      prev,
      const DeepCollectionEquality().hash(stats));

  @override
  String toString() {
    return 'QueryReviewQueueResponse(actionConfig: $actionConfig, duration: $duration, items: $items, next: $next, prev: $prev, stats: $stats)';
  }
}

/// @nodoc
abstract mixin class $QueryReviewQueueResponseCopyWith<$Res> {
  factory $QueryReviewQueueResponseCopyWith(QueryReviewQueueResponse value,
          $Res Function(QueryReviewQueueResponse) _then) =
      _$QueryReviewQueueResponseCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, List<ModerationActionConfig>> actionConfig,
      String duration,
      List<ReviewQueueItemResponse> items,
      String? next,
      String? prev,
      Map<String, Object> stats});
}

/// @nodoc
class _$QueryReviewQueueResponseCopyWithImpl<$Res>
    implements $QueryReviewQueueResponseCopyWith<$Res> {
  _$QueryReviewQueueResponseCopyWithImpl(this._self, this._then);

  final QueryReviewQueueResponse _self;
  final $Res Function(QueryReviewQueueResponse) _then;

  /// Create a copy of QueryReviewQueueResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionConfig = null,
    Object? duration = null,
    Object? items = null,
    Object? next = freezed,
    Object? prev = freezed,
    Object? stats = null,
  }) {
    return _then(QueryReviewQueueResponse(
      actionConfig: null == actionConfig
          ? _self.actionConfig
          : actionConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ModerationActionConfig>>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReviewQueueItemResponse>,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ));
  }
}

// dart format on
