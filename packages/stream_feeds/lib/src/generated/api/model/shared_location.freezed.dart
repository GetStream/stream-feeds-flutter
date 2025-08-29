// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SharedLocation {
  Channel? get channel;
  String get channelCid;
  DateTime get createdAt;
  String get createdByDeviceId;
  DateTime? get endAt;
  double? get latitude;
  double? get longitude;
  Message? get message;
  String get messageId;
  DateTime get updatedAt;
  String get userId;

  /// Create a copy of SharedLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SharedLocationCopyWith<SharedLocation> get copyWith =>
      _$SharedLocationCopyWithImpl<SharedLocation>(
          this as SharedLocation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SharedLocation &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.channelCid, channelCid) ||
                other.channelCid == channelCid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdByDeviceId, createdByDeviceId) ||
                other.createdByDeviceId == createdByDeviceId) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      channel,
      channelCid,
      createdAt,
      createdByDeviceId,
      endAt,
      latitude,
      longitude,
      message,
      messageId,
      updatedAt,
      userId);

  @override
  String toString() {
    return 'SharedLocation(channel: $channel, channelCid: $channelCid, createdAt: $createdAt, createdByDeviceId: $createdByDeviceId, endAt: $endAt, latitude: $latitude, longitude: $longitude, message: $message, messageId: $messageId, updatedAt: $updatedAt, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $SharedLocationCopyWith<$Res> {
  factory $SharedLocationCopyWith(
          SharedLocation value, $Res Function(SharedLocation) _then) =
      _$SharedLocationCopyWithImpl;
  @useResult
  $Res call(
      {Channel? channel,
      String channelCid,
      DateTime createdAt,
      String createdByDeviceId,
      DateTime? endAt,
      double? latitude,
      double? longitude,
      Message? message,
      String messageId,
      DateTime updatedAt,
      String userId});
}

/// @nodoc
class _$SharedLocationCopyWithImpl<$Res>
    implements $SharedLocationCopyWith<$Res> {
  _$SharedLocationCopyWithImpl(this._self, this._then);

  final SharedLocation _self;
  final $Res Function(SharedLocation) _then;

  /// Create a copy of SharedLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = freezed,
    Object? channelCid = null,
    Object? createdAt = null,
    Object? createdByDeviceId = null,
    Object? endAt = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? message = freezed,
    Object? messageId = null,
    Object? updatedAt = null,
    Object? userId = null,
  }) {
    return _then(SharedLocation(
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelCid: null == channelCid
          ? _self.channelCid
          : channelCid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByDeviceId: null == createdByDeviceId
          ? _self.createdByDeviceId
          : createdByDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _self.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
