//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import, public_member_api_docs, use_string_in_part_of_directives
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

// ignore: one_member_abstracts
abstract class Authentication {
  /// Apply authentication settings to header and query params.
  Future<void> applyToParams(
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  );
}
