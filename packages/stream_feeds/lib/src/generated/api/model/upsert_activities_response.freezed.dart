// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_activities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertActivitiesResponse {
  List<ActivityResponse> get activities;
  String get duration;

  /// Create a copy of UpsertActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpsertActivitiesResponseCopyWith<UpsertActivitiesResponse> get copyWith =>
      _$UpsertActivitiesResponseCopyWithImpl<UpsertActivitiesResponse>(
          this as UpsertActivitiesResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpsertActivitiesResponse &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(activities), duration);

  @override
  String toString() {
    return 'UpsertActivitiesResponse(activities: $activities, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpsertActivitiesResponseCopyWith<$Res> {
  factory $UpsertActivitiesResponseCopyWith(UpsertActivitiesResponse value,
          $Res Function(UpsertActivitiesResponse) _then) =
      _$UpsertActivitiesResponseCopyWithImpl;
  @useResult
  $Res call({List<ActivityResponse> activities, String duration});
}

/// @nodoc
class _$UpsertActivitiesResponseCopyWithImpl<$Res>
    implements $UpsertActivitiesResponseCopyWith<$Res> {
  _$UpsertActivitiesResponseCopyWithImpl(this._self, this._then);

  final UpsertActivitiesResponse _self;
  final $Res Function(UpsertActivitiesResponse) _then;

  /// Create a copy of UpsertActivitiesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
    Object? duration = null,
  }) {
    return _then(UpsertActivitiesResponse(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityResponse>,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
