// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateActivityResponse {
  ActivityResponse get activity;
  String get duration;

  /// Create a copy of UpdateActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateActivityResponseCopyWith<UpdateActivityResponse> get copyWith =>
      _$UpdateActivityResponseCopyWithImpl<UpdateActivityResponse>(
          this as UpdateActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateActivityResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, duration);

  @override
  String toString() {
    return 'UpdateActivityResponse(activity: $activity, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpdateActivityResponseCopyWith<$Res> {
  factory $UpdateActivityResponseCopyWith(UpdateActivityResponse value,
          $Res Function(UpdateActivityResponse) _then) =
      _$UpdateActivityResponseCopyWithImpl;
  @useResult
  $Res call({ActivityResponse activity, String duration});
}

/// @nodoc
class _$UpdateActivityResponseCopyWithImpl<$Res>
    implements $UpdateActivityResponseCopyWith<$Res> {
  _$UpdateActivityResponseCopyWithImpl(this._self, this._then);

  final UpdateActivityResponse _self;
  final $Res Function(UpdateActivityResponse) _then;

  /// Create a copy of UpdateActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? duration = null,
  }) {
    return _then(UpdateActivityResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
