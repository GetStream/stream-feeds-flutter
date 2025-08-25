// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_processor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityProcessorConfig {
  Map<String, Object?>? get config;
  String? get openaiKey;
  String get type;

  /// Create a copy of ActivityProcessorConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityProcessorConfigCopyWith<ActivityProcessorConfig> get copyWith =>
      _$ActivityProcessorConfigCopyWithImpl<ActivityProcessorConfig>(
          this as ActivityProcessorConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityProcessorConfig &&
            const DeepCollectionEquality().equals(other.config, config) &&
            (identical(other.openaiKey, openaiKey) ||
                other.openaiKey == openaiKey) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(config), openaiKey, type);

  @override
  String toString() {
    return 'ActivityProcessorConfig(config: $config, openaiKey: $openaiKey, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ActivityProcessorConfigCopyWith<$Res> {
  factory $ActivityProcessorConfigCopyWith(ActivityProcessorConfig value,
          $Res Function(ActivityProcessorConfig) _then) =
      _$ActivityProcessorConfigCopyWithImpl;
  @useResult
  $Res call({Map<String, Object?>? config, String? openaiKey, String type});
}

/// @nodoc
class _$ActivityProcessorConfigCopyWithImpl<$Res>
    implements $ActivityProcessorConfigCopyWith<$Res> {
  _$ActivityProcessorConfigCopyWithImpl(this._self, this._then);

  final ActivityProcessorConfig _self;
  final $Res Function(ActivityProcessorConfig) _then;

  /// Create a copy of ActivityProcessorConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = freezed,
    Object? openaiKey = freezed,
    Object? type = null,
  }) {
    return _then(ActivityProcessorConfig(
      config: freezed == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      openaiKey: freezed == openaiKey
          ? _self.openaiKey
          : openaiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
