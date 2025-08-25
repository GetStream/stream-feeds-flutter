// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationConfigData {
  AIImageConfig? get aiImageConfig;
  AITextConfig? get aiTextConfig;
  AIVideoConfig? get aiVideoConfig;
  bool get async;
  AutomodPlatformCircumventionConfig? get automodPlatformCircumventionConfig;
  AutomodSemanticFiltersConfig? get automodSemanticFiltersConfig;
  AutomodToxicityConfig? get automodToxicityConfig;
  BlockListConfig? get blockListConfig;
  DateTime get createdAt;
  String get key;
  String get team;
  DateTime get updatedAt;
  VelocityFilterConfig? get velocityFilterConfig;

  /// Create a copy of ModerationConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationConfigDataCopyWith<ModerationConfigData> get copyWith =>
      _$ModerationConfigDataCopyWithImpl<ModerationConfigData>(
          this as ModerationConfigData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationConfigData &&
            (identical(other.aiImageConfig, aiImageConfig) ||
                other.aiImageConfig == aiImageConfig) &&
            (identical(other.aiTextConfig, aiTextConfig) ||
                other.aiTextConfig == aiTextConfig) &&
            (identical(other.aiVideoConfig, aiVideoConfig) ||
                other.aiVideoConfig == aiVideoConfig) &&
            (identical(other.async, async) || other.async == async) &&
            (identical(other.automodPlatformCircumventionConfig,
                    automodPlatformCircumventionConfig) ||
                other.automodPlatformCircumventionConfig ==
                    automodPlatformCircumventionConfig) &&
            (identical(other.automodSemanticFiltersConfig,
                    automodSemanticFiltersConfig) ||
                other.automodSemanticFiltersConfig ==
                    automodSemanticFiltersConfig) &&
            (identical(other.automodToxicityConfig, automodToxicityConfig) ||
                other.automodToxicityConfig == automodToxicityConfig) &&
            (identical(other.blockListConfig, blockListConfig) ||
                other.blockListConfig == blockListConfig) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.velocityFilterConfig, velocityFilterConfig) ||
                other.velocityFilterConfig == velocityFilterConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      aiImageConfig,
      aiTextConfig,
      aiVideoConfig,
      async,
      automodPlatformCircumventionConfig,
      automodSemanticFiltersConfig,
      automodToxicityConfig,
      blockListConfig,
      createdAt,
      key,
      team,
      updatedAt,
      velocityFilterConfig);

  @override
  String toString() {
    return 'ModerationConfigData(aiImageConfig: $aiImageConfig, aiTextConfig: $aiTextConfig, aiVideoConfig: $aiVideoConfig, async: $async, automodPlatformCircumventionConfig: $automodPlatformCircumventionConfig, automodSemanticFiltersConfig: $automodSemanticFiltersConfig, automodToxicityConfig: $automodToxicityConfig, blockListConfig: $blockListConfig, createdAt: $createdAt, key: $key, team: $team, updatedAt: $updatedAt, velocityFilterConfig: $velocityFilterConfig)';
  }
}

/// @nodoc
abstract mixin class $ModerationConfigDataCopyWith<$Res> {
  factory $ModerationConfigDataCopyWith(ModerationConfigData value,
          $Res Function(ModerationConfigData) _then) =
      _$ModerationConfigDataCopyWithImpl;
  @useResult
  $Res call(
      {AIImageConfig? aiImageConfig,
      AITextConfig? aiTextConfig,
      AIVideoConfig? aiVideoConfig,
      bool async,
      AutomodPlatformCircumventionConfig? automodPlatformCircumventionConfig,
      AutomodSemanticFiltersConfig? automodSemanticFiltersConfig,
      AutomodToxicityConfig? automodToxicityConfig,
      BlockListConfig? blockListConfig,
      DateTime createdAt,
      String key,
      String team,
      DateTime updatedAt,
      VelocityFilterConfig? velocityFilterConfig});
}

/// @nodoc
class _$ModerationConfigDataCopyWithImpl<$Res>
    implements $ModerationConfigDataCopyWith<$Res> {
  _$ModerationConfigDataCopyWithImpl(this._self, this._then);

  final ModerationConfigData _self;
  final $Res Function(ModerationConfigData) _then;

  /// Create a copy of ModerationConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aiImageConfig = freezed,
    Object? aiTextConfig = freezed,
    Object? aiVideoConfig = freezed,
    Object? async = null,
    Object? automodPlatformCircumventionConfig = freezed,
    Object? automodSemanticFiltersConfig = freezed,
    Object? automodToxicityConfig = freezed,
    Object? blockListConfig = freezed,
    Object? createdAt = null,
    Object? key = null,
    Object? team = null,
    Object? updatedAt = null,
    Object? velocityFilterConfig = freezed,
  }) {
    return _then(ModerationConfigData(
      aiImageConfig: freezed == aiImageConfig
          ? _self.aiImageConfig
          : aiImageConfig // ignore: cast_nullable_to_non_nullable
              as AIImageConfig?,
      aiTextConfig: freezed == aiTextConfig
          ? _self.aiTextConfig
          : aiTextConfig // ignore: cast_nullable_to_non_nullable
              as AITextConfig?,
      aiVideoConfig: freezed == aiVideoConfig
          ? _self.aiVideoConfig
          : aiVideoConfig // ignore: cast_nullable_to_non_nullable
              as AIVideoConfig?,
      async: null == async
          ? _self.async
          : async // ignore: cast_nullable_to_non_nullable
              as bool,
      automodPlatformCircumventionConfig: freezed ==
              automodPlatformCircumventionConfig
          ? _self.automodPlatformCircumventionConfig
          : automodPlatformCircumventionConfig // ignore: cast_nullable_to_non_nullable
              as AutomodPlatformCircumventionConfig?,
      automodSemanticFiltersConfig: freezed == automodSemanticFiltersConfig
          ? _self.automodSemanticFiltersConfig
          : automodSemanticFiltersConfig // ignore: cast_nullable_to_non_nullable
              as AutomodSemanticFiltersConfig?,
      automodToxicityConfig: freezed == automodToxicityConfig
          ? _self.automodToxicityConfig
          : automodToxicityConfig // ignore: cast_nullable_to_non_nullable
              as AutomodToxicityConfig?,
      blockListConfig: freezed == blockListConfig
          ? _self.blockListConfig
          : blockListConfig // ignore: cast_nullable_to_non_nullable
              as BlockListConfig?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _self.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      velocityFilterConfig: freezed == velocityFilterConfig
          ? _self.velocityFilterConfig
          : velocityFilterConfig // ignore: cast_nullable_to_non_nullable
              as VelocityFilterConfig?,
    ));
  }
}

// dart format on
