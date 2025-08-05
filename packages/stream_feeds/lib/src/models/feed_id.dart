import 'package:equatable/equatable.dart';

class FeedId extends Equatable {
  /// Creates a new feed identifier with the specified group and feed IDs.
  ///
  /// - Parameters:
  ///   - group: The feed group identifier (e.g., "user", "timeline")
  ///   - id: The specific feed identifier within the group
  const FeedId({
    required this.group,
    required this.id,
  }) : rawValue = '$group:$id';

  /// Creates a feed identifier from a raw string value.
  ///
  /// The string should be in the format `"group:id"`. If the string
  /// doesn't contain a colon separator, the entire string will be used
  /// as the `id` and `group` will be empty.
  factory FeedId.fromRawValue(String rawValue) {
    final parts = rawValue.split(':');
    return FeedId(group: parts[0], id: parts.length > 1 ? parts[1] : '');
  }

  /// The feed group identifier that categorizes the type of feed.
  ///
  /// Common group IDs include:
  /// - `"user"`: User-specific feeds
  /// - `"timeline"`: Timeline feeds
  /// - `"notification"`: Notification feeds
  /// - `"aggregated"`: Aggregated feeds
  final String group;

  /// The specific feed identifier within the group.
  ///
  /// This is typically a user ID, feed name, or other unique identifier
  /// that distinguishes this feed from others in the same group.
  final String id;

  /// The complete feed identifier as a colon-separated string.
  ///
  /// This is the canonical string representation of the feed ID,
  /// formatted as `"group:id"`. This value is used for API requests
  /// and serialization.
  final String rawValue;

  @override
  String toString() => rawValue;

  @override
  List<Object?> get props => [group, id];
}
