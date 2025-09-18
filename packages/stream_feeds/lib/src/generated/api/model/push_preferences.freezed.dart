// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushPreferences {
  String? get callLevel;
  String? get chatLevel;
  DateTime? get disabledUntil;
  String? get feedsLevel;
  FeedsPreferences? get feedsPreferences;

  /// Create a copy of PushPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PushPreferencesCopyWith<PushPreferences> get copyWith =>
      _$PushPreferencesCopyWithImpl<PushPreferences>(
          this as PushPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushPreferences &&
            (identical(other.callLevel, callLevel) ||
                other.callLevel == callLevel) &&
            (identical(other.chatLevel, chatLevel) ||
                other.chatLevel == chatLevel) &&
            (identical(other.disabledUntil, disabledUntil) ||
                other.disabledUntil == disabledUntil) &&
            (identical(other.feedsLevel, feedsLevel) ||
                other.feedsLevel == feedsLevel) &&
            (identical(other.feedsPreferences, feedsPreferences) ||
                other.feedsPreferences == feedsPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callLevel, chatLevel,
      disabledUntil, feedsLevel, feedsPreferences);

  @override
  String toString() {
    return 'PushPreferences(callLevel: $callLevel, chatLevel: $chatLevel, disabledUntil: $disabledUntil, feedsLevel: $feedsLevel, feedsPreferences: $feedsPreferences)';
  }
}

/// @nodoc
abstract mixin class $PushPreferencesCopyWith<$Res> {
  factory $PushPreferencesCopyWith(
          PushPreferences value, $Res Function(PushPreferences) _then) =
      _$PushPreferencesCopyWithImpl;
  @useResult
  $Res call(
      {String? callLevel,
      String? chatLevel,
      DateTime? disabledUntil,
      String? feedsLevel,
      FeedsPreferences? feedsPreferences});
}

/// @nodoc
class _$PushPreferencesCopyWithImpl<$Res>
    implements $PushPreferencesCopyWith<$Res> {
  _$PushPreferencesCopyWithImpl(this._self, this._then);

  final PushPreferences _self;
  final $Res Function(PushPreferences) _then;

  /// Create a copy of PushPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callLevel = freezed,
    Object? chatLevel = freezed,
    Object? disabledUntil = freezed,
    Object? feedsLevel = freezed,
    Object? feedsPreferences = freezed,
  }) {
    return _then(PushPreferences(
      callLevel: freezed == callLevel
          ? _self.callLevel
          : callLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      chatLevel: freezed == chatLevel
          ? _self.chatLevel
          : chatLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      disabledUntil: freezed == disabledUntil
          ? _self.disabledUntil
          : disabledUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedsLevel: freezed == feedsLevel
          ? _self.feedsLevel
          : feedsLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      feedsPreferences: freezed == feedsPreferences
          ? _self.feedsPreferences
          : feedsPreferences // ignore: cast_nullable_to_non_nullable
              as FeedsPreferences?,
    ));
  }
}

// dart format on
