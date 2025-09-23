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
  bool? get enablePush;
  List<String>? get pushTypes;

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
            (identical(other.enablePush, enablePush) ||
                other.enablePush == enablePush) &&
            const DeepCollectionEquality().equals(other.pushTypes, pushTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, enablePush, const DeepCollectionEquality().hash(pushTypes));

  @override
  String toString() {
    return 'PushNotificationConfig(enablePush: $enablePush, pushTypes: $pushTypes)';
  }
}

/// @nodoc
abstract mixin class $PushNotificationConfigCopyWith<$Res> {
  factory $PushNotificationConfigCopyWith(PushNotificationConfig value,
          $Res Function(PushNotificationConfig) _then) =
      _$PushNotificationConfigCopyWithImpl;
  @useResult
  $Res call({bool? enablePush, List<String>? pushTypes});
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
    Object? enablePush = freezed,
    Object? pushTypes = freezed,
  }) {
    return _then(PushNotificationConfig(
      enablePush: freezed == enablePush
          ? _self.enablePush
          : enablePush // ignore: cast_nullable_to_non_nullable
              as bool?,
      pushTypes: freezed == pushTypes
          ? _self.pushTypes
          : pushTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
