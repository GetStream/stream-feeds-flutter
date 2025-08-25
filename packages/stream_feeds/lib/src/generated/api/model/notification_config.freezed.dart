// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationConfig {
  bool? get trackRead;
  bool? get trackSeen;

  /// Create a copy of NotificationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationConfigCopyWith<NotificationConfig> get copyWith =>
      _$NotificationConfigCopyWithImpl<NotificationConfig>(
          this as NotificationConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationConfig &&
            (identical(other.trackRead, trackRead) ||
                other.trackRead == trackRead) &&
            (identical(other.trackSeen, trackSeen) ||
                other.trackSeen == trackSeen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trackRead, trackSeen);

  @override
  String toString() {
    return 'NotificationConfig(trackRead: $trackRead, trackSeen: $trackSeen)';
  }
}

/// @nodoc
abstract mixin class $NotificationConfigCopyWith<$Res> {
  factory $NotificationConfigCopyWith(
          NotificationConfig value, $Res Function(NotificationConfig) _then) =
      _$NotificationConfigCopyWithImpl;
  @useResult
  $Res call({bool? trackRead, bool? trackSeen});
}

/// @nodoc
class _$NotificationConfigCopyWithImpl<$Res>
    implements $NotificationConfigCopyWith<$Res> {
  _$NotificationConfigCopyWithImpl(this._self, this._then);

  final NotificationConfig _self;
  final $Res Function(NotificationConfig) _then;

  /// Create a copy of NotificationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackRead = freezed,
    Object? trackSeen = freezed,
  }) {
    return _then(NotificationConfig(
      trackRead: freezed == trackRead
          ? _self.trackRead
          : trackRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      trackSeen: freezed == trackSeen
          ? _self.trackSeen
          : trackSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
