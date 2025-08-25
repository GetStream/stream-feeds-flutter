// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddActivityResponse {
  ActivityResponse get activity;
  String get duration;

  /// Create a copy of AddActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddActivityResponseCopyWith<AddActivityResponse> get copyWith =>
      _$AddActivityResponseCopyWithImpl<AddActivityResponse>(
          this as AddActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddActivityResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, duration);

  @override
  String toString() {
    return 'AddActivityResponse(activity: $activity, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $AddActivityResponseCopyWith<$Res> {
  factory $AddActivityResponseCopyWith(
          AddActivityResponse value, $Res Function(AddActivityResponse) _then) =
      _$AddActivityResponseCopyWithImpl;
  @useResult
  $Res call({ActivityResponse activity, String duration});
}

/// @nodoc
class _$AddActivityResponseCopyWithImpl<$Res>
    implements $AddActivityResponseCopyWith<$Res> {
  _$AddActivityResponseCopyWithImpl(this._self, this._then);

  final AddActivityResponse _self;
  final $Res Function(AddActivityResponse) _then;

  /// Create a copy of AddActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? duration = null,
  }) {
    return _then(AddActivityResponse(
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
