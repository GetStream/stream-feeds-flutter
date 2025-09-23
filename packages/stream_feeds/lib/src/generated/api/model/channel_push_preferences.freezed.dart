// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_push_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelPushPreferences {
  String? get chatLevel;
  DateTime? get disabledUntil;

  /// Create a copy of ChannelPushPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelPushPreferencesCopyWith<ChannelPushPreferences> get copyWith =>
      _$ChannelPushPreferencesCopyWithImpl<ChannelPushPreferences>(
          this as ChannelPushPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelPushPreferences &&
            (identical(other.chatLevel, chatLevel) ||
                other.chatLevel == chatLevel) &&
            (identical(other.disabledUntil, disabledUntil) ||
                other.disabledUntil == disabledUntil));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatLevel, disabledUntil);

  @override
  String toString() {
    return 'ChannelPushPreferences(chatLevel: $chatLevel, disabledUntil: $disabledUntil)';
  }
}

/// @nodoc
abstract mixin class $ChannelPushPreferencesCopyWith<$Res> {
  factory $ChannelPushPreferencesCopyWith(ChannelPushPreferences value,
          $Res Function(ChannelPushPreferences) _then) =
      _$ChannelPushPreferencesCopyWithImpl;
  @useResult
  $Res call({String? chatLevel, DateTime? disabledUntil});
}

/// @nodoc
class _$ChannelPushPreferencesCopyWithImpl<$Res>
    implements $ChannelPushPreferencesCopyWith<$Res> {
  _$ChannelPushPreferencesCopyWithImpl(this._self, this._then);

  final ChannelPushPreferences _self;
  final $Res Function(ChannelPushPreferences) _then;

  /// Create a copy of ChannelPushPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatLevel = freezed,
    Object? disabledUntil = freezed,
  }) {
    return _then(ChannelPushPreferences(
      chatLevel: freezed == chatLevel
          ? _self.chatLevel
          : chatLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      disabledUntil: freezed == disabledUntil
          ? _self.disabledUntil
          : disabledUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
