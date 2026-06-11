// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_activity_metrics_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackActivityMetricsEvent {
  String get activityId;
  int? get delta;
  String get metric;

  /// Create a copy of TrackActivityMetricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackActivityMetricsEventCopyWith<TrackActivityMetricsEvent> get copyWith =>
      _$TrackActivityMetricsEventCopyWithImpl<TrackActivityMetricsEvent>(
        this as TrackActivityMetricsEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackActivityMetricsEvent &&
            (identical(other.activityId, activityId) || other.activityId == activityId) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.metric, metric) || other.metric == metric));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activityId, delta, metric);

  @override
  String toString() {
    return 'TrackActivityMetricsEvent(activityId: $activityId, delta: $delta, metric: $metric)';
  }
}

/// @nodoc
abstract mixin class $TrackActivityMetricsEventCopyWith<$Res> {
  factory $TrackActivityMetricsEventCopyWith(
    TrackActivityMetricsEvent value,
    $Res Function(TrackActivityMetricsEvent) _then,
  ) = _$TrackActivityMetricsEventCopyWithImpl;
  @useResult
  $Res call({String activityId, int? delta, String metric});
}

/// @nodoc
class _$TrackActivityMetricsEventCopyWithImpl<$Res> implements $TrackActivityMetricsEventCopyWith<$Res> {
  _$TrackActivityMetricsEventCopyWithImpl(this._self, this._then);

  final TrackActivityMetricsEvent _self;
  final $Res Function(TrackActivityMetricsEvent) _then;

  /// Create a copy of TrackActivityMetricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? delta = freezed,
    Object? metric = null,
  }) {
    return _then(
      TrackActivityMetricsEvent(
        activityId: null == activityId
            ? _self.activityId
            : activityId // ignore: cast_nullable_to_non_nullable
                  as String,
        delta: freezed == delta
            ? _self.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as int?,
        metric: null == metric
            ? _self.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
