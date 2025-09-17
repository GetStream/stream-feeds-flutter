// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notifications_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushNotificationsConfig {
  PushProviderInfo get pushProviderInfo;

  /// Create a copy of PushNotificationsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PushNotificationsConfigCopyWith<PushNotificationsConfig> get copyWith =>
      _$PushNotificationsConfigCopyWithImpl<PushNotificationsConfig>(
          this as PushNotificationsConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushNotificationsConfig &&
            (identical(other.pushProviderInfo, pushProviderInfo) ||
                other.pushProviderInfo == pushProviderInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pushProviderInfo);

  @override
  String toString() {
    return 'PushNotificationsConfig(pushProviderInfo: $pushProviderInfo)';
  }
}

/// @nodoc
abstract mixin class $PushNotificationsConfigCopyWith<$Res> {
  factory $PushNotificationsConfigCopyWith(PushNotificationsConfig value,
          $Res Function(PushNotificationsConfig) _then) =
      _$PushNotificationsConfigCopyWithImpl;
  @useResult
  $Res call({PushProviderInfo pushProviderInfo});
}

/// @nodoc
class _$PushNotificationsConfigCopyWithImpl<$Res>
    implements $PushNotificationsConfigCopyWith<$Res> {
  _$PushNotificationsConfigCopyWithImpl(this._self, this._then);

  final PushNotificationsConfig _self;
  final $Res Function(PushNotificationsConfig) _then;

  /// Create a copy of PushNotificationsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushProviderInfo = null,
  }) {
    return _then(PushNotificationsConfig(
      pushProviderInfo: null == pushProviderInfo
          ? _self.pushProviderInfo
          : pushProviderInfo // ignore: cast_nullable_to_non_nullable
              as PushProviderInfo,
    ));
  }
}

/// @nodoc
mixin _$PushProviderInfo {
  String get name;
  PushNotificationsProvider get pushProvider;

  /// Create a copy of PushProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PushProviderInfoCopyWith<PushProviderInfo> get copyWith =>
      _$PushProviderInfoCopyWithImpl<PushProviderInfo>(
          this as PushProviderInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushProviderInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pushProvider, pushProvider) ||
                other.pushProvider == pushProvider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, pushProvider);

  @override
  String toString() {
    return 'PushProviderInfo(name: $name, pushProvider: $pushProvider)';
  }
}

/// @nodoc
abstract mixin class $PushProviderInfoCopyWith<$Res> {
  factory $PushProviderInfoCopyWith(
          PushProviderInfo value, $Res Function(PushProviderInfo) _then) =
      _$PushProviderInfoCopyWithImpl;
  @useResult
  $Res call({String name, PushNotificationsProvider pushProvider});
}

/// @nodoc
class _$PushProviderInfoCopyWithImpl<$Res>
    implements $PushProviderInfoCopyWith<$Res> {
  _$PushProviderInfoCopyWithImpl(this._self, this._then);

  final PushProviderInfo _self;
  final $Res Function(PushProviderInfo) _then;

  /// Create a copy of PushProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? pushProvider = null,
  }) {
    return _then(PushProviderInfo(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pushProvider: null == pushProvider
          ? _self.pushProvider
          : pushProvider // ignore: cast_nullable_to_non_nullable
              as PushNotificationsProvider,
    ));
  }
}

// dart format on
