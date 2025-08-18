// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ban.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ban {
  Channel? get channel;
  DateTime get createdAt;
  User? get createdBy;
  DateTime? get expires;
  String? get reason;
  bool get shadow;
  User? get target;

  /// Create a copy of Ban
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BanCopyWith<Ban> get copyWith =>
      _$BanCopyWithImpl<Ban>(this as Ban, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ban &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.expires, expires) || other.expires == expires) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channel, createdAt, createdBy,
      expires, reason, shadow, target);

  @override
  String toString() {
    return 'Ban(channel: $channel, createdAt: $createdAt, createdBy: $createdBy, expires: $expires, reason: $reason, shadow: $shadow, target: $target)';
  }
}

/// @nodoc
abstract mixin class $BanCopyWith<$Res> {
  factory $BanCopyWith(Ban value, $Res Function(Ban) _then) = _$BanCopyWithImpl;
  @useResult
  $Res call(
      {Channel? channel,
      DateTime createdAt,
      User? createdBy,
      DateTime? expires,
      String? reason,
      bool shadow,
      User? target});
}

/// @nodoc
class _$BanCopyWithImpl<$Res> implements $BanCopyWith<$Res> {
  _$BanCopyWithImpl(this._self, this._then);

  final Ban _self;
  final $Res Function(Ban) _then;

  /// Create a copy of Ban
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? expires = freezed,
    Object? reason = freezed,
    Object? shadow = null,
    Object? target = freezed,
  }) {
    return _then(Ban(
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      expires: freezed == expires
          ? _self.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      shadow: null == shadow
          ? _self.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as bool,
      target: freezed == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

// dart format on
