// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_activity_metrics_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackActivityMetricsResponse {

 String get duration; List<TrackActivityMetricsEventResult> get results;
/// Create a copy of TrackActivityMetricsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackActivityMetricsResponseCopyWith<TrackActivityMetricsResponse> get copyWith => _$TrackActivityMetricsResponseCopyWithImpl<TrackActivityMetricsResponse>(this as TrackActivityMetricsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackActivityMetricsResponse&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.results, results));
}


@override
int get hashCode => Object.hash(runtimeType,duration,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'TrackActivityMetricsResponse(duration: $duration, results: $results)';
}


}

/// @nodoc
abstract mixin class $TrackActivityMetricsResponseCopyWith<$Res>  {
  factory $TrackActivityMetricsResponseCopyWith(TrackActivityMetricsResponse value, $Res Function(TrackActivityMetricsResponse) _then) = _$TrackActivityMetricsResponseCopyWithImpl;
@useResult
$Res call({
 String duration, List<TrackActivityMetricsEventResult> results
});




}
/// @nodoc
class _$TrackActivityMetricsResponseCopyWithImpl<$Res>
    implements $TrackActivityMetricsResponseCopyWith<$Res> {
  _$TrackActivityMetricsResponseCopyWithImpl(this._self, this._then);

  final TrackActivityMetricsResponse _self;
  final $Res Function(TrackActivityMetricsResponse) _then;

/// Create a copy of TrackActivityMetricsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? duration = null,Object? results = null,}) {
  return _then(TrackActivityMetricsResponse(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<TrackActivityMetricsEventResult>,
  ));
}

}



// dart format on
