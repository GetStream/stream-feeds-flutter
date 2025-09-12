// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ban_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BanActionRequest {
  bool? get channelBanOnly;
  BanActionRequestDeleteMessages? get deleteMessages;
  bool? get ipBan;
  String? get reason;
  bool? get shadow;
  int? get timeout;

  /// Create a copy of BanActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BanActionRequestCopyWith<BanActionRequest> get copyWith =>
      _$BanActionRequestCopyWithImpl<BanActionRequest>(
          this as BanActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BanActionRequest &&
            (identical(other.channelBanOnly, channelBanOnly) ||
                other.channelBanOnly == channelBanOnly) &&
            (identical(other.deleteMessages, deleteMessages) ||
                other.deleteMessages == deleteMessages) &&
            (identical(other.ipBan, ipBan) || other.ipBan == ipBan) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelBanOnly, deleteMessages,
      ipBan, reason, shadow, timeout);

  @override
  String toString() {
    return 'BanActionRequest(channelBanOnly: $channelBanOnly, deleteMessages: $deleteMessages, ipBan: $ipBan, reason: $reason, shadow: $shadow, timeout: $timeout)';
  }
}

/// @nodoc
abstract mixin class $BanActionRequestCopyWith<$Res> {
  factory $BanActionRequestCopyWith(
          BanActionRequest value, $Res Function(BanActionRequest) _then) =
      _$BanActionRequestCopyWithImpl;
  @useResult
  $Res call(
      {bool? channelBanOnly,
      BanActionRequestDeleteMessages? deleteMessages,
      bool? ipBan,
      String? reason,
      bool? shadow,
      int? timeout});
}

/// @nodoc
class _$BanActionRequestCopyWithImpl<$Res>
    implements $BanActionRequestCopyWith<$Res> {
  _$BanActionRequestCopyWithImpl(this._self, this._then);

  final BanActionRequest _self;
  final $Res Function(BanActionRequest) _then;

  /// Create a copy of BanActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelBanOnly = freezed,
    Object? deleteMessages = freezed,
    Object? ipBan = freezed,
    Object? reason = freezed,
    Object? shadow = freezed,
    Object? timeout = freezed,
  }) {
    return _then(BanActionRequest(
      channelBanOnly: freezed == channelBanOnly
          ? _self.channelBanOnly
          : channelBanOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      deleteMessages: freezed == deleteMessages
          ? _self.deleteMessages
          : deleteMessages // ignore: cast_nullable_to_non_nullable
              as BanActionRequestDeleteMessages?,
      ipBan: freezed == ipBan
          ? _self.ipBan
          : ipBan // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      shadow: freezed == shadow
          ? _self.shadow
          : shadow // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeout: freezed == timeout
          ? _self.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
