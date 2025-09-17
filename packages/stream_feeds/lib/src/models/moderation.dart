import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'moderation.freezed.dart';

/// Content moderation results from Stream's moderation system.
///
/// Contains analysis results including actions taken, detected issues,
/// and metadata about how content was processed by the moderation system.
@freezed
class Moderation with _$Moderation {
  /// Creates a new [Moderation] instance.
  const Moderation({
    required this.action,
    required this.originalText,
    required this.imageHarms,
    required this.textHarms,
    this.blocklistMatched,
    this.platformCircumvented,
    this.semanticFilterMatched,
  });

  /// The moderation action that was taken on the content.
  @override
  final String action;

  /// The name of the blocklist that was matched during moderation, if any.
  @override
  final String? blocklistMatched;

  /// A list of image-related harms that were detected in the content.
  @override
  final List<String> imageHarms;

  /// The original text content that was analyzed for moderation.
  @override
  final String originalText;

  /// Whether platform circumvention was detected in the content.
  @override
  final bool? platformCircumvented;

  /// The name of the semantic filter that was matched during moderation, if any.
  @override
  final String? semanticFilterMatched;

  /// A list of text-related harms that were detected in the content.
  @override
  final List<String> textHarms;
}

/// Extension function to convert a [ModerationV2Response] to a [Moderation] model.
extension ModerationResponseMapper on ModerationV2Response {
  /// Converts this API moderation response to a domain [Moderation] instance.
  Moderation toModel() {
    return Moderation(
      action: action,
      originalText: originalText,
      imageHarms: [...?imageHarms],
      textHarms: [...?textHarms],
      blocklistMatched: blocklistMatched,
      platformCircumvented: platformCircumvented,
      semanticFilterMatched: semanticFilterMatched,
    );
  }
}
