// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfigResponse {
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
  LLMConfig? get llmConfig;
  String get team;
  DateTime get updatedAt;
  VelocityFilterConfig? get velocityFilterConfig;
  VideoCallRuleConfig? get videoCallRuleConfig;

  /// Create a copy of ConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigResponseCopyWith<ConfigResponse> get copyWith =>
      _$ConfigResponseCopyWithImpl<ConfigResponse>(
          this as ConfigResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfigResponse &&
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
            (identical(other.llmConfig, llmConfig) ||
                other.llmConfig == llmConfig) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.velocityFilterConfig, velocityFilterConfig) ||
                other.velocityFilterConfig == velocityFilterConfig) &&
            (identical(other.videoCallRuleConfig, videoCallRuleConfig) ||
                other.videoCallRuleConfig == videoCallRuleConfig));
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
      llmConfig,
      team,
      updatedAt,
      velocityFilterConfig,
      videoCallRuleConfig);

  @override
  String toString() {
    return 'ConfigResponse(aiImageConfig: $aiImageConfig, aiTextConfig: $aiTextConfig, aiVideoConfig: $aiVideoConfig, async: $async, automodPlatformCircumventionConfig: $automodPlatformCircumventionConfig, automodSemanticFiltersConfig: $automodSemanticFiltersConfig, automodToxicityConfig: $automodToxicityConfig, blockListConfig: $blockListConfig, createdAt: $createdAt, key: $key, llmConfig: $llmConfig, team: $team, updatedAt: $updatedAt, velocityFilterConfig: $velocityFilterConfig, videoCallRuleConfig: $videoCallRuleConfig)';
  }
}

/// @nodoc
abstract mixin class $ConfigResponseCopyWith<$Res> {
  factory $ConfigResponseCopyWith(
          ConfigResponse value, $Res Function(ConfigResponse) _then) =
      _$ConfigResponseCopyWithImpl;
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
      LLMConfig? llmConfig,
      String team,
      DateTime updatedAt,
      VelocityFilterConfig? velocityFilterConfig,
      VideoCallRuleConfig? videoCallRuleConfig});
}

/// @nodoc
class _$ConfigResponseCopyWithImpl<$Res>
    implements $ConfigResponseCopyWith<$Res> {
  _$ConfigResponseCopyWithImpl(this._self, this._then);

  final ConfigResponse _self;
  final $Res Function(ConfigResponse) _then;

  /// Create a copy of ConfigResponse
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
    Object? llmConfig = freezed,
    Object? team = null,
    Object? updatedAt = null,
    Object? velocityFilterConfig = freezed,
    Object? videoCallRuleConfig = freezed,
  }) {
    return _then(ConfigResponse(
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
      llmConfig: freezed == llmConfig
          ? _self.llmConfig
          : llmConfig // ignore: cast_nullable_to_non_nullable
              as LLMConfig?,
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
      videoCallRuleConfig: freezed == videoCallRuleConfig
          ? _self.videoCallRuleConfig
          : videoCallRuleConfig // ignore: cast_nullable_to_non_nullable
              as VideoCallRuleConfig?,
    ));
  }
}

// dart format on
