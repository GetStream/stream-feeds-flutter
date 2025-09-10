// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_activities_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertActivitiesRequest {
  List<ActivityRequest> get activities;

  /// Create a copy of UpsertActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpsertActivitiesRequestCopyWith<UpsertActivitiesRequest> get copyWith =>
      _$UpsertActivitiesRequestCopyWithImpl<UpsertActivitiesRequest>(
          this as UpsertActivitiesRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpsertActivitiesRequest &&
            const DeepCollectionEquality()
                .equals(other.activities, activities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(activities));

  @override
  String toString() {
    return 'UpsertActivitiesRequest(activities: $activities)';
  }
}

/// @nodoc
abstract mixin class $UpsertActivitiesRequestCopyWith<$Res> {
  factory $UpsertActivitiesRequestCopyWith(UpsertActivitiesRequest value,
          $Res Function(UpsertActivitiesRequest) _then) =
      _$UpsertActivitiesRequestCopyWithImpl;
  @useResult
  $Res call({List<ActivityRequest> activities});
}

/// @nodoc
class _$UpsertActivitiesRequestCopyWithImpl<$Res>
    implements $UpsertActivitiesRequestCopyWith<$Res> {
  _$UpsertActivitiesRequestCopyWithImpl(this._self, this._then);

  final UpsertActivitiesRequest _self;
  final $Res Function(UpsertActivitiesRequest) _then;

  /// Create a copy of UpsertActivitiesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
  }) {
    return _then(UpsertActivitiesRequest(
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityRequest>,
    ));
  }
}

// dart format on
