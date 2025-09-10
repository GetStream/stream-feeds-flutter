// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushNotificationConfig {
  List<String>? get activityTypes;
  bool? get enabled;

  /// Create a copy of PushNotificationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PushNotificationConfigCopyWith<PushNotificationConfig> get copyWith =>
      _$PushNotificationConfigCopyWithImpl<PushNotificationConfig>(
          this as PushNotificationConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushNotificationConfig &&
            const DeepCollectionEquality()
                .equals(other.activityTypes, activityTypes) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(activityTypes), enabled);

  @override
  String toString() {
    return 'PushNotificationConfig(activityTypes: $activityTypes, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $PushNotificationConfigCopyWith<$Res> {
  factory $PushNotificationConfigCopyWith(PushNotificationConfig value,
          $Res Function(PushNotificationConfig) _then) =
      _$PushNotificationConfigCopyWithImpl;
  @useResult
  $Res call({List<String>? activityTypes, bool? enabled});
}

/// @nodoc
class _$PushNotificationConfigCopyWithImpl<$Res>
    implements $PushNotificationConfigCopyWith<$Res> {
  _$PushNotificationConfigCopyWithImpl(this._self, this._then);

  final PushNotificationConfig _self;
  final $Res Function(PushNotificationConfig) _then;

  /// Create a copy of PushNotificationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityTypes = freezed,
    Object? enabled = freezed,
  }) {
    return _then(PushNotificationConfig(
      activityTypes: freezed == activityTypes
          ? _self.activityTypes
          : activityTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enabled: freezed == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
