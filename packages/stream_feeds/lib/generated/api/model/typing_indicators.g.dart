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
class TypingIndicators {
  const TypingIndicators({
    required this.enabled,
  });

  final bool enabled;

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }

  static TypingIndicators? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return TypingIndicators(
        enabled: mapValueOfType<bool>(json, r'enabled')!,
      );
    }
    return null;
  }

  static List<TypingIndicators> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TypingIndicators>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TypingIndicators.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'TypingIndicators('
        'enabled: $enabled, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TypingIndicators && other.enabled == enabled;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      enabled,
    ]);
  }
}
