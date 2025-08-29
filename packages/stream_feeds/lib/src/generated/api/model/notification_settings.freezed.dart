// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationSettings {
  EventNotificationSettings get callLiveStarted;
  EventNotificationSettings get callMissed;
  EventNotificationSettings get callNotification;
  EventNotificationSettings get callRing;
  bool get enabled;
  EventNotificationSettings get sessionStarted;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      _$NotificationSettingsCopyWithImpl<NotificationSettings>(
          this as NotificationSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSettings &&
            (identical(other.callLiveStarted, callLiveStarted) ||
                other.callLiveStarted == callLiveStarted) &&
            (identical(other.callMissed, callMissed) ||
                other.callMissed == callMissed) &&
            (identical(other.callNotification, callNotification) ||
                other.callNotification == callNotification) &&
            (identical(other.callRing, callRing) ||
                other.callRing == callRing) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sessionStarted, sessionStarted) ||
                other.sessionStarted == sessionStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callLiveStarted, callMissed,
      callNotification, callRing, enabled, sessionStarted);

  @override
  String toString() {
    return 'NotificationSettings(callLiveStarted: $callLiveStarted, callMissed: $callMissed, callNotification: $callNotification, callRing: $callRing, enabled: $enabled, sessionStarted: $sessionStarted)';
  }
}

/// @nodoc
abstract mixin class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) _then) =
      _$NotificationSettingsCopyWithImpl;
  @useResult
  $Res call(
      {EventNotificationSettings callLiveStarted,
      EventNotificationSettings callMissed,
      EventNotificationSettings callNotification,
      EventNotificationSettings callRing,
      bool enabled,
      EventNotificationSettings sessionStarted});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._self, this._then);

  final NotificationSettings _self;
  final $Res Function(NotificationSettings) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callLiveStarted = null,
    Object? callMissed = null,
    Object? callNotification = null,
    Object? callRing = null,
    Object? enabled = null,
    Object? sessionStarted = null,
  }) {
    return _then(NotificationSettings(
      callLiveStarted: null == callLiveStarted
          ? _self.callLiveStarted
          : callLiveStarted // ignore: cast_nullable_to_non_nullable
              as EventNotificationSettings,
      callMissed: null == callMissed
          ? _self.callMissed
          : callMissed // ignore: cast_nullable_to_non_nullable
              as EventNotificationSettings,
      callNotification: null == callNotification
          ? _self.callNotification
          : callNotification // ignore: cast_nullable_to_non_nullable
              as EventNotificationSettings,
      callRing: null == callRing
          ? _self.callRing
          : callRing // ignore: cast_nullable_to_non_nullable
              as EventNotificationSettings,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionStarted: null == sessionStarted
          ? _self.sessionStarted
          : sessionStarted // ignore: cast_nullable_to_non_nullable
              as EventNotificationSettings,
    ));
  }
}

// dart format on
