import 'package:json_annotation/json_annotation.dart';

import '../utils/serializer.dart';

part 'notification.g.dart';

sealed class FeedsNotification {
  const FeedsNotification({
    required this.sender,
    required this.type,
    required this.fid,
    required this.receiverId,
    this.title,
    this.body,
    this.custom = const {},
  });

  /// Creates a [FeedsNotification] from a JSON map.
  ///
  /// This factory constructor handles the parsing of push notification data
  /// and automatically determines the correct event type based on the 'type'
  /// field.
  ///
  /// Any fields that aren't explicitly mapped are stored in the [custom] map.
  ///
  /// Example:
  /// ```dart
  /// void onFirebaseMessage(RemoteMessage message) {
  ///   final event = StreamPushEvent.fromJson(message.data);
  ///   // Handle the event...
  /// }
  /// ```
  factory FeedsNotification.fromJson(Map<String, dynamic> json) {
    final eventTypeMap = {
      NotificationType.activityAdded: ActivityAddedNotification.fromJson,
      NotificationType.commentAdded: CommentAddedNotification.fromJson,
      NotificationType.activityReaction: ActivityReactionNotification.fromJson,
      NotificationType.commentReaction: CommentReactionNotification.fromJson,
      NotificationType.followCreated: FollowCreatedNotification.fromJson,
      NotificationType.feedUpdated: FeedUpdatedNotification.fromJson,
    };

    final event = eventTypeMap[json['type'] as String];
    if (event != null) return event(json);

    return UnknownNotification.fromJson(json);
  }

  /// The sender of the notification (usually `"stream.feeds"`).
  final String sender;

  /// The event type string (e.g. `"feeds.comment.added"`, `"feeds.activity.reaction"`).
  final String type;

  /// The feed identifier where the event occurred (format: `"feed_group:feed_id"`).
  final String fid;

  /// The ID of the user receiving this notification.
  final String receiverId;

  /// Optional title displayed in the system notification.
  final String? title;

  /// Optional body text displayed in the system notification.
  final String? body;

  /// Any additional fields not explicitly modeled by the notification type.
  final Map<String, Object?> custom;

  /// Converts the notification to a JSON map.
  Map<String, Object?> toJson();

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'sender',
    'type',
    'fid',
    'receiver_id',
    'title',
    'body',
  ];

  @override
  String toString() {
    return 'StreamFeedsNotification(sender: $sender, type: $type, fid: $fid, receiverId: $receiverId, title: $title, body: $body, custom: $custom)';
  }
}

/// A new activity (post) was added to a feed.
@JsonSerializable()
final class ActivityAddedNotification extends FeedsNotification {
  const ActivityAddedNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    required this.activityId,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory ActivityAddedNotification.fromJson(Map<String, dynamic> json) {
    return _$ActivityAddedNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  /// The ID of the new activity that triggered this notification.
  final String activityId;

  @override
  Map<String, Object?> toJson() => _$ActivityAddedNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'activity_id',
    ...FeedsNotification.topLevelFields,
  ];
}

/// A new comment was added to an activity.
@JsonSerializable()
final class CommentAddedNotification extends FeedsNotification {
  const CommentAddedNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    required this.activityId,
    required this.commentId,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory CommentAddedNotification.fromJson(Map<String, dynamic> json) {
    return _$CommentAddedNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  /// The ID of the activity that the comment belongs to.
  final String activityId;

  /// The ID of the comment that was created.
  final String commentId;

  @override
  Map<String, Object?> toJson() => _$CommentAddedNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'activity_id',
    'comment_id',
    ...FeedsNotification.topLevelFields,
  ];
}

/// Someone reacted to an activity (e.g. a like or emoji).
@JsonSerializable()
final class ActivityReactionNotification extends FeedsNotification {
  const ActivityReactionNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    required this.activityId,
    required this.reactionType,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory ActivityReactionNotification.fromJson(Map<String, dynamic> json) {
    return _$ActivityReactionNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  /// The ID of the activity that was reacted to.
  final String activityId;

  /// The type of reaction (e.g. `"like"`, `"love"`, `"haha"`).
  final String reactionType;

  @override
  Map<String, Object?> toJson() => _$ActivityReactionNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'activity_id',
    'reaction_type',
    ...FeedsNotification.topLevelFields,
  ];
}

/// Someone reacted to a comment (e.g. a like or emoji).
@JsonSerializable()
final class CommentReactionNotification extends FeedsNotification {
  const CommentReactionNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    required this.activityId,
    required this.commentId,
    required this.reactionType,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory CommentReactionNotification.fromJson(Map<String, dynamic> json) {
    return _$CommentReactionNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  /// The ID of the activity the comment belongs to.
  final String activityId;

  /// The ID of the comment that was reacted to.
  final String commentId;

  /// The type of reaction (e.g. `"like"`, `"love"`).
  final String reactionType;

  @override
  Map<String, Object?> toJson() => _$CommentReactionNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'activity_id',
    'comment_id',
    'reaction_type',
    ...FeedsNotification.topLevelFields,
  ];
}

/// A follow relationship was created.
@JsonSerializable()
final class FollowCreatedNotification extends FeedsNotification {
  const FollowCreatedNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    required this.sourceFid,
    required this.targetFid,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory FollowCreatedNotification.fromJson(Map<String, dynamic> json) {
    return _$FollowCreatedNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  /// The source feed identifier (the follower).
  final String sourceFid;

  /// The target feed identifier (the followee).
  final String targetFid;

  @override
  Map<String, Object?> toJson() => _$FollowCreatedNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'source_fid',
    'target_fid',
    ...FeedsNotification.topLevelFields,
  ];
}

/// An aggregated “notification feed updated” event.
/// Typically used to update badges, unseen counts, or show a summary.
@JsonSerializable()
final class FeedUpdatedNotification extends FeedsNotification {
  const FeedUpdatedNotification({
    required super.sender,
    required super.type,
    required super.fid,
    required super.receiverId,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory FeedUpdatedNotification.fromJson(Map<String, dynamic> json) {
    return _$FeedUpdatedNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  @override
  Map<String, Object?> toJson() => _$FeedUpdatedNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    ...FeedsNotification.topLevelFields,
  ];
}

/// A fallback notification used when the type string is unknown.
@JsonSerializable()
final class UnknownNotification extends FeedsNotification {
  const UnknownNotification({
    required super.sender,
    required super.type, // unknown or unexpected event type
    required super.fid,
    required super.receiverId,
    super.title,
    super.body,
    super.custom = const {},
  });

  /// Create a new instance from json.
  factory UnknownNotification.fromJson(Map<String, dynamic> json) {
    return _$UnknownNotificationFromJson(
      Serializer.moveToExtraData(json, topLevelFields),
    );
  }

  @override
  Map<String, Object?> toJson() => _$UnknownNotificationToJson(this);

  /// Known top level fields.
  ///
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    ...FeedsNotification.topLevelFields,
  ];
}

extension type const NotificationType(String _key) implements String {
  static const activityAdded = NotificationType('feeds.activity.added');

  static const commentAdded = NotificationType('feeds.comment.added');

  static const activityReaction = NotificationType(
    'feeds.activity.reaction.added',
  );

  static const commentReaction = NotificationType(
    'feeds.comment.reaction.added',
  );

  static const followCreated = NotificationType('feeds.follow.created');

  static const feedUpdated = NotificationType(
    'feeds.notification_feed.updated',
  );
}
