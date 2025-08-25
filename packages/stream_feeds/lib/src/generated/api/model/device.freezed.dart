// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Device {
  DateTime get createdAt;
  bool? get disabled;
  String? get disabledReason;
  String get id;
  DevicePushProvider get pushProvider;
  String? get pushProviderName;
  String get userId;
  bool? get voip;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<Device> get copyWith =>
      _$DeviceCopyWithImpl<Device>(this as Device, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Device &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.disabledReason, disabledReason) ||
                other.disabledReason == disabledReason) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pushProvider, pushProvider) ||
                other.pushProvider == pushProvider) &&
            (identical(other.pushProviderName, pushProviderName) ||
                other.pushProviderName == pushProviderName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.voip, voip) || other.voip == voip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, disabled,
      disabledReason, id, pushProvider, pushProviderName, userId, voip);

  @override
  String toString() {
    return 'Device(createdAt: $createdAt, disabled: $disabled, disabledReason: $disabledReason, id: $id, pushProvider: $pushProvider, pushProviderName: $pushProviderName, userId: $userId, voip: $voip)';
  }
}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) =
      _$DeviceCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      bool? disabled,
      String? disabledReason,
      String id,
      DevicePushProvider pushProvider,
      String? pushProviderName,
      String userId,
      bool? voip});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res> implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? disabled = freezed,
    Object? disabledReason = freezed,
    Object? id = null,
    Object? pushProvider = null,
    Object? pushProviderName = freezed,
    Object? userId = null,
    Object? voip = freezed,
  }) {
    return _then(Device(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      disabled: freezed == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      disabledReason: freezed == disabledReason
          ? _self.disabledReason
          : disabledReason // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pushProvider: null == pushProvider
          ? _self.pushProvider
          : pushProvider // ignore: cast_nullable_to_non_nullable
              as DevicePushProvider,
      pushProviderName: freezed == pushProviderName
          ? _self.pushProviderName
          : pushProviderName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      voip: freezed == voip
          ? _self.voip
          : voip // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
