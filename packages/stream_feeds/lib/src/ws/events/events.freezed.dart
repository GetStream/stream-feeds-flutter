// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthCheckEvent {
  String? get cid;
  String get connectionId;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  OwnUserResponse? get me;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of HealthCheckEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HealthCheckEventCopyWith<HealthCheckEvent> get copyWith =>
      _$HealthCheckEventCopyWithImpl<HealthCheckEvent>(
          this as HealthCheckEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HealthCheckEvent &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cid, connectionId, createdAt,
      const DeepCollectionEquality().hash(custom), me, receivedAt, type);

  @override
  String toString() {
    return 'HealthCheckEvent(cid: $cid, connectionId: $connectionId, createdAt: $createdAt, custom: $custom, me: $me, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $HealthCheckEventCopyWith<$Res> {
  factory $HealthCheckEventCopyWith(
          HealthCheckEvent value, $Res Function(HealthCheckEvent) _then) =
      _$HealthCheckEventCopyWithImpl;
  @useResult
  $Res call(
      {String? cid,
      String connectionId,
      DateTime createdAt,
      Map<String, Object?> custom,
      OwnUserResponse? me,
      DateTime? receivedAt,
      String type});
}

/// @nodoc
class _$HealthCheckEventCopyWithImpl<$Res>
    implements $HealthCheckEventCopyWith<$Res> {
  _$HealthCheckEventCopyWithImpl(this._self, this._then);

  final HealthCheckEvent _self;
  final $Res Function(HealthCheckEvent) _then;

  /// Create a copy of HealthCheckEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = freezed,
    Object? connectionId = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? me = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(HealthCheckEvent(
      cid: freezed == cid
          ? _self.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
      connectionId: null == connectionId
          ? _self.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      me: freezed == me
          ? _self.me
          : me // ignore: cast_nullable_to_non_nullable
              as OwnUserResponse?,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ConnectedEvent {
  String get connectionId;
  DateTime get createdAt;
  OwnUserResponse get me;
  String get type;

  /// Create a copy of ConnectedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectedEventCopyWith<ConnectedEvent> get copyWith =>
      _$ConnectedEventCopyWithImpl<ConnectedEvent>(
          this as ConnectedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectedEvent &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, connectionId, createdAt, me, type);

  @override
  String toString() {
    return 'ConnectedEvent(connectionId: $connectionId, createdAt: $createdAt, me: $me, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ConnectedEventCopyWith<$Res> {
  factory $ConnectedEventCopyWith(
          ConnectedEvent value, $Res Function(ConnectedEvent) _then) =
      _$ConnectedEventCopyWithImpl;
  @useResult
  $Res call(
      {String connectionId,
      DateTime createdAt,
      OwnUserResponse me,
      String type});
}

/// @nodoc
class _$ConnectedEventCopyWithImpl<$Res>
    implements $ConnectedEventCopyWith<$Res> {
  _$ConnectedEventCopyWithImpl(this._self, this._then);

  final ConnectedEvent _self;
  final $Res Function(ConnectedEvent) _then;

  /// Create a copy of ConnectedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionId = null,
    Object? createdAt = null,
    Object? me = null,
    Object? type = null,
  }) {
    return _then(ConnectedEvent(
      connectionId: null == connectionId
          ? _self.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      me: null == me
          ? _self.me
          : me // ignore: cast_nullable_to_non_nullable
              as OwnUserResponse,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ConnectionErrorEvent {
  String get connectionId;
  DateTime get createdAt;
  StreamApiError get error;
  String get type;

  /// Create a copy of ConnectionErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionErrorEventCopyWith<ConnectionErrorEvent> get copyWith =>
      _$ConnectionErrorEventCopyWithImpl<ConnectionErrorEvent>(
          this as ConnectionErrorEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectionErrorEvent &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, connectionId, createdAt, error, type);

  @override
  String toString() {
    return 'ConnectionErrorEvent(connectionId: $connectionId, createdAt: $createdAt, error: $error, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ConnectionErrorEventCopyWith<$Res> {
  factory $ConnectionErrorEventCopyWith(ConnectionErrorEvent value,
          $Res Function(ConnectionErrorEvent) _then) =
      _$ConnectionErrorEventCopyWithImpl;
  @useResult
  $Res call(
      {String connectionId,
      DateTime createdAt,
      StreamApiError error,
      String type});
}

/// @nodoc
class _$ConnectionErrorEventCopyWithImpl<$Res>
    implements $ConnectionErrorEventCopyWith<$Res> {
  _$ConnectionErrorEventCopyWithImpl(this._self, this._then);

  final ConnectionErrorEvent _self;
  final $Res Function(ConnectionErrorEvent) _then;

  /// Create a copy of ConnectionErrorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionId = null,
    Object? createdAt = null,
    Object? error = null,
    Object? type = null,
  }) {
    return _then(ConnectionErrorEvent(
      connectionId: null == connectionId
          ? _self.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as StreamApiError,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
