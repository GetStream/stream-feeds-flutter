import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;

part 'poll_option_data.freezed.dart';

/// A poll option in the Stream Feeds system.
///
/// Contains identifier, display text, and custom metadata for a single
/// option within a poll.
@freezed
class PollOptionData with _$PollOptionData {
  /// Creates a new instance of [PollOptionData].
  const PollOptionData({
    required this.id,
    required this.text,
    this.custom,
  });

  /// Unique identifier for the poll option.
  @override
  final String id;

  /// The text of the poll option.
  @override
  final String text;

  /// Custom data as a map.
  @override
  final Map<String, Object>? custom;
}

/// Extension function to convert a [api.PollOptionResponseData] to a [PollOptionData] model.
extension PollOptionResponseMapper on api.PollOptionResponseData {
  /// Converts this API poll option response to a domain [PollOptionData] instance.
  ///
  /// Returns a [PollOptionData] instance containing all the poll option information
  /// from the API response with proper type conversions and null handling.
  PollOptionData toModel() {
    return PollOptionData(
      id: id,
      text: text,
      custom: custom,
    );
  }
}
