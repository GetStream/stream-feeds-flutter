// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_builder_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RuleBuilderAction {
  BanOptions? get banOptions;
  FlagUserOptions? get flagUserOptions;
  RuleBuilderActionType get type;

  /// Create a copy of RuleBuilderAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RuleBuilderActionCopyWith<RuleBuilderAction> get copyWith =>
      _$RuleBuilderActionCopyWithImpl<RuleBuilderAction>(
          this as RuleBuilderAction, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RuleBuilderAction &&
            (identical(other.banOptions, banOptions) ||
                other.banOptions == banOptions) &&
            (identical(other.flagUserOptions, flagUserOptions) ||
                other.flagUserOptions == flagUserOptions) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, banOptions, flagUserOptions, type);

  @override
  String toString() {
    return 'RuleBuilderAction(banOptions: $banOptions, flagUserOptions: $flagUserOptions, type: $type)';
  }
}

/// @nodoc
abstract mixin class $RuleBuilderActionCopyWith<$Res> {
  factory $RuleBuilderActionCopyWith(
          RuleBuilderAction value, $Res Function(RuleBuilderAction) _then) =
      _$RuleBuilderActionCopyWithImpl;
  @useResult
  $Res call(
      {BanOptions? banOptions,
      FlagUserOptions? flagUserOptions,
      RuleBuilderActionType type});
}

/// @nodoc
class _$RuleBuilderActionCopyWithImpl<$Res>
    implements $RuleBuilderActionCopyWith<$Res> {
  _$RuleBuilderActionCopyWithImpl(this._self, this._then);

  final RuleBuilderAction _self;
  final $Res Function(RuleBuilderAction) _then;

  /// Create a copy of RuleBuilderAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banOptions = freezed,
    Object? flagUserOptions = freezed,
    Object? type = null,
  }) {
    return _then(RuleBuilderAction(
      banOptions: freezed == banOptions
          ? _self.banOptions
          : banOptions // ignore: cast_nullable_to_non_nullable
              as BanOptions?,
      flagUserOptions: freezed == flagUserOptions
          ? _self.flagUserOptions
          : flagUserOptions // ignore: cast_nullable_to_non_nullable
              as FlagUserOptions?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RuleBuilderActionType,
    ));
  }
}

// dart format on
