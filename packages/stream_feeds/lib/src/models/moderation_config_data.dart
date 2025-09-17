import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'moderation_config_data.freezed.dart';

/// Configuration settings for Stream's moderation system.
///
/// Contains comprehensive moderation configuration including AI-based content
/// analysis, platform circumvention detection, semantic filtering, toxicity
/// detection, block lists, and velocity filtering for activity streams.
@freezed
class ModerationConfigData with _$ModerationConfigData {
  /// Creates a new [ModerationConfigData] instance.
  const ModerationConfigData({
    this.aiImageConfig,
    this.aiTextConfig,
    this.aiVideoConfig,
    required this.async,
    this.automodPlatformCircumventionConfig,
    this.automodSemanticFiltersConfig,
    this.automodToxicityConfig,
    this.blockListConfig,
    required this.createdAt,
    required this.key,
    required this.team,
    required this.updatedAt,
    this.velocityFilterConfig,
  });

  /// Configuration for AI-based image moderation analysis.
  @override
  final AIImageConfig? aiImageConfig;

  /// Configuration for AI-based text moderation analysis.
  @override
  final AITextConfig? aiTextConfig;

  /// Configuration for AI-based video moderation analysis.
  @override
  final AIVideoConfig? aiVideoConfig;

  /// Whether moderation operations are performed asynchronously.
  @override
  final bool async;

  /// Configuration for platform circumvention detection.
  @override
  final AutomodPlatformCircumventionConfig? automodPlatformCircumventionConfig;

  /// Configuration for semantic filters that detect harmful content patterns.
  @override
  final AutomodSemanticFiltersConfig? automodSemanticFiltersConfig;

  /// Configuration for toxicity detection in user-generated content.
  @override
  final AutomodToxicityConfig? automodToxicityConfig;

  /// Configuration for custom block lists to filter prohibited content.
  @override
  final BlockListConfig? blockListConfig;

  /// The date and time when the moderation configuration was created.
  @override
  final DateTime createdAt;

  /// The unique key identifier for this moderation configuration.
  @override
  final String key;

  /// The team identifier associated with this moderation configuration.
  @override
  final String team;

  /// The date and time when the moderation configuration was last updated.
  @override
  final DateTime updatedAt;

  /// Configuration for velocity filtering to limit rapid content submission.
  @override
  final VelocityFilterConfig? velocityFilterConfig;

  /// The unique identifier for this moderation configuration.
  ///
  /// This is an alias for [key] to maintain compatibility with other models
  /// that use 'id' as the primary identifier field.
  String get id => key;
}

/// Extension function to convert a [ConfigResponse] to a [ModerationConfigData] model.
extension ModerationConfigDataMapper on ConfigResponse {
  /// Converts this API moderation configuration to a domain [ModerationConfigData] instance.
  ModerationConfigData toModel() {
    return ModerationConfigData(
      aiImageConfig: aiImageConfig,
      aiTextConfig: aiTextConfig,
      aiVideoConfig: aiVideoConfig,
      async: async,
      automodPlatformCircumventionConfig: automodPlatformCircumventionConfig,
      automodSemanticFiltersConfig: automodSemanticFiltersConfig,
      automodToxicityConfig: automodToxicityConfig,
      blockListConfig: blockListConfig,
      createdAt: createdAt,
      key: key,
      team: team,
      updatedAt: updatedAt,
      velocityFilterConfig: velocityFilterConfig,
    );
  }
}
