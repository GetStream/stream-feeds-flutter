// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationContext {
  NotificationTarget? get target;
  NotificationTrigger? get trigger;

  /// Create a copy of NotificationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationContextCopyWith<NotificationContext> get copyWith =>
      _$NotificationContextCopyWithImpl<NotificationContext>(
          this as NotificationContext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationContext &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.trigger, trigger) || other.trigger == trigger));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target, trigger);

  @override
  String toString() {
    return 'NotificationContext(target: $target, trigger: $trigger)';
  }
}

/// @nodoc
abstract mixin class $NotificationContextCopyWith<$Res> {
  factory $NotificationContextCopyWith(
          NotificationContext value, $Res Function(NotificationContext) _then) =
      _$NotificationContextCopyWithImpl;
  @useResult
  $Res call({NotificationTarget? target, NotificationTrigger? trigger});
}

/// @nodoc
class _$NotificationContextCopyWithImpl<$Res>
    implements $NotificationContextCopyWith<$Res> {
  _$NotificationContextCopyWithImpl(this._self, this._then);

  final NotificationContext _self;
  final $Res Function(NotificationContext) _then;

  /// Create a copy of NotificationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = freezed,
    Object? trigger = freezed,
  }) {
    return _then(NotificationContext(
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as NotificationTarget?,
      trigger: freezed == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as NotificationTrigger?,
    ));
  }
}

// dart format on
