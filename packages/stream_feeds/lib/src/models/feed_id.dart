import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_id.freezed.dart';

/// A unique feed identifier.
///
/// Contains group and feed ID components formatted as 'group:id' to
/// uniquely identify feeds across the Stream Feeds system.
@freezed
class FeedId with _$FeedId {
  /// Creates a new [FeedId] instance.
  const FeedId({
    required this.group,
    required this.id,
  }) : rawValue = '$group:$id';

  /// The user's timeline feed containing posts from followed users
  const FeedId.timeline(String id) : this(group: 'timeline', id: id);

  /// Notifications feed
  const FeedId.notification(String id) : this(group: 'notification', id: id);

  /// The user's feed containing stories from followed users
  const FeedId.stories(String id) : this(group: 'stories', id: id);

  /// The user's own stories
  const FeedId.story(String id) : this(group: 'story', id: id);

  /// TThe user's own posts
  const FeedId.user(String id) : this(group: 'user', id: id);

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
  @override
  final String group;

  /// The specific feed identifier within the group.
  ///
  /// This is typically a user ID, feed name, or other unique identifier
  /// that distinguishes this feed from others in the same group.
  @override
  final String id;

  /// The complete feed identifier as a colon-separated string.
  ///
  /// This is the canonical string representation of the feed ID,
  /// formatted as `"group:id"`. This value is used for API requests
  /// and serialization.
  @override
  final String rawValue;

  @override
  String toString() => rawValue;
}
