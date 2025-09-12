// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_feedback_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityFeedbackResponse {
  String get activityId;
  String get duration;

  /// Create a copy of ActivityFeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityFeedbackResponseCopyWith<ActivityFeedbackResponse> get copyWith =>
      _$ActivityFeedbackResponseCopyWithImpl<ActivityFeedbackResponse>(
          this as ActivityFeedbackResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityFeedbackResponse &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activityId, duration);

  @override
  String toString() {
    return 'ActivityFeedbackResponse(activityId: $activityId, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $ActivityFeedbackResponseCopyWith<$Res> {
  factory $ActivityFeedbackResponseCopyWith(ActivityFeedbackResponse value,
          $Res Function(ActivityFeedbackResponse) _then) =
      _$ActivityFeedbackResponseCopyWithImpl;
  @useResult
  $Res call({String activityId, String duration});
}

/// @nodoc
class _$ActivityFeedbackResponseCopyWithImpl<$Res>
    implements $ActivityFeedbackResponseCopyWith<$Res> {
  _$ActivityFeedbackResponseCopyWithImpl(this._self, this._then);

  final ActivityFeedbackResponse _self;
  final $Res Function(ActivityFeedbackResponse) _then;

  /// Create a copy of ActivityFeedbackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? duration = null,
  }) {
    return _then(ActivityFeedbackResponse(
      activityId: null == activityId
          ? _self.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
