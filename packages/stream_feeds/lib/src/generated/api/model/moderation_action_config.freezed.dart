// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_action_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationActionConfig {
  String get action;
  Map<String, Object> get custom;
  String get description;
  String get entityType;
  String get icon;
  int get order;

  /// Create a copy of ModerationActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationActionConfigCopyWith<ModerationActionConfig> get copyWith =>
      _$ModerationActionConfigCopyWithImpl<ModerationActionConfig>(
          this as ModerationActionConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationActionConfig &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      action,
      const DeepCollectionEquality().hash(custom),
      description,
      entityType,
      icon,
      order);

  @override
  String toString() {
    return 'ModerationActionConfig(action: $action, custom: $custom, description: $description, entityType: $entityType, icon: $icon, order: $order)';
  }
}

/// @nodoc
abstract mixin class $ModerationActionConfigCopyWith<$Res> {
  factory $ModerationActionConfigCopyWith(ModerationActionConfig value,
          $Res Function(ModerationActionConfig) _then) =
      _$ModerationActionConfigCopyWithImpl;
  @useResult
  $Res call(
      {String action,
      Map<String, Object> custom,
      String description,
      String entityType,
      String icon,
      int order});
}

/// @nodoc
class _$ModerationActionConfigCopyWithImpl<$Res>
    implements $ModerationActionConfigCopyWith<$Res> {
  _$ModerationActionConfigCopyWithImpl(this._self, this._then);

  final ModerationActionConfig _self;
  final $Res Function(ModerationActionConfig) _then;

  /// Create a copy of ModerationActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? custom = null,
    Object? description = null,
    Object? entityType = null,
    Object? icon = null,
    Object? order = null,
  }) {
    return _then(ModerationActionConfig(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
