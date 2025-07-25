// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: unnecessary_null_in_if_null_operators
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes
// ignore_for_file: require_trailing_commas

part of openapi.api;

@immutable
class ModerationV2Response {
  const ModerationV2Response({
    required this.action,
    this.blocklistMatched,
    this.imageHarms,
    required this.originalText,
    this.platformCircumvented,
    this.semanticFilterMatched,
    this.textHarms,
  });

  final String action;

  final String? blocklistMatched;

  final List<String>? imageHarms;

  final String originalText;

  final bool? platformCircumvented;

  final String? semanticFilterMatched;

  final List<String>? textHarms;

  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'blocklist_matched': blocklistMatched,
      'image_harms': imageHarms,
      'original_text': originalText,
      'platform_circumvented': platformCircumvented,
      'semantic_filter_matched': semanticFilterMatched,
      'text_harms': textHarms,
    };
  }

  static ModerationV2Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return ModerationV2Response(
        action: mapValueOfType<String>(json, r'action')!,
        blocklistMatched:
            mapValueOfType<String>(json, r'blocklist_matched', null),
        imageHarms: json[r'image_harms'] is Iterable
            ? (json[r'image_harms'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        originalText: mapValueOfType<String>(json, r'original_text')!,
        platformCircumvented:
            mapValueOfType<bool>(json, r'platform_circumvented', null),
        semanticFilterMatched:
            mapValueOfType<String>(json, r'semantic_filter_matched', null),
        textHarms: json[r'text_harms'] is Iterable
            ? (json[r'text_harms'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ModerationV2Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ModerationV2Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ModerationV2Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'ModerationV2Response('
        'action: $action, '
        'blocklistMatched: $blocklistMatched, '
        'imageHarms: $imageHarms, '
        'originalText: $originalText, '
        'platformCircumvented: $platformCircumvented, '
        'semanticFilterMatched: $semanticFilterMatched, '
        'textHarms: $textHarms, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModerationV2Response &&
        other.action == action &&
        other.blocklistMatched == blocklistMatched &&
        other.imageHarms == imageHarms &&
        other.originalText == originalText &&
        other.platformCircumvented == platformCircumvented &&
        other.semanticFilterMatched == semanticFilterMatched &&
        other.textHarms == textHarms;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      action,
      blocklistMatched,
      imageHarms,
      originalText,
      platformCircumvented,
      semanticFilterMatched,
      textHarms,
    ]);
  }
}
