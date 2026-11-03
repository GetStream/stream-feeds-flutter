// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityAddedEvent _$ActivityAddedEventFromJson(
  Map<String, dynamic> json,
) => ActivityAddedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityAddedEventToJson(ActivityAddedEvent instance) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

ActivityDeletedEvent _$ActivityDeletedEventFromJson(
  Map<String, dynamic> json,
) => ActivityDeletedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityDeletedEventToJson(
  ActivityDeletedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityFeedbackEvent _$ActivityFeedbackEventFromJson(
  Map<String, dynamic> json,
) => ActivityFeedbackEvent(
  activityFeedback: ActivityFeedbackEventPayload.fromJson(
    json['activity_feedback'] as Map<String, dynamic>,
  ),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityFeedbackEventToJson(
  ActivityFeedbackEvent instance,
) => <String, dynamic>{
  'activity_feedback': instance.activityFeedback.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityMarkEvent _$ActivityMarkEventFromJson(Map<String, dynamic> json) => ActivityMarkEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  markAllRead: json['mark_all_read'] as bool?,
  markAllSeen: json['mark_all_seen'] as bool?,
  markRead: (json['mark_read'] as List<dynamic>?)?.map((e) => e as String).toList(),
  markSeen: (json['mark_seen'] as List<dynamic>?)?.map((e) => e as String).toList(),
  markWatched: (json['mark_watched'] as List<dynamic>?)?.map((e) => e as String).toList(),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ActivityMarkEventToJson(ActivityMarkEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'mark_all_read': instance.markAllRead,
  'mark_all_seen': instance.markAllSeen,
  'mark_read': instance.markRead,
  'mark_seen': instance.markSeen,
  'mark_watched': instance.markWatched,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityPinnedEvent _$ActivityPinnedEventFromJson(Map<String, dynamic> json) => ActivityPinnedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  pinnedActivity: PinActivityResponse.fromJson(
    json['pinned_activity'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ActivityPinnedEventToJson(
  ActivityPinnedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'pinned_activity': instance.pinnedActivity.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityReactionAddedEvent _$ActivityReactionAddedEventFromJson(
  Map<String, dynamic> json,
) => ActivityReactionAddedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityReactionAddedEventToJson(
  ActivityReactionAddedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityReactionDeletedEvent _$ActivityReactionDeletedEventFromJson(
  Map<String, dynamic> json,
) => ActivityReactionDeletedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityReactionDeletedEventToJson(
  ActivityReactionDeletedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityReactionUpdatedEvent _$ActivityReactionUpdatedEventFromJson(
  Map<String, dynamic> json,
) => ActivityReactionUpdatedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityReactionUpdatedEventToJson(
  ActivityReactionUpdatedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityRemovedFromFeedEvent _$ActivityRemovedFromFeedEventFromJson(
  Map<String, dynamic> json,
) => ActivityRemovedFromFeedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityRemovedFromFeedEventToJson(
  ActivityRemovedFromFeedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityRestoredEvent _$ActivityRestoredEventFromJson(
  Map<String, dynamic> json,
) => ActivityRestoredEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityRestoredEventToJson(
  ActivityRestoredEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityUnpinnedEvent _$ActivityUnpinnedEventFromJson(
  Map<String, dynamic> json,
) => ActivityUnpinnedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  pinnedActivity: PinActivityResponse.fromJson(
    json['pinned_activity'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityUnpinnedEventToJson(
  ActivityUnpinnedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'pinned_activity': instance.pinnedActivity.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

ActivityUpdatedEvent _$ActivityUpdatedEventFromJson(
  Map<String, dynamic> json,
) => ActivityUpdatedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityUpdatedEventToJson(
  ActivityUpdatedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

AppUpdatedEvent _$AppUpdatedEventFromJson(Map<String, dynamic> json) => AppUpdatedEvent(
  app: AppEventResponse.fromJson(json['app'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$AppUpdatedEventToJson(AppUpdatedEvent instance) => <String, dynamic>{
  'app': instance.app.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

BookmarkAddedEvent _$BookmarkAddedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkAddedEvent(
  bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkAddedEventToJson(BookmarkAddedEvent instance) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

BookmarkDeletedEvent _$BookmarkDeletedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkDeletedEvent(
  bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkDeletedEventToJson(
  BookmarkDeletedEvent instance,
) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

BookmarkFolderDeletedEvent _$BookmarkFolderDeletedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkFolderDeletedEvent(
  bookmarkFolder: BookmarkFolderResponse.fromJson(
    json['bookmark_folder'] as Map<String, dynamic>,
  ),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkFolderDeletedEventToJson(
  BookmarkFolderDeletedEvent instance,
) => <String, dynamic>{
  'bookmark_folder': instance.bookmarkFolder.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

BookmarkFolderUpdatedEvent _$BookmarkFolderUpdatedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkFolderUpdatedEvent(
  bookmarkFolder: BookmarkFolderResponse.fromJson(
    json['bookmark_folder'] as Map<String, dynamic>,
  ),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkFolderUpdatedEventToJson(
  BookmarkFolderUpdatedEvent instance,
) => <String, dynamic>{
  'bookmark_folder': instance.bookmarkFolder.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

BookmarkUpdatedEvent _$BookmarkUpdatedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkUpdatedEvent(
  bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkUpdatedEventToJson(
  BookmarkUpdatedEvent instance,
) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentAddedEvent _$CommentAddedEventFromJson(
  Map<String, dynamic> json,
) => CommentAddedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentAddedEventToJson(CommentAddedEvent instance) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentDeletedEvent _$CommentDeletedEventFromJson(
  Map<String, dynamic> json,
) => CommentDeletedEvent(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentDeletedEventToJson(
  CommentDeletedEvent instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentFeedbackEvent _$CommentFeedbackEventFromJson(
  Map<String, dynamic> json,
) => CommentFeedbackEvent(
  commentFeedback: CommentFeedbackEventPayload.fromJson(
    json['comment_feedback'] as Map<String, dynamic>,
  ),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentFeedbackEventToJson(
  CommentFeedbackEvent instance,
) => <String, dynamic>{
  'comment_feedback': instance.commentFeedback.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentReactionAddedEvent _$CommentReactionAddedEventFromJson(
  Map<String, dynamic> json,
) => CommentReactionAddedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentReactionAddedEventToJson(
  CommentReactionAddedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentReactionDeletedEvent _$CommentReactionDeletedEventFromJson(
  Map<String, dynamic> json,
) => CommentReactionDeletedEvent(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$CommentReactionDeletedEventToJson(
  CommentReactionDeletedEvent instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

CommentReactionUpdatedEvent _$CommentReactionUpdatedEventFromJson(
  Map<String, dynamic> json,
) => CommentReactionUpdatedEvent(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  reaction: FeedsReactionResponse.fromJson(
    json['reaction'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentReactionUpdatedEventToJson(
  CommentReactionUpdatedEvent instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'reaction': instance.reaction.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentRestoredEvent _$CommentRestoredEventFromJson(
  Map<String, dynamic> json,
) => CommentRestoredEvent(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentRestoredEventToJson(
  CommentRestoredEvent instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

CommentUpdatedEvent _$CommentUpdatedEventFromJson(
  Map<String, dynamic> json,
) => CommentUpdatedEvent(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentUpdatedEventToJson(
  CommentUpdatedEvent instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedCreatedEvent _$FeedCreatedEventFromJson(Map<String, dynamic> json) => FeedCreatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  members: (json['members'] as List<dynamic>)
      .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(
    json['user'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$FeedCreatedEventToJson(FeedCreatedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed': instance.feed.toJson(),
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'members': instance.members.map((e) => e.toJson()).toList(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user.toJson(),
};

FeedDeletedEvent _$FeedDeletedEventFromJson(Map<String, dynamic> json) => FeedDeletedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FeedDeletedEventToJson(FeedDeletedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedGroupChangedEvent _$FeedGroupChangedEventFromJson(
  Map<String, dynamic> json,
) => FeedGroupChangedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedGroup: json['feed_group'] == null ? null : FeedGroup.fromJson(json['feed_group'] as Map<String, dynamic>),
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedGroupChangedEventToJson(
  FeedGroupChangedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_group': instance.feedGroup?.toJson(),
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedGroupDeletedEvent _$FeedGroupDeletedEventFromJson(
  Map<String, dynamic> json,
) => FeedGroupDeletedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  groupId: json['group_id'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$FeedGroupDeletedEventToJson(
  FeedGroupDeletedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'group_id': instance.groupId,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

FeedGroupRestoredEvent _$FeedGroupRestoredEventFromJson(
  Map<String, dynamic> json,
) => FeedGroupRestoredEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  groupId: json['group_id'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$FeedGroupRestoredEventToJson(
  FeedGroupRestoredEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'group_id': instance.groupId,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

FeedMemberAddedEvent _$FeedMemberAddedEventFromJson(
  Map<String, dynamic> json,
) => FeedMemberAddedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  member: FeedMemberResponse.fromJson(json['member'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedMemberAddedEventToJson(
  FeedMemberAddedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'member': instance.member.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedMemberRemovedEvent _$FeedMemberRemovedEventFromJson(
  Map<String, dynamic> json,
) => FeedMemberRemovedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  memberId: json['member_id'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedMemberRemovedEventToJson(
  FeedMemberRemovedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'member_id': instance.memberId,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedMemberUpdatedEvent _$FeedMemberUpdatedEventFromJson(
  Map<String, dynamic> json,
) => FeedMemberUpdatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  member: FeedMemberResponse.fromJson(json['member'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedMemberUpdatedEventToJson(
  FeedMemberUpdatedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'member': instance.member.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FeedUpdatedEvent _$FeedUpdatedEventFromJson(Map<String, dynamic> json) => FeedUpdatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FeedUpdatedEventToJson(FeedUpdatedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed': instance.feed.toJson(),
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

FollowCreatedEvent _$FollowCreatedEventFromJson(Map<String, dynamic> json) => FollowCreatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$FollowCreatedEventToJson(FollowCreatedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'follow': instance.follow.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

FollowDeletedEvent _$FollowDeletedEventFromJson(Map<String, dynamic> json) => FollowDeletedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$FollowDeletedEventToJson(FollowDeletedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'follow': instance.follow.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

FollowUpdatedEvent _$FollowUpdatedEventFromJson(Map<String, dynamic> json) => FollowUpdatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$FollowUpdatedEventToJson(FollowUpdatedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'follow': instance.follow.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

ModerationCustomActionEvent _$ModerationCustomActionEventFromJson(
  Map<String, dynamic> json,
) => ModerationCustomActionEvent(
  actionId: json['action_id'] as String,
  actionOptions: json['action_options'] as Map<String, dynamic>?,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  message: json['message'] == null ? null : MessageResponse.fromJson(json['message'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  reviewQueueItem: ReviewQueueItemResponse.fromJson(
    json['review_queue_item'] as Map<String, dynamic>,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$ModerationCustomActionEventToJson(
  ModerationCustomActionEvent instance,
) => <String, dynamic>{
  'action_id': instance.actionId,
  'action_options': instance.actionOptions,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'message': instance.message?.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'review_queue_item': instance.reviewQueueItem.toJson(),
  'type': instance.type,
};

ModerationFlaggedEvent _$ModerationFlaggedEventFromJson(
  Map<String, dynamic> json,
) => ModerationFlaggedEvent(
  contentType: json['content_type'] as String,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  objectId: json['object_id'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$ModerationFlaggedEventToJson(
  ModerationFlaggedEvent instance,
) => <String, dynamic>{
  'content_type': instance.contentType,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'object_id': instance.objectId,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

ModerationMarkReviewedEvent _$ModerationMarkReviewedEventFromJson(
  Map<String, dynamic> json,
) => ModerationMarkReviewedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  item: ReviewQueueItemResponse.fromJson(json['item'] as Map<String, dynamic>),
  message: json['message'] == null ? null : MessageResponse.fromJson(json['message'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$ModerationMarkReviewedEventToJson(
  ModerationMarkReviewedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'item': instance.item.toJson(),
  'message': instance.message?.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

NotificationFeedUpdatedEvent _$NotificationFeedUpdatedEventFromJson(
  Map<String, dynamic> json,
) => NotificationFeedUpdatedEvent(
  aggregatedActivities: (json['aggregated_activities'] as List<dynamic>?)
      ?.map(
        (e) => AggregatedActivityResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  notificationStatus: json['notification_status'] == null
      ? null
      : NotificationStatusResponse.fromJson(
          json['notification_status'] as Map<String, dynamic>,
        ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationFeedUpdatedEventToJson(
  NotificationFeedUpdatedEvent instance,
) => <String, dynamic>{
  'aggregated_activities': instance.aggregatedActivities?.map((e) => e.toJson()).toList(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'notification_status': instance.notificationStatus?.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

PollClosedFeedEvent _$PollClosedFeedEventFromJson(Map<String, dynamic> json) => PollClosedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollClosedFeedEventToJson(
  PollClosedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

PollDeletedFeedEvent _$PollDeletedFeedEventFromJson(
  Map<String, dynamic> json,
) => PollDeletedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollDeletedFeedEventToJson(
  PollDeletedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

PollUpdatedFeedEvent _$PollUpdatedFeedEventFromJson(
  Map<String, dynamic> json,
) => PollUpdatedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollUpdatedFeedEventToJson(
  PollUpdatedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

PollVoteCastedFeedEvent _$PollVoteCastedFeedEventFromJson(
  Map<String, dynamic> json,
) => PollVoteCastedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  pollVote: PollVoteResponseData.fromJson(
    json['poll_vote'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollVoteCastedFeedEventToJson(
  PollVoteCastedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'poll_vote': instance.pollVote.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

PollVoteChangedFeedEvent _$PollVoteChangedFeedEventFromJson(
  Map<String, dynamic> json,
) => PollVoteChangedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  pollVote: PollVoteResponseData.fromJson(
    json['poll_vote'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollVoteChangedFeedEventToJson(
  PollVoteChangedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'poll_vote': instance.pollVote.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

PollVoteRemovedFeedEvent _$PollVoteRemovedFeedEventFromJson(
  Map<String, dynamic> json,
) => PollVoteRemovedFeedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  poll: PollResponseData.fromJson(json['poll'] as Map<String, dynamic>),
  pollVote: PollVoteResponseData.fromJson(
    json['poll_vote'] as Map<String, dynamic>,
  ),
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
);

Map<String, dynamic> _$PollVoteRemovedFeedEventToJson(
  PollVoteRemovedFeedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'poll': instance.poll.toJson(),
  'poll_vote': instance.pollVote.toJson(),
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
};

StoriesFeedUpdatedEvent _$StoriesFeedUpdatedEventFromJson(
  Map<String, dynamic> json,
) => StoriesFeedUpdatedEvent(
  activities: (json['activities'] as List<dynamic>?)
      ?.map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  aggregatedActivities: (json['aggregated_activities'] as List<dynamic>?)
      ?.map(
        (e) => AggregatedActivityResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  feedVisibility: json['feed_visibility'] as FeedVisibility?,
  fid: json['fid'] as String,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StoriesFeedUpdatedEventToJson(
  StoriesFeedUpdatedEvent instance,
) => <String, dynamic>{
  'activities': instance.activities?.map((e) => e.toJson()).toList(),
  'aggregated_activities': instance.aggregatedActivities?.map((e) => e.toJson()).toList(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'feed_visibility': instance.feedVisibility,
  'fid': instance.fid,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

UserBannedEvent _$UserBannedEventFromJson(Map<String, dynamic> json) => UserBannedEvent(
  channelCustom: json['channel_custom'] as Map<String, dynamic>?,
  channelId: json['channel_id'] as String?,
  channelMemberCount: (json['channel_member_count'] as num?)?.toInt(),
  channelMessageCount: (json['channel_message_count'] as num?)?.toInt(),
  channelType: json['channel_type'] as String?,
  cid: json['cid'] as String?,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  createdBy: json['created_by'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['created_by'] as Map<String, dynamic>,
        ),
  custom: json['custom'] as Map<String, dynamic>,
  expiration: _$JsonConverterFromJson<Object, DateTime>(
    json['expiration'],
    const StreamDateTimeConverter().fromJson,
  ),
  reason: json['reason'] as String?,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  reviewQueueItemId: json['review_queue_item_id'] as String?,
  shadow: json['shadow'] as bool?,
  team: json['team'] as String?,
  totalBans: (json['total_bans'] as num?)?.toInt(),
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(
    json['user'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserBannedEventToJson(UserBannedEvent instance) => <String, dynamic>{
  'channel_custom': instance.channelCustom,
  'channel_id': instance.channelId,
  'channel_member_count': instance.channelMemberCount,
  'channel_message_count': instance.channelMessageCount,
  'channel_type': instance.channelType,
  'cid': instance.cid,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy?.toJson(),
  'custom': instance.custom,
  'expiration': _$JsonConverterToJson<Object, DateTime>(
    instance.expiration,
    const StreamDateTimeConverter().toJson,
  ),
  'reason': instance.reason,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'review_queue_item_id': instance.reviewQueueItemId,
  'shadow': instance.shadow,
  'team': instance.team,
  'total_bans': instance.totalBans,
  'type': instance.type,
  'user': instance.user.toJson(),
};

UserDeactivatedEvent _$UserDeactivatedEventFromJson(
  Map<String, dynamic> json,
) => UserDeactivatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  createdBy: json['created_by'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['created_by'] as Map<String, dynamic>,
        ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDeactivatedEventToJson(
  UserDeactivatedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy?.toJson(),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user.toJson(),
};

UserDeletedEvent _$UserDeletedEventFromJson(Map<String, dynamic> json) => UserDeletedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  deleteConversation: json['delete_conversation'] as String,
  deleteConversationChannels: json['delete_conversation_channels'] as bool,
  deleteMessages: json['delete_messages'] as String,
  deleteUser: json['delete_user'] as String,
  hardDelete: json['hard_delete'] as bool,
  markMessagesDeleted: json['mark_messages_deleted'] as bool,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(
    json['user'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserDeletedEventToJson(UserDeletedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'delete_conversation': instance.deleteConversation,
  'delete_conversation_channels': instance.deleteConversationChannels,
  'delete_messages': instance.deleteMessages,
  'delete_user': instance.deleteUser,
  'hard_delete': instance.hardDelete,
  'mark_messages_deleted': instance.markMessagesDeleted,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user.toJson(),
};

UserReactivatedEvent _$UserReactivatedEventFromJson(
  Map<String, dynamic> json,
) => UserReactivatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  createdBy: json['created_by'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['created_by'] as Map<String, dynamic>,
        ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserReactivatedEventToJson(
  UserReactivatedEvent instance,
) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy?.toJson(),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user.toJson(),
};

UserUnbannedEvent _$UserUnbannedEventFromJson(Map<String, dynamic> json) => UserUnbannedEvent(
  channelCustom: json['channel_custom'] as Map<String, dynamic>?,
  channelId: json['channel_id'] as String?,
  channelMemberCount: (json['channel_member_count'] as num?)?.toInt(),
  channelMessageCount: (json['channel_message_count'] as num?)?.toInt(),
  channelType: json['channel_type'] as String?,
  cid: json['cid'] as String?,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  createdBy: json['created_by'] == null
      ? null
      : UserResponseCommonFields.fromJson(
          json['created_by'] as Map<String, dynamic>,
        ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  shadow: json['shadow'] as bool?,
  team: json['team'] as String?,
  type: json['type'] as String,
  user: UserResponseCommonFields.fromJson(
    json['user'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserUnbannedEventToJson(UserUnbannedEvent instance) => <String, dynamic>{
  'channel_custom': instance.channelCustom,
  'channel_id': instance.channelId,
  'channel_member_count': instance.channelMemberCount,
  'channel_message_count': instance.channelMessageCount,
  'channel_type': instance.channelType,
  'cid': instance.cid,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy?.toJson(),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'shadow': instance.shadow,
  'team': instance.team,
  'type': instance.type,
  'user': instance.user.toJson(),
};

UserUpdatedEvent _$UserUpdatedEventFromJson(Map<String, dynamic> json) => UserUpdatedEvent(
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: UserResponsePrivacyFields.fromJson(
    json['user'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserUpdatedEventToJson(UserUpdatedEvent instance) => <String, dynamic>{
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user.toJson(),
};
