// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_member_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelMemberResponse {
  String get channelRole;

  /// Create a copy of ChannelMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelMemberResponseCopyWith<ChannelMemberResponse> get copyWith =>
      _$ChannelMemberResponseCopyWithImpl<ChannelMemberResponse>(
          this as ChannelMemberResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelMemberResponse &&
            (identical(other.channelRole, channelRole) ||
                other.channelRole == channelRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelRole);

  @override
  String toString() {
    return 'ChannelMemberResponse(channelRole: $channelRole)';
  }
}

/// @nodoc
abstract mixin class $ChannelMemberResponseCopyWith<$Res> {
  factory $ChannelMemberResponseCopyWith(ChannelMemberResponse value,
          $Res Function(ChannelMemberResponse) _then) =
      _$ChannelMemberResponseCopyWithImpl;
  @useResult
  $Res call({String channelRole});
}

/// @nodoc
class _$ChannelMemberResponseCopyWithImpl<$Res>
    implements $ChannelMemberResponseCopyWith<$Res> {
  _$ChannelMemberResponseCopyWithImpl(this._self, this._then);

  final ChannelMemberResponse _self;
  final $Res Function(ChannelMemberResponse) _then;

  /// Create a copy of ChannelMemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelRole = null,
  }) {
    return _then(ChannelMemberResponse(
      channelRole: null == channelRole
          ? _self.channelRole
          : channelRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
