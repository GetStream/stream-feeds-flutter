// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_activity_metrics_event_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackActivityMetricsEventResult {

 String get activityId; bool get allowed; String? get error; String get metric;
/// Create a copy of TrackActivityMetricsEventResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackActivityMetricsEventResultCopyWith<TrackActivityMetricsEventResult> get copyWith => _$TrackActivityMetricsEventResultCopyWithImpl<TrackActivityMetricsEventResult>(this as TrackActivityMetricsEventResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackActivityMetricsEventResult&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.error, error) || other.error == error)&&(identical(other.metric, metric) || other.metric == metric));
}


@override
int get hashCode => Object.hash(runtimeType,activityId,allowed,error,metric);

@override
String toString() {
  return 'TrackActivityMetricsEventResult(activityId: $activityId, allowed: $allowed, error: $error, metric: $metric)';
}


}

/// @nodoc
abstract mixin class $TrackActivityMetricsEventResultCopyWith<$Res>  {
  factory $TrackActivityMetricsEventResultCopyWith(TrackActivityMetricsEventResult value, $Res Function(TrackActivityMetricsEventResult) _then) = _$TrackActivityMetricsEventResultCopyWithImpl;
@useResult
$Res call({
 String activityId, bool allowed, String? error, String metric
});




}
/// @nodoc
class _$TrackActivityMetricsEventResultCopyWithImpl<$Res>
    implements $TrackActivityMetricsEventResultCopyWith<$Res> {
  _$TrackActivityMetricsEventResultCopyWithImpl(this._self, this._then);

  final TrackActivityMetricsEventResult _self;
  final $Res Function(TrackActivityMetricsEventResult) _then;

/// Create a copy of TrackActivityMetricsEventResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityId = null,Object? allowed = null,Object? error = freezed,Object? metric = null,}) {
  return _then(TrackActivityMetricsEventResult(
activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String,allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
