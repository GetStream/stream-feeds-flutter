// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_activity_metrics_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackActivityMetricsRequest {
  List<TrackActivityMetricsEvent> get events;

  /// Create a copy of TrackActivityMetricsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackActivityMetricsRequestCopyWith<TrackActivityMetricsRequest> get copyWith =>
      _$TrackActivityMetricsRequestCopyWithImpl<TrackActivityMetricsRequest>(
        this as TrackActivityMetricsRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackActivityMetricsRequest &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(events));

  @override
  String toString() {
    return 'TrackActivityMetricsRequest(events: $events)';
  }
}

/// @nodoc
abstract mixin class $TrackActivityMetricsRequestCopyWith<$Res> {
  factory $TrackActivityMetricsRequestCopyWith(
    TrackActivityMetricsRequest value,
    $Res Function(TrackActivityMetricsRequest) _then,
  ) = _$TrackActivityMetricsRequestCopyWithImpl;
  @useResult
  $Res call({List<TrackActivityMetricsEvent> events});
}

/// @nodoc
class _$TrackActivityMetricsRequestCopyWithImpl<$Res> implements $TrackActivityMetricsRequestCopyWith<$Res> {
  _$TrackActivityMetricsRequestCopyWithImpl(this._self, this._then);

  final TrackActivityMetricsRequest _self;
  final $Res Function(TrackActivityMetricsRequest) _then;

  /// Create a copy of TrackActivityMetricsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null}) {
    return _then(
      TrackActivityMetricsRequest(
        events: null == events
            ? _self.events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<TrackActivityMetricsEvent>,
      ),
    );
  }
}
