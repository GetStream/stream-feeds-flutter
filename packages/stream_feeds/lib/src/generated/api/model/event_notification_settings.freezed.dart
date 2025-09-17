// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_notification_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventNotificationSettings {
  APNS get apns;
  bool get enabled;
  FCM get fcm;

  /// Create a copy of EventNotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventNotificationSettingsCopyWith<EventNotificationSettings> get copyWith =>
      _$EventNotificationSettingsCopyWithImpl<EventNotificationSettings>(
          this as EventNotificationSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventNotificationSettings &&
            (identical(other.apns, apns) || other.apns == apns) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.fcm, fcm) || other.fcm == fcm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apns, enabled, fcm);

  @override
  String toString() {
    return 'EventNotificationSettings(apns: $apns, enabled: $enabled, fcm: $fcm)';
  }
}

/// @nodoc
abstract mixin class $EventNotificationSettingsCopyWith<$Res> {
  factory $EventNotificationSettingsCopyWith(EventNotificationSettings value,
          $Res Function(EventNotificationSettings) _then) =
      _$EventNotificationSettingsCopyWithImpl;
  @useResult
  $Res call({APNS apns, bool enabled, FCM fcm});
}

/// @nodoc
class _$EventNotificationSettingsCopyWithImpl<$Res>
    implements $EventNotificationSettingsCopyWith<$Res> {
  _$EventNotificationSettingsCopyWithImpl(this._self, this._then);

  final EventNotificationSettings _self;
  final $Res Function(EventNotificationSettings) _then;

  /// Create a copy of EventNotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apns = null,
    Object? enabled = null,
    Object? fcm = null,
  }) {
    return _then(EventNotificationSettings(
      apns: null == apns
          ? _self.apns
          : apns // ignore: cast_nullable_to_non_nullable
              as APNS,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fcm: null == fcm
          ? _self.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as FCM,
    ));
  }
}

// dart format on
