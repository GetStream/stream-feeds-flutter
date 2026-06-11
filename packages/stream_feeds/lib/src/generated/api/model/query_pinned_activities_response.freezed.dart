// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_pinned_activities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryPinnedActivitiesResponse {
  String get duration;
  String? get next;
  List<ActivityPinResponse> get pinnedActivities;
  String? get prev;

  /// Create a copy of QueryPinnedActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryPinnedActivitiesResponseCopyWith<QueryPinnedActivitiesResponse> get copyWith =>
      _$QueryPinnedActivitiesResponseCopyWithImpl<QueryPinnedActivitiesResponse>(
        this as QueryPinnedActivitiesResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryPinnedActivitiesResponse &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(
              other.pinnedActivities,
              pinnedActivities,
            ) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    duration,
    next,
    const DeepCollectionEquality().hash(pinnedActivities),
    prev,
  );

  @override
  String toString() {
    return 'QueryPinnedActivitiesResponse(duration: $duration, next: $next, pinnedActivities: $pinnedActivities, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $QueryPinnedActivitiesResponseCopyWith<$Res> {
  factory $QueryPinnedActivitiesResponseCopyWith(
    QueryPinnedActivitiesResponse value,
    $Res Function(QueryPinnedActivitiesResponse) _then,
  ) = _$QueryPinnedActivitiesResponseCopyWithImpl;
  @useResult
  $Res call({
    String duration,
    String? next,
    List<ActivityPinResponse> pinnedActivities,
    String? prev,
  });
}

/// @nodoc
class _$QueryPinnedActivitiesResponseCopyWithImpl<$Res> implements $QueryPinnedActivitiesResponseCopyWith<$Res> {
  _$QueryPinnedActivitiesResponseCopyWithImpl(this._self, this._then);

  final QueryPinnedActivitiesResponse _self;
  final $Res Function(QueryPinnedActivitiesResponse) _then;

  /// Create a copy of QueryPinnedActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? next = freezed,
    Object? pinnedActivities = null,
    Object? prev = freezed,
  }) {
    return _then(
      QueryPinnedActivitiesResponse(
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String,
        next: freezed == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as String?,
        pinnedActivities: null == pinnedActivities
            ? _self.pinnedActivities
            : pinnedActivities // ignore: cast_nullable_to_non_nullable
                  as List<ActivityPinResponse>,
        prev: freezed == prev
            ? _self.prev
            : prev // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
