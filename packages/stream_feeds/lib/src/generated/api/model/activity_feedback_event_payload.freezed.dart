// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_feedback_event_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityFeedbackEventPayload {
  ActivityFeedbackEventPayloadAction get action;
  String get activityId;
  DateTime get createdAt;
  DateTime get updatedAt;
  UserResponse get user;
  String get value;

  /// Create a copy of ActivityFeedbackEventPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityFeedbackEventPayloadCopyWith<ActivityFeedbackEventPayload>
      get copyWith => _$ActivityFeedbackEventPayloadCopyWithImpl<
              ActivityFeedbackEventPayload>(
          this as ActivityFeedbackEventPayload, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityFeedbackEventPayload &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, action, activityId, createdAt, updatedAt, user, value);

  @override
  String toString() {
    return 'ActivityFeedbackEventPayload(action: $action, activityId: $activityId, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, value: $value)';
  }
}

/// @nodoc
abstract mixin class $ActivityFeedbackEventPayloadCopyWith<$Res> {
  factory $ActivityFeedbackEventPayloadCopyWith(
          ActivityFeedbackEventPayload value,
          $Res Function(ActivityFeedbackEventPayload) _then) =
      _$ActivityFeedbackEventPayloadCopyWithImpl;
  @useResult
  $Res call(
      {ActivityFeedbackEventPayloadAction action,
      String activityId,
      DateTime createdAt,
      DateTime updatedAt,
      UserResponse user,
      String value});
}

/// @nodoc
class _$ActivityFeedbackEventPayloadCopyWithImpl<$Res>
    implements $ActivityFeedbackEventPayloadCopyWith<$Res> {
  _$ActivityFeedbackEventPayloadCopyWithImpl(this._self, this._then);

  final ActivityFeedbackEventPayload _self;
  final $Res Function(ActivityFeedbackEventPayload) _then;

  /// Create a copy of ActivityFeedbackEventPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? activityId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? value = null,
  }) {
    return _then(ActivityFeedbackEventPayload(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as ActivityFeedbackEventPayloadAction,
      activityId: null == activityId
          ? _self.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
