// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_egress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallEgress {
  int get appPk;
  String get callId;
  String get callType;
  EgressTaskConfig? get config;
  String get egressId;
  String get egressType;
  String get instanceIp;
  DateTime get startedAt;
  String get state;
  DateTime? get stoppedAt;
  DateTime get updatedAt;

  /// Create a copy of CallEgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallEgressCopyWith<CallEgress> get copyWith =>
      _$CallEgressCopyWithImpl<CallEgress>(this as CallEgress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CallEgress &&
            (identical(other.appPk, appPk) || other.appPk == appPk) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.egressId, egressId) ||
                other.egressId == egressId) &&
            (identical(other.egressType, egressType) ||
                other.egressType == egressType) &&
            (identical(other.instanceIp, instanceIp) ||
                other.instanceIp == instanceIp) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stoppedAt, stoppedAt) ||
                other.stoppedAt == stoppedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appPk, callId, callType, config,
      egressId, egressType, instanceIp, startedAt, state, stoppedAt, updatedAt);

  @override
  String toString() {
    return 'CallEgress(appPk: $appPk, callId: $callId, callType: $callType, config: $config, egressId: $egressId, egressType: $egressType, instanceIp: $instanceIp, startedAt: $startedAt, state: $state, stoppedAt: $stoppedAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CallEgressCopyWith<$Res> {
  factory $CallEgressCopyWith(
          CallEgress value, $Res Function(CallEgress) _then) =
      _$CallEgressCopyWithImpl;
  @useResult
  $Res call(
      {int appPk,
      String callId,
      String callType,
      EgressTaskConfig? config,
      String egressId,
      String egressType,
      String instanceIp,
      DateTime startedAt,
      String state,
      DateTime? stoppedAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CallEgressCopyWithImpl<$Res> implements $CallEgressCopyWith<$Res> {
  _$CallEgressCopyWithImpl(this._self, this._then);

  final CallEgress _self;
  final $Res Function(CallEgress) _then;

  /// Create a copy of CallEgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appPk = null,
    Object? callId = null,
    Object? callType = null,
    Object? config = freezed,
    Object? egressId = null,
    Object? egressType = null,
    Object? instanceIp = null,
    Object? startedAt = null,
    Object? state = null,
    Object? stoppedAt = freezed,
    Object? updatedAt = null,
  }) {
    return _then(CallEgress(
      appPk: null == appPk
          ? _self.appPk
          : appPk // ignore: cast_nullable_to_non_nullable
              as int,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      callType: null == callType
          ? _self.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as String,
      config: freezed == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as EgressTaskConfig?,
      egressId: null == egressId
          ? _self.egressId
          : egressId // ignore: cast_nullable_to_non_nullable
              as String,
      egressType: null == egressType
          ? _self.egressType
          : egressType // ignore: cast_nullable_to_non_nullable
              as String,
      instanceIp: null == instanceIp
          ? _self.instanceIp
          : instanceIp // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stoppedAt: freezed == stoppedAt
          ? _self.stoppedAt
          : stoppedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
