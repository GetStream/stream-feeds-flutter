// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_rule_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoCallRuleConfig {
  Map<String, HarmConfig> get rules;

  /// Create a copy of VideoCallRuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoCallRuleConfigCopyWith<VideoCallRuleConfig> get copyWith =>
      _$VideoCallRuleConfigCopyWithImpl<VideoCallRuleConfig>(
          this as VideoCallRuleConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoCallRuleConfig &&
            const DeepCollectionEquality().equals(other.rules, rules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rules));

  @override
  String toString() {
    return 'VideoCallRuleConfig(rules: $rules)';
  }
}

/// @nodoc
abstract mixin class $VideoCallRuleConfigCopyWith<$Res> {
  factory $VideoCallRuleConfigCopyWith(
          VideoCallRuleConfig value, $Res Function(VideoCallRuleConfig) _then) =
      _$VideoCallRuleConfigCopyWithImpl;
  @useResult
  $Res call({Map<String, HarmConfig> rules});
}

/// @nodoc
class _$VideoCallRuleConfigCopyWithImpl<$Res>
    implements $VideoCallRuleConfigCopyWith<$Res> {
  _$VideoCallRuleConfigCopyWithImpl(this._self, this._then);

  final VideoCallRuleConfig _self;
  final $Res Function(VideoCallRuleConfig) _then;

  /// Create a copy of VideoCallRuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(VideoCallRuleConfig(
      rules: null == rules
          ? _self.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Map<String, HarmConfig>,
    ));
  }
}

// dart format on
