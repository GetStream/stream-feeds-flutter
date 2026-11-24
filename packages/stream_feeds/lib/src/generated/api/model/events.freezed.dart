// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityAddedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityAddedEventCopyWith<ActivityAddedEvent> get copyWith => _$ActivityAddedEventCopyWithImpl<ActivityAddedEvent>(
    this as ActivityAddedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityAddedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityAddedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityAddedEventCopyWith<$Res> {
  factory $ActivityAddedEventCopyWith(
    ActivityAddedEvent value,
    $Res Function(ActivityAddedEvent) _then,
  ) = _$ActivityAddedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityAddedEventCopyWithImpl<$Res> implements $ActivityAddedEventCopyWith<$Res> {
  _$ActivityAddedEventCopyWithImpl(this._self, this._then);

  final ActivityAddedEvent _self;
  final $Res Function(ActivityAddedEvent) _then;

  /// Create a copy of ActivityAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityAddedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityDeletedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityDeletedEventCopyWith<ActivityDeletedEvent> get copyWith =>
      _$ActivityDeletedEventCopyWithImpl<ActivityDeletedEvent>(
        this as ActivityDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityDeletedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityDeletedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityDeletedEventCopyWith<$Res> {
  factory $ActivityDeletedEventCopyWith(
    ActivityDeletedEvent value,
    $Res Function(ActivityDeletedEvent) _then,
  ) = _$ActivityDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityDeletedEventCopyWithImpl<$Res> implements $ActivityDeletedEventCopyWith<$Res> {
  _$ActivityDeletedEventCopyWithImpl(this._self, this._then);

  final ActivityDeletedEvent _self;
  final $Res Function(ActivityDeletedEvent) _then;

  /// Create a copy of ActivityDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityDeletedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityFeedbackEvent {
  ActivityFeedbackEventPayload get activityFeedback;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityFeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityFeedbackEventCopyWith<ActivityFeedbackEvent> get copyWith =>
      _$ActivityFeedbackEventCopyWithImpl<ActivityFeedbackEvent>(
        this as ActivityFeedbackEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityFeedbackEvent &&
            (identical(other.activityFeedback, activityFeedback) || other.activityFeedback == activityFeedback) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activityFeedback,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityFeedbackEvent(activityFeedback: $activityFeedback, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityFeedbackEventCopyWith<$Res> {
  factory $ActivityFeedbackEventCopyWith(
    ActivityFeedbackEvent value,
    $Res Function(ActivityFeedbackEvent) _then,
  ) = _$ActivityFeedbackEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityFeedbackEventPayload activityFeedback,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityFeedbackEventCopyWithImpl<$Res> implements $ActivityFeedbackEventCopyWith<$Res> {
  _$ActivityFeedbackEventCopyWithImpl(this._self, this._then);

  final ActivityFeedbackEvent _self;
  final $Res Function(ActivityFeedbackEvent) _then;

  /// Create a copy of ActivityFeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityFeedback = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityFeedbackEvent(
        activityFeedback: null == activityFeedback
            ? _self.activityFeedback
            : activityFeedback // ignore: cast_nullable_to_non_nullable
                  as ActivityFeedbackEventPayload,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityMarkEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  bool? get markAllRead;
  bool? get markAllSeen;
  List<String>? get markRead;
  List<String>? get markSeen;
  List<String>? get markWatched;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityMarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityMarkEventCopyWith<ActivityMarkEvent> get copyWith => _$ActivityMarkEventCopyWithImpl<ActivityMarkEvent>(
    this as ActivityMarkEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityMarkEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.markAllRead, markAllRead) || other.markAllRead == markAllRead) &&
            (identical(other.markAllSeen, markAllSeen) || other.markAllSeen == markAllSeen) &&
            const DeepCollectionEquality().equals(other.markRead, markRead) &&
            const DeepCollectionEquality().equals(other.markSeen, markSeen) &&
            const DeepCollectionEquality().equals(
              other.markWatched,
              markWatched,
            ) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    markAllRead,
    markAllSeen,
    const DeepCollectionEquality().hash(markRead),
    const DeepCollectionEquality().hash(markSeen),
    const DeepCollectionEquality().hash(markWatched),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityMarkEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, markAllRead: $markAllRead, markAllSeen: $markAllSeen, markRead: $markRead, markSeen: $markSeen, markWatched: $markWatched, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityMarkEventCopyWith<$Res> {
  factory $ActivityMarkEventCopyWith(
    ActivityMarkEvent value,
    $Res Function(ActivityMarkEvent) _then,
  ) = _$ActivityMarkEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    bool? markAllRead,
    bool? markAllSeen,
    List<String>? markRead,
    List<String>? markSeen,
    List<String>? markWatched,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityMarkEventCopyWithImpl<$Res> implements $ActivityMarkEventCopyWith<$Res> {
  _$ActivityMarkEventCopyWithImpl(this._self, this._then);

  final ActivityMarkEvent _self;
  final $Res Function(ActivityMarkEvent) _then;

  /// Create a copy of ActivityMarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? markAllRead = freezed,
    Object? markAllSeen = freezed,
    Object? markRead = freezed,
    Object? markSeen = freezed,
    Object? markWatched = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityMarkEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        markAllRead: freezed == markAllRead
            ? _self.markAllRead
            : markAllRead // ignore: cast_nullable_to_non_nullable
                  as bool?,
        markAllSeen: freezed == markAllSeen
            ? _self.markAllSeen
            : markAllSeen // ignore: cast_nullable_to_non_nullable
                  as bool?,
        markRead: freezed == markRead
            ? _self.markRead
            : markRead // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        markSeen: freezed == markSeen
            ? _self.markSeen
            : markSeen // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        markWatched: freezed == markWatched
            ? _self.markWatched
            : markWatched // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityPinnedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PinActivityResponse get pinnedActivity;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityPinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityPinnedEventCopyWith<ActivityPinnedEvent> get copyWith =>
      _$ActivityPinnedEventCopyWithImpl<ActivityPinnedEvent>(
        this as ActivityPinnedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityPinnedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.pinnedActivity, pinnedActivity) || other.pinnedActivity == pinnedActivity) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    pinnedActivity,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityPinnedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, pinnedActivity: $pinnedActivity, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityPinnedEventCopyWith<$Res> {
  factory $ActivityPinnedEventCopyWith(
    ActivityPinnedEvent value,
    $Res Function(ActivityPinnedEvent) _then,
  ) = _$ActivityPinnedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PinActivityResponse pinnedActivity,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityPinnedEventCopyWithImpl<$Res> implements $ActivityPinnedEventCopyWith<$Res> {
  _$ActivityPinnedEventCopyWithImpl(this._self, this._then);

  final ActivityPinnedEvent _self;
  final $Res Function(ActivityPinnedEvent) _then;

  /// Create a copy of ActivityPinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? pinnedActivity = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityPinnedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        pinnedActivity: null == pinnedActivity
            ? _self.pinnedActivity
            : pinnedActivity // ignore: cast_nullable_to_non_nullable
                  as PinActivityResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityReactionAddedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityReactionAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityReactionAddedEventCopyWith<ActivityReactionAddedEvent> get copyWith =>
      _$ActivityReactionAddedEventCopyWithImpl<ActivityReactionAddedEvent>(
        this as ActivityReactionAddedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityReactionAddedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityReactionAddedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityReactionAddedEventCopyWith<$Res> {
  factory $ActivityReactionAddedEventCopyWith(
    ActivityReactionAddedEvent value,
    $Res Function(ActivityReactionAddedEvent) _then,
  ) = _$ActivityReactionAddedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityReactionAddedEventCopyWithImpl<$Res> implements $ActivityReactionAddedEventCopyWith<$Res> {
  _$ActivityReactionAddedEventCopyWithImpl(this._self, this._then);

  final ActivityReactionAddedEvent _self;
  final $Res Function(ActivityReactionAddedEvent) _then;

  /// Create a copy of ActivityReactionAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityReactionAddedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityReactionDeletedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityReactionDeletedEventCopyWith<ActivityReactionDeletedEvent> get copyWith =>
      _$ActivityReactionDeletedEventCopyWithImpl<ActivityReactionDeletedEvent>(
        this as ActivityReactionDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityReactionDeletedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityReactionDeletedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityReactionDeletedEventCopyWith<$Res> {
  factory $ActivityReactionDeletedEventCopyWith(
    ActivityReactionDeletedEvent value,
    $Res Function(ActivityReactionDeletedEvent) _then,
  ) = _$ActivityReactionDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityReactionDeletedEventCopyWithImpl<$Res> implements $ActivityReactionDeletedEventCopyWith<$Res> {
  _$ActivityReactionDeletedEventCopyWithImpl(this._self, this._then);

  final ActivityReactionDeletedEvent _self;
  final $Res Function(ActivityReactionDeletedEvent) _then;

  /// Create a copy of ActivityReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityReactionDeletedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityReactionUpdatedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityReactionUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityReactionUpdatedEventCopyWith<ActivityReactionUpdatedEvent> get copyWith =>
      _$ActivityReactionUpdatedEventCopyWithImpl<ActivityReactionUpdatedEvent>(
        this as ActivityReactionUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityReactionUpdatedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityReactionUpdatedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityReactionUpdatedEventCopyWith<$Res> {
  factory $ActivityReactionUpdatedEventCopyWith(
    ActivityReactionUpdatedEvent value,
    $Res Function(ActivityReactionUpdatedEvent) _then,
  ) = _$ActivityReactionUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityReactionUpdatedEventCopyWithImpl<$Res> implements $ActivityReactionUpdatedEventCopyWith<$Res> {
  _$ActivityReactionUpdatedEventCopyWithImpl(this._self, this._then);

  final ActivityReactionUpdatedEvent _self;
  final $Res Function(ActivityReactionUpdatedEvent) _then;

  /// Create a copy of ActivityReactionUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityReactionUpdatedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityRemovedFromFeedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityRemovedFromFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityRemovedFromFeedEventCopyWith<ActivityRemovedFromFeedEvent> get copyWith =>
      _$ActivityRemovedFromFeedEventCopyWithImpl<ActivityRemovedFromFeedEvent>(
        this as ActivityRemovedFromFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityRemovedFromFeedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityRemovedFromFeedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityRemovedFromFeedEventCopyWith<$Res> {
  factory $ActivityRemovedFromFeedEventCopyWith(
    ActivityRemovedFromFeedEvent value,
    $Res Function(ActivityRemovedFromFeedEvent) _then,
  ) = _$ActivityRemovedFromFeedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityRemovedFromFeedEventCopyWithImpl<$Res> implements $ActivityRemovedFromFeedEventCopyWith<$Res> {
  _$ActivityRemovedFromFeedEventCopyWithImpl(this._self, this._then);

  final ActivityRemovedFromFeedEvent _self;
  final $Res Function(ActivityRemovedFromFeedEvent) _then;

  /// Create a copy of ActivityRemovedFromFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityRemovedFromFeedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityRestoredEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityRestoredEventCopyWith<ActivityRestoredEvent> get copyWith =>
      _$ActivityRestoredEventCopyWithImpl<ActivityRestoredEvent>(
        this as ActivityRestoredEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityRestoredEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityRestoredEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityRestoredEventCopyWith<$Res> {
  factory $ActivityRestoredEventCopyWith(
    ActivityRestoredEvent value,
    $Res Function(ActivityRestoredEvent) _then,
  ) = _$ActivityRestoredEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityRestoredEventCopyWithImpl<$Res> implements $ActivityRestoredEventCopyWith<$Res> {
  _$ActivityRestoredEventCopyWithImpl(this._self, this._then);

  final ActivityRestoredEvent _self;
  final $Res Function(ActivityRestoredEvent) _then;

  /// Create a copy of ActivityRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityRestoredEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityUnpinnedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PinActivityResponse get pinnedActivity;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityUnpinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityUnpinnedEventCopyWith<ActivityUnpinnedEvent> get copyWith =>
      _$ActivityUnpinnedEventCopyWithImpl<ActivityUnpinnedEvent>(
        this as ActivityUnpinnedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityUnpinnedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.pinnedActivity, pinnedActivity) || other.pinnedActivity == pinnedActivity) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    pinnedActivity,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityUnpinnedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, pinnedActivity: $pinnedActivity, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityUnpinnedEventCopyWith<$Res> {
  factory $ActivityUnpinnedEventCopyWith(
    ActivityUnpinnedEvent value,
    $Res Function(ActivityUnpinnedEvent) _then,
  ) = _$ActivityUnpinnedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PinActivityResponse pinnedActivity,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityUnpinnedEventCopyWithImpl<$Res> implements $ActivityUnpinnedEventCopyWith<$Res> {
  _$ActivityUnpinnedEventCopyWithImpl(this._self, this._then);

  final ActivityUnpinnedEvent _self;
  final $Res Function(ActivityUnpinnedEvent) _then;

  /// Create a copy of ActivityUnpinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? pinnedActivity = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityUnpinnedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        pinnedActivity: null == pinnedActivity
            ? _self.pinnedActivity
            : pinnedActivity // ignore: cast_nullable_to_non_nullable
                  as PinActivityResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$ActivityUpdatedEvent {
  ActivityResponse get activity;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityUpdatedEventCopyWith<ActivityUpdatedEvent> get copyWith =>
      _$ActivityUpdatedEventCopyWithImpl<ActivityUpdatedEvent>(
        this as ActivityUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityUpdatedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'ActivityUpdatedEvent(activity: $activity, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityUpdatedEventCopyWith<$Res> {
  factory $ActivityUpdatedEventCopyWith(
    ActivityUpdatedEvent value,
    $Res Function(ActivityUpdatedEvent) _then,
  ) = _$ActivityUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$ActivityUpdatedEventCopyWithImpl<$Res> implements $ActivityUpdatedEventCopyWith<$Res> {
  _$ActivityUpdatedEventCopyWithImpl(this._self, this._then);

  final ActivityUpdatedEvent _self;
  final $Res Function(ActivityUpdatedEvent) _then;

  /// Create a copy of ActivityUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      ActivityUpdatedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$AppUpdatedEvent {
  AppEventResponse get app;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of AppUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUpdatedEventCopyWith<AppUpdatedEvent> get copyWith => _$AppUpdatedEventCopyWithImpl<AppUpdatedEvent>(
    this as AppUpdatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUpdatedEvent &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    app,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'AppUpdatedEvent(app: $app, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $AppUpdatedEventCopyWith<$Res> {
  factory $AppUpdatedEventCopyWith(
    AppUpdatedEvent value,
    $Res Function(AppUpdatedEvent) _then,
  ) = _$AppUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    AppEventResponse app,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$AppUpdatedEventCopyWithImpl<$Res> implements $AppUpdatedEventCopyWith<$Res> {
  _$AppUpdatedEventCopyWithImpl(this._self, this._then);

  final AppUpdatedEvent _self;
  final $Res Function(AppUpdatedEvent) _then;

  /// Create a copy of AppUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? app = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      AppUpdatedEvent(
        app: null == app
            ? _self.app
            : app // ignore: cast_nullable_to_non_nullable
                  as AppEventResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$BookmarkAddedEvent {
  BookmarkResponse get bookmark;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkAddedEventCopyWith<BookmarkAddedEvent> get copyWith => _$BookmarkAddedEventCopyWithImpl<BookmarkAddedEvent>(
    this as BookmarkAddedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkAddedEvent &&
            (identical(other.bookmark, bookmark) || other.bookmark == bookmark) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookmark,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'BookmarkAddedEvent(bookmark: $bookmark, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkAddedEventCopyWith<$Res> {
  factory $BookmarkAddedEventCopyWith(
    BookmarkAddedEvent value,
    $Res Function(BookmarkAddedEvent) _then,
  ) = _$BookmarkAddedEventCopyWithImpl;
  @useResult
  $Res call({
    BookmarkResponse bookmark,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$BookmarkAddedEventCopyWithImpl<$Res> implements $BookmarkAddedEventCopyWith<$Res> {
  _$BookmarkAddedEventCopyWithImpl(this._self, this._then);

  final BookmarkAddedEvent _self;
  final $Res Function(BookmarkAddedEvent) _then;

  /// Create a copy of BookmarkAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      BookmarkAddedEvent(
        bookmark: null == bookmark
            ? _self.bookmark
            : bookmark // ignore: cast_nullable_to_non_nullable
                  as BookmarkResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$BookmarkDeletedEvent {
  BookmarkResponse get bookmark;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkDeletedEventCopyWith<BookmarkDeletedEvent> get copyWith =>
      _$BookmarkDeletedEventCopyWithImpl<BookmarkDeletedEvent>(
        this as BookmarkDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkDeletedEvent &&
            (identical(other.bookmark, bookmark) || other.bookmark == bookmark) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookmark,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'BookmarkDeletedEvent(bookmark: $bookmark, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkDeletedEventCopyWith<$Res> {
  factory $BookmarkDeletedEventCopyWith(
    BookmarkDeletedEvent value,
    $Res Function(BookmarkDeletedEvent) _then,
  ) = _$BookmarkDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    BookmarkResponse bookmark,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$BookmarkDeletedEventCopyWithImpl<$Res> implements $BookmarkDeletedEventCopyWith<$Res> {
  _$BookmarkDeletedEventCopyWithImpl(this._self, this._then);

  final BookmarkDeletedEvent _self;
  final $Res Function(BookmarkDeletedEvent) _then;

  /// Create a copy of BookmarkDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      BookmarkDeletedEvent(
        bookmark: null == bookmark
            ? _self.bookmark
            : bookmark // ignore: cast_nullable_to_non_nullable
                  as BookmarkResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$BookmarkFolderDeletedEvent {
  BookmarkFolderResponse get bookmarkFolder;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkFolderDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderDeletedEventCopyWith<BookmarkFolderDeletedEvent> get copyWith =>
      _$BookmarkFolderDeletedEventCopyWithImpl<BookmarkFolderDeletedEvent>(
        this as BookmarkFolderDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderDeletedEvent &&
            (identical(other.bookmarkFolder, bookmarkFolder) || other.bookmarkFolder == bookmarkFolder) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookmarkFolder,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'BookmarkFolderDeletedEvent(bookmarkFolder: $bookmarkFolder, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderDeletedEventCopyWith<$Res> {
  factory $BookmarkFolderDeletedEventCopyWith(
    BookmarkFolderDeletedEvent value,
    $Res Function(BookmarkFolderDeletedEvent) _then,
  ) = _$BookmarkFolderDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    BookmarkFolderResponse bookmarkFolder,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$BookmarkFolderDeletedEventCopyWithImpl<$Res> implements $BookmarkFolderDeletedEventCopyWith<$Res> {
  _$BookmarkFolderDeletedEventCopyWithImpl(this._self, this._then);

  final BookmarkFolderDeletedEvent _self;
  final $Res Function(BookmarkFolderDeletedEvent) _then;

  /// Create a copy of BookmarkFolderDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkFolder = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      BookmarkFolderDeletedEvent(
        bookmarkFolder: null == bookmarkFolder
            ? _self.bookmarkFolder
            : bookmarkFolder // ignore: cast_nullable_to_non_nullable
                  as BookmarkFolderResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$BookmarkFolderUpdatedEvent {
  BookmarkFolderResponse get bookmarkFolder;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkFolderUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkFolderUpdatedEventCopyWith<BookmarkFolderUpdatedEvent> get copyWith =>
      _$BookmarkFolderUpdatedEventCopyWithImpl<BookmarkFolderUpdatedEvent>(
        this as BookmarkFolderUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkFolderUpdatedEvent &&
            (identical(other.bookmarkFolder, bookmarkFolder) || other.bookmarkFolder == bookmarkFolder) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookmarkFolder,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'BookmarkFolderUpdatedEvent(bookmarkFolder: $bookmarkFolder, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkFolderUpdatedEventCopyWith<$Res> {
  factory $BookmarkFolderUpdatedEventCopyWith(
    BookmarkFolderUpdatedEvent value,
    $Res Function(BookmarkFolderUpdatedEvent) _then,
  ) = _$BookmarkFolderUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    BookmarkFolderResponse bookmarkFolder,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$BookmarkFolderUpdatedEventCopyWithImpl<$Res> implements $BookmarkFolderUpdatedEventCopyWith<$Res> {
  _$BookmarkFolderUpdatedEventCopyWithImpl(this._self, this._then);

  final BookmarkFolderUpdatedEvent _self;
  final $Res Function(BookmarkFolderUpdatedEvent) _then;

  /// Create a copy of BookmarkFolderUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkFolder = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      BookmarkFolderUpdatedEvent(
        bookmarkFolder: null == bookmarkFolder
            ? _self.bookmarkFolder
            : bookmarkFolder // ignore: cast_nullable_to_non_nullable
                  as BookmarkFolderResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$BookmarkUpdatedEvent {
  BookmarkResponse get bookmark;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of BookmarkUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkUpdatedEventCopyWith<BookmarkUpdatedEvent> get copyWith =>
      _$BookmarkUpdatedEventCopyWithImpl<BookmarkUpdatedEvent>(
        this as BookmarkUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkUpdatedEvent &&
            (identical(other.bookmark, bookmark) || other.bookmark == bookmark) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bookmark,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'BookmarkUpdatedEvent(bookmark: $bookmark, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $BookmarkUpdatedEventCopyWith<$Res> {
  factory $BookmarkUpdatedEventCopyWith(
    BookmarkUpdatedEvent value,
    $Res Function(BookmarkUpdatedEvent) _then,
  ) = _$BookmarkUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    BookmarkResponse bookmark,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$BookmarkUpdatedEventCopyWithImpl<$Res> implements $BookmarkUpdatedEventCopyWith<$Res> {
  _$BookmarkUpdatedEventCopyWithImpl(this._self, this._then);

  final BookmarkUpdatedEvent _self;
  final $Res Function(BookmarkUpdatedEvent) _then;

  /// Create a copy of BookmarkUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      BookmarkUpdatedEvent(
        bookmark: null == bookmark
            ? _self.bookmark
            : bookmark // ignore: cast_nullable_to_non_nullable
                  as BookmarkResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentAddedEvent {
  ActivityResponse get activity;
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentAddedEventCopyWith<CommentAddedEvent> get copyWith => _$CommentAddedEventCopyWithImpl<CommentAddedEvent>(
    this as CommentAddedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentAddedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentAddedEvent(activity: $activity, comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentAddedEventCopyWith<$Res> {
  factory $CommentAddedEventCopyWith(
    CommentAddedEvent value,
    $Res Function(CommentAddedEvent) _then,
  ) = _$CommentAddedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentAddedEventCopyWithImpl<$Res> implements $CommentAddedEventCopyWith<$Res> {
  _$CommentAddedEventCopyWithImpl(this._self, this._then);

  final CommentAddedEvent _self;
  final $Res Function(CommentAddedEvent) _then;

  /// Create a copy of CommentAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentAddedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentDeletedEvent {
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentDeletedEventCopyWith<CommentDeletedEvent> get copyWith =>
      _$CommentDeletedEventCopyWithImpl<CommentDeletedEvent>(
        this as CommentDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentDeletedEvent &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentDeletedEvent(comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentDeletedEventCopyWith<$Res> {
  factory $CommentDeletedEventCopyWith(
    CommentDeletedEvent value,
    $Res Function(CommentDeletedEvent) _then,
  ) = _$CommentDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentDeletedEventCopyWithImpl<$Res> implements $CommentDeletedEventCopyWith<$Res> {
  _$CommentDeletedEventCopyWithImpl(this._self, this._then);

  final CommentDeletedEvent _self;
  final $Res Function(CommentDeletedEvent) _then;

  /// Create a copy of CommentDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentDeletedEvent(
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentFeedbackEvent {
  CommentFeedbackEventPayload get commentFeedback;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentFeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentFeedbackEventCopyWith<CommentFeedbackEvent> get copyWith =>
      _$CommentFeedbackEventCopyWithImpl<CommentFeedbackEvent>(
        this as CommentFeedbackEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentFeedbackEvent &&
            (identical(other.commentFeedback, commentFeedback) || other.commentFeedback == commentFeedback) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    commentFeedback,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentFeedbackEvent(commentFeedback: $commentFeedback, createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentFeedbackEventCopyWith<$Res> {
  factory $CommentFeedbackEventCopyWith(
    CommentFeedbackEvent value,
    $Res Function(CommentFeedbackEvent) _then,
  ) = _$CommentFeedbackEventCopyWithImpl;
  @useResult
  $Res call({
    CommentFeedbackEventPayload commentFeedback,
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentFeedbackEventCopyWithImpl<$Res> implements $CommentFeedbackEventCopyWith<$Res> {
  _$CommentFeedbackEventCopyWithImpl(this._self, this._then);

  final CommentFeedbackEvent _self;
  final $Res Function(CommentFeedbackEvent) _then;

  /// Create a copy of CommentFeedbackEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentFeedback = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentFeedbackEvent(
        commentFeedback: null == commentFeedback
            ? _self.commentFeedback
            : commentFeedback // ignore: cast_nullable_to_non_nullable
                  as CommentFeedbackEventPayload,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentReactionAddedEvent {
  ActivityResponse get activity;
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentReactionAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionAddedEventCopyWith<CommentReactionAddedEvent> get copyWith =>
      _$CommentReactionAddedEventCopyWithImpl<CommentReactionAddedEvent>(
        this as CommentReactionAddedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionAddedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentReactionAddedEvent(activity: $activity, comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionAddedEventCopyWith<$Res> {
  factory $CommentReactionAddedEventCopyWith(
    CommentReactionAddedEvent value,
    $Res Function(CommentReactionAddedEvent) _then,
  ) = _$CommentReactionAddedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentReactionAddedEventCopyWithImpl<$Res> implements $CommentReactionAddedEventCopyWith<$Res> {
  _$CommentReactionAddedEventCopyWithImpl(this._self, this._then);

  final CommentReactionAddedEvent _self;
  final $Res Function(CommentReactionAddedEvent) _then;

  /// Create a copy of CommentReactionAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentReactionAddedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentReactionDeletedEvent {
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of CommentReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionDeletedEventCopyWith<CommentReactionDeletedEvent> get copyWith =>
      _$CommentReactionDeletedEventCopyWithImpl<CommentReactionDeletedEvent>(
        this as CommentReactionDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionDeletedEvent &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'CommentReactionDeletedEvent(comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionDeletedEventCopyWith<$Res> {
  factory $CommentReactionDeletedEventCopyWith(
    CommentReactionDeletedEvent value,
    $Res Function(CommentReactionDeletedEvent) _then,
  ) = _$CommentReactionDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$CommentReactionDeletedEventCopyWithImpl<$Res> implements $CommentReactionDeletedEventCopyWith<$Res> {
  _$CommentReactionDeletedEventCopyWithImpl(this._self, this._then);

  final CommentReactionDeletedEvent _self;
  final $Res Function(CommentReactionDeletedEvent) _then;

  /// Create a copy of CommentReactionDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      CommentReactionDeletedEvent(
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentReactionUpdatedEvent {
  ActivityResponse get activity;
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedsReactionResponse get reaction;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentReactionUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionUpdatedEventCopyWith<CommentReactionUpdatedEvent> get copyWith =>
      _$CommentReactionUpdatedEventCopyWithImpl<CommentReactionUpdatedEvent>(
        this as CommentReactionUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionUpdatedEvent &&
            (identical(other.activity, activity) || other.activity == activity) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.reaction, reaction) || other.reaction == reaction) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    activity,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    reaction,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentReactionUpdatedEvent(activity: $activity, comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, reaction: $reaction, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionUpdatedEventCopyWith<$Res> {
  factory $CommentReactionUpdatedEventCopyWith(
    CommentReactionUpdatedEvent value,
    $Res Function(CommentReactionUpdatedEvent) _then,
  ) = _$CommentReactionUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    ActivityResponse activity,
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedsReactionResponse reaction,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentReactionUpdatedEventCopyWithImpl<$Res> implements $CommentReactionUpdatedEventCopyWith<$Res> {
  _$CommentReactionUpdatedEventCopyWithImpl(this._self, this._then);

  final CommentReactionUpdatedEvent _self;
  final $Res Function(CommentReactionUpdatedEvent) _then;

  /// Create a copy of CommentReactionUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? reaction = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentReactionUpdatedEvent(
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as ActivityResponse,
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        reaction: null == reaction
            ? _self.reaction
            : reaction // ignore: cast_nullable_to_non_nullable
                  as FeedsReactionResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentRestoredEvent {
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentRestoredEventCopyWith<CommentRestoredEvent> get copyWith =>
      _$CommentRestoredEventCopyWithImpl<CommentRestoredEvent>(
        this as CommentRestoredEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentRestoredEvent &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentRestoredEvent(comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentRestoredEventCopyWith<$Res> {
  factory $CommentRestoredEventCopyWith(
    CommentRestoredEvent value,
    $Res Function(CommentRestoredEvent) _then,
  ) = _$CommentRestoredEventCopyWithImpl;
  @useResult
  $Res call({
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentRestoredEventCopyWithImpl<$Res> implements $CommentRestoredEventCopyWith<$Res> {
  _$CommentRestoredEventCopyWithImpl(this._self, this._then);

  final CommentRestoredEvent _self;
  final $Res Function(CommentRestoredEvent) _then;

  /// Create a copy of CommentRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentRestoredEvent(
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommentUpdatedEvent {
  CommentResponse get comment;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of CommentUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentUpdatedEventCopyWith<CommentUpdatedEvent> get copyWith =>
      _$CommentUpdatedEventCopyWithImpl<CommentUpdatedEvent>(
        this as CommentUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentUpdatedEvent &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'CommentUpdatedEvent(comment: $comment, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $CommentUpdatedEventCopyWith<$Res> {
  factory $CommentUpdatedEventCopyWith(
    CommentUpdatedEvent value,
    $Res Function(CommentUpdatedEvent) _then,
  ) = _$CommentUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    CommentResponse comment,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$CommentUpdatedEventCopyWithImpl<$Res> implements $CommentUpdatedEventCopyWith<$Res> {
  _$CommentUpdatedEventCopyWithImpl(this._self, this._then);

  final CommentUpdatedEvent _self;
  final $Res Function(CommentUpdatedEvent) _then;

  /// Create a copy of CommentUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      CommentUpdatedEvent(
        comment: null == comment
            ? _self.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as CommentResponse,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedCreatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedResponse get feed;
  FeedVisibility? get feedVisibility;
  String get fid;
  List<FeedMemberResponse> get members;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of FeedCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedCreatedEventCopyWith<FeedCreatedEvent> get copyWith => _$FeedCreatedEventCopyWithImpl<FeedCreatedEvent>(
    this as FeedCreatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedCreatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feed,
    feedVisibility,
    fid,
    const DeepCollectionEquality().hash(members),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedCreatedEvent(createdAt: $createdAt, custom: $custom, feed: $feed, feedVisibility: $feedVisibility, fid: $fid, members: $members, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedCreatedEventCopyWith<$Res> {
  factory $FeedCreatedEventCopyWith(
    FeedCreatedEvent value,
    $Res Function(FeedCreatedEvent) _then,
  ) = _$FeedCreatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedResponse feed,
    FeedVisibility? feedVisibility,
    String fid,
    List<FeedMemberResponse> members,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$FeedCreatedEventCopyWithImpl<$Res> implements $FeedCreatedEventCopyWith<$Res> {
  _$FeedCreatedEventCopyWithImpl(this._self, this._then);

  final FeedCreatedEvent _self;
  final $Res Function(FeedCreatedEvent) _then;

  /// Create a copy of FeedCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feed = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? members = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      FeedCreatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feed: null == feed
            ? _self.feed
            : feed // ignore: cast_nullable_to_non_nullable
                  as FeedResponse,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        members: null == members
            ? _self.members
            : members // ignore: cast_nullable_to_non_nullable
                  as List<FeedMemberResponse>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedDeletedEventCopyWith<FeedDeletedEvent> get copyWith => _$FeedDeletedEventCopyWithImpl<FeedDeletedEvent>(
    this as FeedDeletedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedDeletedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedDeletedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedDeletedEventCopyWith<$Res> {
  factory $FeedDeletedEventCopyWith(
    FeedDeletedEvent value,
    $Res Function(FeedDeletedEvent) _then,
  ) = _$FeedDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedDeletedEventCopyWithImpl<$Res> implements $FeedDeletedEventCopyWith<$Res> {
  _$FeedDeletedEventCopyWithImpl(this._self, this._then);

  final FeedDeletedEvent _self;
  final $Res Function(FeedDeletedEvent) _then;

  /// Create a copy of FeedDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedDeletedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedGroupChangedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedGroup? get feedGroup;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedGroupChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupChangedEventCopyWith<FeedGroupChangedEvent> get copyWith =>
      _$FeedGroupChangedEventCopyWithImpl<FeedGroupChangedEvent>(
        this as FeedGroupChangedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroupChangedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedGroup, feedGroup) || other.feedGroup == feedGroup) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedGroup,
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedGroupChangedEvent(createdAt: $createdAt, custom: $custom, feedGroup: $feedGroup, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupChangedEventCopyWith<$Res> {
  factory $FeedGroupChangedEventCopyWith(
    FeedGroupChangedEvent value,
    $Res Function(FeedGroupChangedEvent) _then,
  ) = _$FeedGroupChangedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedGroup? feedGroup,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedGroupChangedEventCopyWithImpl<$Res> implements $FeedGroupChangedEventCopyWith<$Res> {
  _$FeedGroupChangedEventCopyWithImpl(this._self, this._then);

  final FeedGroupChangedEvent _self;
  final $Res Function(FeedGroupChangedEvent) _then;

  /// Create a copy of FeedGroupChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedGroup = freezed,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedGroupChangedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedGroup: freezed == feedGroup
            ? _self.feedGroup
            : feedGroup // ignore: cast_nullable_to_non_nullable
                  as FeedGroup?,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedGroupDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  String get groupId;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FeedGroupDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupDeletedEventCopyWith<FeedGroupDeletedEvent> get copyWith =>
      _$FeedGroupDeletedEventCopyWithImpl<FeedGroupDeletedEvent>(
        this as FeedGroupDeletedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroupDeletedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    groupId,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'FeedGroupDeletedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, groupId: $groupId, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupDeletedEventCopyWith<$Res> {
  factory $FeedGroupDeletedEventCopyWith(
    FeedGroupDeletedEvent value,
    $Res Function(FeedGroupDeletedEvent) _then,
  ) = _$FeedGroupDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    String groupId,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$FeedGroupDeletedEventCopyWithImpl<$Res> implements $FeedGroupDeletedEventCopyWith<$Res> {
  _$FeedGroupDeletedEventCopyWithImpl(this._self, this._then);

  final FeedGroupDeletedEvent _self;
  final $Res Function(FeedGroupDeletedEvent) _then;

  /// Create a copy of FeedGroupDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? groupId = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      FeedGroupDeletedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedGroupRestoredEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  String get groupId;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FeedGroupRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupRestoredEventCopyWith<FeedGroupRestoredEvent> get copyWith =>
      _$FeedGroupRestoredEventCopyWithImpl<FeedGroupRestoredEvent>(
        this as FeedGroupRestoredEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroupRestoredEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    groupId,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'FeedGroupRestoredEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, groupId: $groupId, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupRestoredEventCopyWith<$Res> {
  factory $FeedGroupRestoredEventCopyWith(
    FeedGroupRestoredEvent value,
    $Res Function(FeedGroupRestoredEvent) _then,
  ) = _$FeedGroupRestoredEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    String groupId,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$FeedGroupRestoredEventCopyWithImpl<$Res> implements $FeedGroupRestoredEventCopyWith<$Res> {
  _$FeedGroupRestoredEventCopyWithImpl(this._self, this._then);

  final FeedGroupRestoredEvent _self;
  final $Res Function(FeedGroupRestoredEvent) _then;

  /// Create a copy of FeedGroupRestoredEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? groupId = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      FeedGroupRestoredEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        groupId: null == groupId
            ? _self.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedMemberAddedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedMemberResponse get member;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedMemberAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberAddedEventCopyWith<FeedMemberAddedEvent> get copyWith =>
      _$FeedMemberAddedEventCopyWithImpl<FeedMemberAddedEvent>(
        this as FeedMemberAddedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberAddedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    member,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedMemberAddedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, member: $member, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberAddedEventCopyWith<$Res> {
  factory $FeedMemberAddedEventCopyWith(
    FeedMemberAddedEvent value,
    $Res Function(FeedMemberAddedEvent) _then,
  ) = _$FeedMemberAddedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedMemberResponse member,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedMemberAddedEventCopyWithImpl<$Res> implements $FeedMemberAddedEventCopyWith<$Res> {
  _$FeedMemberAddedEventCopyWithImpl(this._self, this._then);

  final FeedMemberAddedEvent _self;
  final $Res Function(FeedMemberAddedEvent) _then;

  /// Create a copy of FeedMemberAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? member = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedMemberAddedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        member: null == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as FeedMemberResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedMemberRemovedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  String get memberId;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedMemberRemovedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberRemovedEventCopyWith<FeedMemberRemovedEvent> get copyWith =>
      _$FeedMemberRemovedEventCopyWithImpl<FeedMemberRemovedEvent>(
        this as FeedMemberRemovedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberRemovedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.memberId, memberId) || other.memberId == memberId) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    memberId,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedMemberRemovedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, memberId: $memberId, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberRemovedEventCopyWith<$Res> {
  factory $FeedMemberRemovedEventCopyWith(
    FeedMemberRemovedEvent value,
    $Res Function(FeedMemberRemovedEvent) _then,
  ) = _$FeedMemberRemovedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    String memberId,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedMemberRemovedEventCopyWithImpl<$Res> implements $FeedMemberRemovedEventCopyWith<$Res> {
  _$FeedMemberRemovedEventCopyWithImpl(this._self, this._then);

  final FeedMemberRemovedEvent _self;
  final $Res Function(FeedMemberRemovedEvent) _then;

  /// Create a copy of FeedMemberRemovedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? memberId = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedMemberRemovedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        memberId: null == memberId
            ? _self.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedMemberUpdatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FeedMemberResponse get member;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedMemberUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberUpdatedEventCopyWith<FeedMemberUpdatedEvent> get copyWith =>
      _$FeedMemberUpdatedEventCopyWithImpl<FeedMemberUpdatedEvent>(
        this as FeedMemberUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberUpdatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    member,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedMemberUpdatedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, member: $member, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberUpdatedEventCopyWith<$Res> {
  factory $FeedMemberUpdatedEventCopyWith(
    FeedMemberUpdatedEvent value,
    $Res Function(FeedMemberUpdatedEvent) _then,
  ) = _$FeedMemberUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FeedMemberResponse member,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedMemberUpdatedEventCopyWithImpl<$Res> implements $FeedMemberUpdatedEventCopyWith<$Res> {
  _$FeedMemberUpdatedEventCopyWithImpl(this._self, this._then);

  final FeedMemberUpdatedEvent _self;
  final $Res Function(FeedMemberUpdatedEvent) _then;

  /// Create a copy of FeedMemberUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? member = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedMemberUpdatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        member: null == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as FeedMemberResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FeedUpdatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedResponse get feed;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedUpdatedEventCopyWith<FeedUpdatedEvent> get copyWith => _$FeedUpdatedEventCopyWithImpl<FeedUpdatedEvent>(
    this as FeedUpdatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedUpdatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feed,
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'FeedUpdatedEvent(createdAt: $createdAt, custom: $custom, feed: $feed, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedUpdatedEventCopyWith<$Res> {
  factory $FeedUpdatedEventCopyWith(
    FeedUpdatedEvent value,
    $Res Function(FeedUpdatedEvent) _then,
  ) = _$FeedUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedResponse feed,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$FeedUpdatedEventCopyWithImpl<$Res> implements $FeedUpdatedEventCopyWith<$Res> {
  _$FeedUpdatedEventCopyWithImpl(this._self, this._then);

  final FeedUpdatedEvent _self;
  final $Res Function(FeedUpdatedEvent) _then;

  /// Create a copy of FeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feed = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      FeedUpdatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feed: null == feed
            ? _self.feed
            : feed // ignore: cast_nullable_to_non_nullable
                  as FeedResponse,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowCreatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FollowResponse get follow;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FollowCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowCreatedEventCopyWith<FollowCreatedEvent> get copyWith => _$FollowCreatedEventCopyWithImpl<FollowCreatedEvent>(
    this as FollowCreatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowCreatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    follow,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'FollowCreatedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, follow: $follow, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FollowCreatedEventCopyWith<$Res> {
  factory $FollowCreatedEventCopyWith(
    FollowCreatedEvent value,
    $Res Function(FollowCreatedEvent) _then,
  ) = _$FollowCreatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FollowResponse follow,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$FollowCreatedEventCopyWithImpl<$Res> implements $FollowCreatedEventCopyWith<$Res> {
  _$FollowCreatedEventCopyWithImpl(this._self, this._then);

  final FollowCreatedEvent _self;
  final $Res Function(FollowCreatedEvent) _then;

  /// Create a copy of FollowCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? follow = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      FollowCreatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        follow: null == follow
            ? _self.follow
            : follow // ignore: cast_nullable_to_non_nullable
                  as FollowResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FollowResponse get follow;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FollowDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowDeletedEventCopyWith<FollowDeletedEvent> get copyWith => _$FollowDeletedEventCopyWithImpl<FollowDeletedEvent>(
    this as FollowDeletedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowDeletedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    follow,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'FollowDeletedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, follow: $follow, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FollowDeletedEventCopyWith<$Res> {
  factory $FollowDeletedEventCopyWith(
    FollowDeletedEvent value,
    $Res Function(FollowDeletedEvent) _then,
  ) = _$FollowDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FollowResponse follow,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$FollowDeletedEventCopyWithImpl<$Res> implements $FollowDeletedEventCopyWith<$Res> {
  _$FollowDeletedEventCopyWithImpl(this._self, this._then);

  final FollowDeletedEvent _self;
  final $Res Function(FollowDeletedEvent) _then;

  /// Create a copy of FollowDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? follow = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      FollowDeletedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        follow: null == follow
            ? _self.follow
            : follow // ignore: cast_nullable_to_non_nullable
                  as FollowResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowUpdatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  FollowResponse get follow;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FollowUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowUpdatedEventCopyWith<FollowUpdatedEvent> get copyWith => _$FollowUpdatedEventCopyWithImpl<FollowUpdatedEvent>(
    this as FollowUpdatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowUpdatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    follow,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'FollowUpdatedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, follow: $follow, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FollowUpdatedEventCopyWith<$Res> {
  factory $FollowUpdatedEventCopyWith(
    FollowUpdatedEvent value,
    $Res Function(FollowUpdatedEvent) _then,
  ) = _$FollowUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    FollowResponse follow,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$FollowUpdatedEventCopyWithImpl<$Res> implements $FollowUpdatedEventCopyWith<$Res> {
  _$FollowUpdatedEventCopyWithImpl(this._self, this._then);

  final FollowUpdatedEvent _self;
  final $Res Function(FollowUpdatedEvent) _then;

  /// Create a copy of FollowUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? follow = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      FollowUpdatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        follow: null == follow
            ? _self.follow
            : follow // ignore: cast_nullable_to_non_nullable
                  as FollowResponse,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$ModerationCustomActionEvent {
  String get actionId;
  Map<String, Object?>? get actionOptions;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  MessageResponse? get message;
  DateTime? get receivedAt;
  ReviewQueueItemResponse get reviewQueueItem;
  String get type;

  /// Create a copy of ModerationCustomActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationCustomActionEventCopyWith<ModerationCustomActionEvent> get copyWith =>
      _$ModerationCustomActionEventCopyWithImpl<ModerationCustomActionEvent>(
        this as ModerationCustomActionEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationCustomActionEvent &&
            (identical(other.actionId, actionId) || other.actionId == actionId) &&
            const DeepCollectionEquality().equals(
              other.actionOptions,
              actionOptions,
            ) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.reviewQueueItem, reviewQueueItem) || other.reviewQueueItem == reviewQueueItem) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    actionId,
    const DeepCollectionEquality().hash(actionOptions),
    createdAt,
    const DeepCollectionEquality().hash(custom),
    message,
    receivedAt,
    reviewQueueItem,
    type,
  );

  @override
  String toString() {
    return 'ModerationCustomActionEvent(actionId: $actionId, actionOptions: $actionOptions, createdAt: $createdAt, custom: $custom, message: $message, receivedAt: $receivedAt, reviewQueueItem: $reviewQueueItem, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ModerationCustomActionEventCopyWith<$Res> {
  factory $ModerationCustomActionEventCopyWith(
    ModerationCustomActionEvent value,
    $Res Function(ModerationCustomActionEvent) _then,
  ) = _$ModerationCustomActionEventCopyWithImpl;
  @useResult
  $Res call({
    String actionId,
    Map<String, Object?>? actionOptions,
    DateTime createdAt,
    Map<String, Object?> custom,
    MessageResponse? message,
    DateTime? receivedAt,
    ReviewQueueItemResponse reviewQueueItem,
    String type,
  });
}

/// @nodoc
class _$ModerationCustomActionEventCopyWithImpl<$Res> implements $ModerationCustomActionEventCopyWith<$Res> {
  _$ModerationCustomActionEventCopyWithImpl(this._self, this._then);

  final ModerationCustomActionEvent _self;
  final $Res Function(ModerationCustomActionEvent) _then;

  /// Create a copy of ModerationCustomActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionId = null,
    Object? actionOptions = freezed,
    Object? createdAt = null,
    Object? custom = null,
    Object? message = freezed,
    Object? receivedAt = freezed,
    Object? reviewQueueItem = null,
    Object? type = null,
  }) {
    return _then(
      ModerationCustomActionEvent(
        actionId: null == actionId
            ? _self.actionId
            : actionId // ignore: cast_nullable_to_non_nullable
                  as String,
        actionOptions: freezed == actionOptions
            ? _self.actionOptions
            : actionOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as MessageResponse?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        reviewQueueItem: null == reviewQueueItem
            ? _self.reviewQueueItem
            : reviewQueueItem // ignore: cast_nullable_to_non_nullable
                  as ReviewQueueItemResponse,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$ModerationFlaggedEvent {
  String get contentType;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String get objectId;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of ModerationFlaggedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationFlaggedEventCopyWith<ModerationFlaggedEvent> get copyWith =>
      _$ModerationFlaggedEventCopyWithImpl<ModerationFlaggedEvent>(
        this as ModerationFlaggedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationFlaggedEvent &&
            (identical(other.contentType, contentType) || other.contentType == contentType) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.objectId, objectId) || other.objectId == objectId) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    contentType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    objectId,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'ModerationFlaggedEvent(contentType: $contentType, createdAt: $createdAt, custom: $custom, objectId: $objectId, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ModerationFlaggedEventCopyWith<$Res> {
  factory $ModerationFlaggedEventCopyWith(
    ModerationFlaggedEvent value,
    $Res Function(ModerationFlaggedEvent) _then,
  ) = _$ModerationFlaggedEventCopyWithImpl;
  @useResult
  $Res call({
    String contentType,
    DateTime createdAt,
    Map<String, Object?> custom,
    String objectId,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$ModerationFlaggedEventCopyWithImpl<$Res> implements $ModerationFlaggedEventCopyWith<$Res> {
  _$ModerationFlaggedEventCopyWithImpl(this._self, this._then);

  final ModerationFlaggedEvent _self;
  final $Res Function(ModerationFlaggedEvent) _then;

  /// Create a copy of ModerationFlaggedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentType = null,
    Object? createdAt = null,
    Object? custom = null,
    Object? objectId = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      ModerationFlaggedEvent(
        contentType: null == contentType
            ? _self.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        objectId: null == objectId
            ? _self.objectId
            : objectId // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$ModerationMarkReviewedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  ReviewQueueItemResponse get item;
  MessageResponse? get message;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of ModerationMarkReviewedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModerationMarkReviewedEventCopyWith<ModerationMarkReviewedEvent> get copyWith =>
      _$ModerationMarkReviewedEventCopyWithImpl<ModerationMarkReviewedEvent>(
        this as ModerationMarkReviewedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModerationMarkReviewedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    item,
    message,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'ModerationMarkReviewedEvent(createdAt: $createdAt, custom: $custom, item: $item, message: $message, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ModerationMarkReviewedEventCopyWith<$Res> {
  factory $ModerationMarkReviewedEventCopyWith(
    ModerationMarkReviewedEvent value,
    $Res Function(ModerationMarkReviewedEvent) _then,
  ) = _$ModerationMarkReviewedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    ReviewQueueItemResponse item,
    MessageResponse? message,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$ModerationMarkReviewedEventCopyWithImpl<$Res> implements $ModerationMarkReviewedEventCopyWith<$Res> {
  _$ModerationMarkReviewedEventCopyWithImpl(this._self, this._then);

  final ModerationMarkReviewedEvent _self;
  final $Res Function(ModerationMarkReviewedEvent) _then;

  /// Create a copy of ModerationMarkReviewedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? item = null,
    Object? message = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      ModerationMarkReviewedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        item: null == item
            ? _self.item
            : item // ignore: cast_nullable_to_non_nullable
                  as ReviewQueueItemResponse,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as MessageResponse?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$NotificationFeedUpdatedEvent {
  List<AggregatedActivityResponse>? get aggregatedActivities;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  NotificationStatusResponse? get notificationStatus;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of NotificationFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationFeedUpdatedEventCopyWith<NotificationFeedUpdatedEvent> get copyWith =>
      _$NotificationFeedUpdatedEventCopyWithImpl<NotificationFeedUpdatedEvent>(
        this as NotificationFeedUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationFeedUpdatedEvent &&
            const DeepCollectionEquality().equals(
              other.aggregatedActivities,
              aggregatedActivities,
            ) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.notificationStatus, notificationStatus) ||
                other.notificationStatus == notificationStatus) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(aggregatedActivities),
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    notificationStatus,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'NotificationFeedUpdatedEvent(aggregatedActivities: $aggregatedActivities, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, notificationStatus: $notificationStatus, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $NotificationFeedUpdatedEventCopyWith<$Res> {
  factory $NotificationFeedUpdatedEventCopyWith(
    NotificationFeedUpdatedEvent value,
    $Res Function(NotificationFeedUpdatedEvent) _then,
  ) = _$NotificationFeedUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    List<AggregatedActivityResponse>? aggregatedActivities,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    NotificationStatusResponse? notificationStatus,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$NotificationFeedUpdatedEventCopyWithImpl<$Res> implements $NotificationFeedUpdatedEventCopyWith<$Res> {
  _$NotificationFeedUpdatedEventCopyWithImpl(this._self, this._then);

  final NotificationFeedUpdatedEvent _self;
  final $Res Function(NotificationFeedUpdatedEvent) _then;

  /// Create a copy of NotificationFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aggregatedActivities = freezed,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? notificationStatus = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      NotificationFeedUpdatedEvent(
        aggregatedActivities: freezed == aggregatedActivities
            ? _self.aggregatedActivities
            : aggregatedActivities // ignore: cast_nullable_to_non_nullable
                  as List<AggregatedActivityResponse>?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        notificationStatus: freezed == notificationStatus
            ? _self.notificationStatus
            : notificationStatus // ignore: cast_nullable_to_non_nullable
                  as NotificationStatusResponse?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$PollClosedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollClosedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollClosedFeedEventCopyWith<PollClosedFeedEvent> get copyWith =>
      _$PollClosedFeedEventCopyWithImpl<PollClosedFeedEvent>(
        this as PollClosedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollClosedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollClosedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollClosedFeedEventCopyWith<$Res> {
  factory $PollClosedFeedEventCopyWith(
    PollClosedFeedEvent value,
    $Res Function(PollClosedFeedEvent) _then,
  ) = _$PollClosedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollClosedFeedEventCopyWithImpl<$Res> implements $PollClosedFeedEventCopyWith<$Res> {
  _$PollClosedFeedEventCopyWithImpl(this._self, this._then);

  final PollClosedFeedEvent _self;
  final $Res Function(PollClosedFeedEvent) _then;

  /// Create a copy of PollClosedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollClosedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$PollDeletedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollDeletedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollDeletedFeedEventCopyWith<PollDeletedFeedEvent> get copyWith =>
      _$PollDeletedFeedEventCopyWithImpl<PollDeletedFeedEvent>(
        this as PollDeletedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollDeletedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollDeletedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollDeletedFeedEventCopyWith<$Res> {
  factory $PollDeletedFeedEventCopyWith(
    PollDeletedFeedEvent value,
    $Res Function(PollDeletedFeedEvent) _then,
  ) = _$PollDeletedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollDeletedFeedEventCopyWithImpl<$Res> implements $PollDeletedFeedEventCopyWith<$Res> {
  _$PollDeletedFeedEventCopyWithImpl(this._self, this._then);

  final PollDeletedFeedEvent _self;
  final $Res Function(PollDeletedFeedEvent) _then;

  /// Create a copy of PollDeletedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollDeletedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$PollUpdatedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollUpdatedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollUpdatedFeedEventCopyWith<PollUpdatedFeedEvent> get copyWith =>
      _$PollUpdatedFeedEventCopyWithImpl<PollUpdatedFeedEvent>(
        this as PollUpdatedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollUpdatedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollUpdatedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollUpdatedFeedEventCopyWith<$Res> {
  factory $PollUpdatedFeedEventCopyWith(
    PollUpdatedFeedEvent value,
    $Res Function(PollUpdatedFeedEvent) _then,
  ) = _$PollUpdatedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollUpdatedFeedEventCopyWithImpl<$Res> implements $PollUpdatedFeedEventCopyWith<$Res> {
  _$PollUpdatedFeedEventCopyWithImpl(this._self, this._then);

  final PollUpdatedFeedEvent _self;
  final $Res Function(PollUpdatedFeedEvent) _then;

  /// Create a copy of PollUpdatedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollUpdatedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$PollVoteCastedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  PollVoteResponseData get pollVote;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollVoteCastedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteCastedFeedEventCopyWith<PollVoteCastedFeedEvent> get copyWith =>
      _$PollVoteCastedFeedEventCopyWithImpl<PollVoteCastedFeedEvent>(
        this as PollVoteCastedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteCastedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.pollVote, pollVote) || other.pollVote == pollVote) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    pollVote,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollVoteCastedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, pollVote: $pollVote, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollVoteCastedFeedEventCopyWith<$Res> {
  factory $PollVoteCastedFeedEventCopyWith(
    PollVoteCastedFeedEvent value,
    $Res Function(PollVoteCastedFeedEvent) _then,
  ) = _$PollVoteCastedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    PollVoteResponseData pollVote,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollVoteCastedFeedEventCopyWithImpl<$Res> implements $PollVoteCastedFeedEventCopyWith<$Res> {
  _$PollVoteCastedFeedEventCopyWithImpl(this._self, this._then);

  final PollVoteCastedFeedEvent _self;
  final $Res Function(PollVoteCastedFeedEvent) _then;

  /// Create a copy of PollVoteCastedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? pollVote = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollVoteCastedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        pollVote: null == pollVote
            ? _self.pollVote
            : pollVote // ignore: cast_nullable_to_non_nullable
                  as PollVoteResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$PollVoteChangedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  PollVoteResponseData get pollVote;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollVoteChangedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteChangedFeedEventCopyWith<PollVoteChangedFeedEvent> get copyWith =>
      _$PollVoteChangedFeedEventCopyWithImpl<PollVoteChangedFeedEvent>(
        this as PollVoteChangedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteChangedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.pollVote, pollVote) || other.pollVote == pollVote) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    pollVote,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollVoteChangedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, pollVote: $pollVote, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollVoteChangedFeedEventCopyWith<$Res> {
  factory $PollVoteChangedFeedEventCopyWith(
    PollVoteChangedFeedEvent value,
    $Res Function(PollVoteChangedFeedEvent) _then,
  ) = _$PollVoteChangedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    PollVoteResponseData pollVote,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollVoteChangedFeedEventCopyWithImpl<$Res> implements $PollVoteChangedFeedEventCopyWith<$Res> {
  _$PollVoteChangedFeedEventCopyWithImpl(this._self, this._then);

  final PollVoteChangedFeedEvent _self;
  final $Res Function(PollVoteChangedFeedEvent) _then;

  /// Create a copy of PollVoteChangedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? pollVote = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollVoteChangedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        pollVote: null == pollVote
            ? _self.pollVote
            : pollVote // ignore: cast_nullable_to_non_nullable
                  as PollVoteResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$PollVoteRemovedFeedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  PollResponseData get poll;
  PollVoteResponseData get pollVote;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of PollVoteRemovedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteRemovedFeedEventCopyWith<PollVoteRemovedFeedEvent> get copyWith =>
      _$PollVoteRemovedFeedEventCopyWithImpl<PollVoteRemovedFeedEvent>(
        this as PollVoteRemovedFeedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteRemovedFeedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.pollVote, pollVote) || other.pollVote == pollVote) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    poll,
    pollVote,
    receivedAt,
    type,
  );

  @override
  String toString() {
    return 'PollVoteRemovedFeedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, poll: $poll, pollVote: $pollVote, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PollVoteRemovedFeedEventCopyWith<$Res> {
  factory $PollVoteRemovedFeedEventCopyWith(
    PollVoteRemovedFeedEvent value,
    $Res Function(PollVoteRemovedFeedEvent) _then,
  ) = _$PollVoteRemovedFeedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    PollResponseData poll,
    PollVoteResponseData pollVote,
    DateTime? receivedAt,
    String type,
  });
}

/// @nodoc
class _$PollVoteRemovedFeedEventCopyWithImpl<$Res> implements $PollVoteRemovedFeedEventCopyWith<$Res> {
  _$PollVoteRemovedFeedEventCopyWithImpl(this._self, this._then);

  final PollVoteRemovedFeedEvent _self;
  final $Res Function(PollVoteRemovedFeedEvent) _then;

  /// Create a copy of PollVoteRemovedFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? poll = null,
    Object? pollVote = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(
      PollVoteRemovedFeedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        poll: null == poll
            ? _self.poll
            : poll // ignore: cast_nullable_to_non_nullable
                  as PollResponseData,
        pollVote: null == pollVote
            ? _self.pollVote
            : pollVote // ignore: cast_nullable_to_non_nullable
                  as PollVoteResponseData,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$StoriesFeedUpdatedEvent {
  List<ActivityResponse>? get activities;
  List<AggregatedActivityResponse>? get aggregatedActivities;
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedVisibility? get feedVisibility;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of StoriesFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesFeedUpdatedEventCopyWith<StoriesFeedUpdatedEvent> get copyWith =>
      _$StoriesFeedUpdatedEventCopyWithImpl<StoriesFeedUpdatedEvent>(
        this as StoriesFeedUpdatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesFeedUpdatedEvent &&
            const DeepCollectionEquality().equals(
              other.activities,
              activities,
            ) &&
            const DeepCollectionEquality().equals(
              other.aggregatedActivities,
              aggregatedActivities,
            ) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) || other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(activities),
    const DeepCollectionEquality().hash(aggregatedActivities),
    createdAt,
    const DeepCollectionEquality().hash(custom),
    feedVisibility,
    fid,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'StoriesFeedUpdatedEvent(activities: $activities, aggregatedActivities: $aggregatedActivities, createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $StoriesFeedUpdatedEventCopyWith<$Res> {
  factory $StoriesFeedUpdatedEventCopyWith(
    StoriesFeedUpdatedEvent value,
    $Res Function(StoriesFeedUpdatedEvent) _then,
  ) = _$StoriesFeedUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    List<ActivityResponse>? activities,
    List<AggregatedActivityResponse>? aggregatedActivities,
    DateTime createdAt,
    Map<String, Object?> custom,
    FeedVisibility? feedVisibility,
    String fid,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields? user,
  });
}

/// @nodoc
class _$StoriesFeedUpdatedEventCopyWithImpl<$Res> implements $StoriesFeedUpdatedEventCopyWith<$Res> {
  _$StoriesFeedUpdatedEventCopyWithImpl(this._self, this._then);

  final StoriesFeedUpdatedEvent _self;
  final $Res Function(StoriesFeedUpdatedEvent) _then;

  /// Create a copy of StoriesFeedUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = freezed,
    Object? aggregatedActivities = freezed,
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(
      StoriesFeedUpdatedEvent(
        activities: freezed == activities
            ? _self.activities
            : activities // ignore: cast_nullable_to_non_nullable
                  as List<ActivityResponse>?,
        aggregatedActivities: freezed == aggregatedActivities
            ? _self.aggregatedActivities
            : aggregatedActivities // ignore: cast_nullable_to_non_nullable
                  as List<AggregatedActivityResponse>?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        feedVisibility: freezed == feedVisibility
            ? _self.feedVisibility
            : feedVisibility // ignore: cast_nullable_to_non_nullable
                  as FeedVisibility?,
        fid: null == fid
            ? _self.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as String,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
      ),
    );
  }
}

/// @nodoc
mixin _$UserBannedEvent {
  Map<String, Object?>? get channelCustom;
  String? get channelId;
  int? get channelMemberCount;
  int? get channelMessageCount;
  String? get channelType;
  String? get cid;
  DateTime get createdAt;
  UserResponseCommonFields? get createdBy;
  Map<String, Object?> get custom;
  DateTime? get expiration;
  String? get reason;
  DateTime? get receivedAt;
  String? get reviewQueueItemId;
  bool? get shadow;
  String? get team;
  int? get totalBans;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of UserBannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBannedEventCopyWith<UserBannedEvent> get copyWith => _$UserBannedEventCopyWithImpl<UserBannedEvent>(
    this as UserBannedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBannedEvent &&
            const DeepCollectionEquality().equals(
              other.channelCustom,
              channelCustom,
            ) &&
            (identical(other.channelId, channelId) || other.channelId == channelId) &&
            (identical(other.channelMemberCount, channelMemberCount) ||
                other.channelMemberCount == channelMemberCount) &&
            (identical(other.channelMessageCount, channelMessageCount) ||
                other.channelMessageCount == channelMessageCount) &&
            (identical(other.channelType, channelType) || other.channelType == channelType) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) || other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.expiration, expiration) || other.expiration == expiration) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.reviewQueueItemId, reviewQueueItemId) || other.reviewQueueItemId == reviewQueueItemId) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.totalBans, totalBans) || other.totalBans == totalBans) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(channelCustom),
    channelId,
    channelMemberCount,
    channelMessageCount,
    channelType,
    cid,
    createdAt,
    createdBy,
    const DeepCollectionEquality().hash(custom),
    expiration,
    reason,
    receivedAt,
    reviewQueueItemId,
    shadow,
    team,
    totalBans,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserBannedEvent(channelCustom: $channelCustom, channelId: $channelId, channelMemberCount: $channelMemberCount, channelMessageCount: $channelMessageCount, channelType: $channelType, cid: $cid, createdAt: $createdAt, createdBy: $createdBy, custom: $custom, expiration: $expiration, reason: $reason, receivedAt: $receivedAt, reviewQueueItemId: $reviewQueueItemId, shadow: $shadow, team: $team, totalBans: $totalBans, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserBannedEventCopyWith<$Res> {
  factory $UserBannedEventCopyWith(
    UserBannedEvent value,
    $Res Function(UserBannedEvent) _then,
  ) = _$UserBannedEventCopyWithImpl;
  @useResult
  $Res call({
    Map<String, Object?>? channelCustom,
    String? channelId,
    int? channelMemberCount,
    int? channelMessageCount,
    String? channelType,
    String? cid,
    DateTime createdAt,
    UserResponseCommonFields? createdBy,
    Map<String, Object?> custom,
    DateTime? expiration,
    String? reason,
    DateTime? receivedAt,
    String? reviewQueueItemId,
    bool? shadow,
    String? team,
    int? totalBans,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$UserBannedEventCopyWithImpl<$Res> implements $UserBannedEventCopyWith<$Res> {
  _$UserBannedEventCopyWithImpl(this._self, this._then);

  final UserBannedEvent _self;
  final $Res Function(UserBannedEvent) _then;

  /// Create a copy of UserBannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelCustom = freezed,
    Object? channelId = freezed,
    Object? channelMemberCount = freezed,
    Object? channelMessageCount = freezed,
    Object? channelType = freezed,
    Object? cid = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? custom = null,
    Object? expiration = freezed,
    Object? reason = freezed,
    Object? receivedAt = freezed,
    Object? reviewQueueItemId = freezed,
    Object? shadow = freezed,
    Object? team = freezed,
    Object? totalBans = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserBannedEvent(
        channelCustom: freezed == channelCustom
            ? _self.channelCustom
            : channelCustom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelMemberCount: freezed == channelMemberCount
            ? _self.channelMemberCount
            : channelMemberCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        channelMessageCount: freezed == channelMessageCount
            ? _self.channelMessageCount
            : channelMessageCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        channelType: freezed == channelType
            ? _self.channelType
            : channelType // ignore: cast_nullable_to_non_nullable
                  as String?,
        cid: freezed == cid
            ? _self.cid
            : cid // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdBy: freezed == createdBy
            ? _self.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        expiration: freezed == expiration
            ? _self.expiration
            : expiration // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        reason: freezed == reason
            ? _self.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        reviewQueueItemId: freezed == reviewQueueItemId
            ? _self.reviewQueueItemId
            : reviewQueueItemId // ignore: cast_nullable_to_non_nullable
                  as String?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as bool?,
        team: freezed == team
            ? _self.team
            : team // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalBans: freezed == totalBans
            ? _self.totalBans
            : totalBans // ignore: cast_nullable_to_non_nullable
                  as int?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$UserDeactivatedEvent {
  DateTime get createdAt;
  UserResponseCommonFields? get createdBy;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of UserDeactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDeactivatedEventCopyWith<UserDeactivatedEvent> get copyWith =>
      _$UserDeactivatedEventCopyWithImpl<UserDeactivatedEvent>(
        this as UserDeactivatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDeactivatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) || other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    createdBy,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserDeactivatedEvent(createdAt: $createdAt, createdBy: $createdBy, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserDeactivatedEventCopyWith<$Res> {
  factory $UserDeactivatedEventCopyWith(
    UserDeactivatedEvent value,
    $Res Function(UserDeactivatedEvent) _then,
  ) = _$UserDeactivatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    UserResponseCommonFields? createdBy,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$UserDeactivatedEventCopyWithImpl<$Res> implements $UserDeactivatedEventCopyWith<$Res> {
  _$UserDeactivatedEventCopyWithImpl(this._self, this._then);

  final UserDeactivatedEvent _self;
  final $Res Function(UserDeactivatedEvent) _then;

  /// Create a copy of UserDeactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserDeactivatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdBy: freezed == createdBy
            ? _self.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$UserDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String get deleteConversation;
  bool get deleteConversationChannels;
  String get deleteMessages;
  String get deleteUser;
  bool get hardDelete;
  bool get markMessagesDeleted;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of UserDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDeletedEventCopyWith<UserDeletedEvent> get copyWith => _$UserDeletedEventCopyWithImpl<UserDeletedEvent>(
    this as UserDeletedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDeletedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deleteConversation, deleteConversation) ||
                other.deleteConversation == deleteConversation) &&
            (identical(
                  other.deleteConversationChannels,
                  deleteConversationChannels,
                ) ||
                other.deleteConversationChannels == deleteConversationChannels) &&
            (identical(other.deleteMessages, deleteMessages) || other.deleteMessages == deleteMessages) &&
            (identical(other.deleteUser, deleteUser) || other.deleteUser == deleteUser) &&
            (identical(other.hardDelete, hardDelete) || other.hardDelete == hardDelete) &&
            (identical(other.markMessagesDeleted, markMessagesDeleted) ||
                other.markMessagesDeleted == markMessagesDeleted) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    deleteConversation,
    deleteConversationChannels,
    deleteMessages,
    deleteUser,
    hardDelete,
    markMessagesDeleted,
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserDeletedEvent(createdAt: $createdAt, custom: $custom, deleteConversation: $deleteConversation, deleteConversationChannels: $deleteConversationChannels, deleteMessages: $deleteMessages, deleteUser: $deleteUser, hardDelete: $hardDelete, markMessagesDeleted: $markMessagesDeleted, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserDeletedEventCopyWith<$Res> {
  factory $UserDeletedEventCopyWith(
    UserDeletedEvent value,
    $Res Function(UserDeletedEvent) _then,
  ) = _$UserDeletedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    String deleteConversation,
    bool deleteConversationChannels,
    String deleteMessages,
    String deleteUser,
    bool hardDelete,
    bool markMessagesDeleted,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$UserDeletedEventCopyWithImpl<$Res> implements $UserDeletedEventCopyWith<$Res> {
  _$UserDeletedEventCopyWithImpl(this._self, this._then);

  final UserDeletedEvent _self;
  final $Res Function(UserDeletedEvent) _then;

  /// Create a copy of UserDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? deleteConversation = null,
    Object? deleteConversationChannels = null,
    Object? deleteMessages = null,
    Object? deleteUser = null,
    Object? hardDelete = null,
    Object? markMessagesDeleted = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserDeletedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        deleteConversation: null == deleteConversation
            ? _self.deleteConversation
            : deleteConversation // ignore: cast_nullable_to_non_nullable
                  as String,
        deleteConversationChannels: null == deleteConversationChannels
            ? _self.deleteConversationChannels
            : deleteConversationChannels // ignore: cast_nullable_to_non_nullable
                  as bool,
        deleteMessages: null == deleteMessages
            ? _self.deleteMessages
            : deleteMessages // ignore: cast_nullable_to_non_nullable
                  as String,
        deleteUser: null == deleteUser
            ? _self.deleteUser
            : deleteUser // ignore: cast_nullable_to_non_nullable
                  as String,
        hardDelete: null == hardDelete
            ? _self.hardDelete
            : hardDelete // ignore: cast_nullable_to_non_nullable
                  as bool,
        markMessagesDeleted: null == markMessagesDeleted
            ? _self.markMessagesDeleted
            : markMessagesDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$UserReactivatedEvent {
  DateTime get createdAt;
  UserResponseCommonFields? get createdBy;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of UserReactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReactivatedEventCopyWith<UserReactivatedEvent> get copyWith =>
      _$UserReactivatedEventCopyWithImpl<UserReactivatedEvent>(
        this as UserReactivatedEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReactivatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) || other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    createdBy,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserReactivatedEvent(createdAt: $createdAt, createdBy: $createdBy, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserReactivatedEventCopyWith<$Res> {
  factory $UserReactivatedEventCopyWith(
    UserReactivatedEvent value,
    $Res Function(UserReactivatedEvent) _then,
  ) = _$UserReactivatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    UserResponseCommonFields? createdBy,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$UserReactivatedEventCopyWithImpl<$Res> implements $UserReactivatedEventCopyWith<$Res> {
  _$UserReactivatedEventCopyWithImpl(this._self, this._then);

  final UserReactivatedEvent _self;
  final $Res Function(UserReactivatedEvent) _then;

  /// Create a copy of UserReactivatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserReactivatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdBy: freezed == createdBy
            ? _self.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$UserUnbannedEvent {
  Map<String, Object?>? get channelCustom;
  String? get channelId;
  int? get channelMemberCount;
  int? get channelMessageCount;
  String? get channelType;
  String? get cid;
  DateTime get createdAt;
  UserResponseCommonFields? get createdBy;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  bool? get shadow;
  String? get team;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of UserUnbannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserUnbannedEventCopyWith<UserUnbannedEvent> get copyWith => _$UserUnbannedEventCopyWithImpl<UserUnbannedEvent>(
    this as UserUnbannedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserUnbannedEvent &&
            const DeepCollectionEquality().equals(
              other.channelCustom,
              channelCustom,
            ) &&
            (identical(other.channelId, channelId) || other.channelId == channelId) &&
            (identical(other.channelMemberCount, channelMemberCount) ||
                other.channelMemberCount == channelMemberCount) &&
            (identical(other.channelMessageCount, channelMessageCount) ||
                other.channelMessageCount == channelMessageCount) &&
            (identical(other.channelType, channelType) || other.channelType == channelType) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) || other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(channelCustom),
    channelId,
    channelMemberCount,
    channelMessageCount,
    channelType,
    cid,
    createdAt,
    createdBy,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    shadow,
    team,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserUnbannedEvent(channelCustom: $channelCustom, channelId: $channelId, channelMemberCount: $channelMemberCount, channelMessageCount: $channelMessageCount, channelType: $channelType, cid: $cid, createdAt: $createdAt, createdBy: $createdBy, custom: $custom, receivedAt: $receivedAt, shadow: $shadow, team: $team, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserUnbannedEventCopyWith<$Res> {
  factory $UserUnbannedEventCopyWith(
    UserUnbannedEvent value,
    $Res Function(UserUnbannedEvent) _then,
  ) = _$UserUnbannedEventCopyWithImpl;
  @useResult
  $Res call({
    Map<String, Object?>? channelCustom,
    String? channelId,
    int? channelMemberCount,
    int? channelMessageCount,
    String? channelType,
    String? cid,
    DateTime createdAt,
    UserResponseCommonFields? createdBy,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    bool? shadow,
    String? team,
    String type,
    UserResponseCommonFields user,
  });
}

/// @nodoc
class _$UserUnbannedEventCopyWithImpl<$Res> implements $UserUnbannedEventCopyWith<$Res> {
  _$UserUnbannedEventCopyWithImpl(this._self, this._then);

  final UserUnbannedEvent _self;
  final $Res Function(UserUnbannedEvent) _then;

  /// Create a copy of UserUnbannedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelCustom = freezed,
    Object? channelId = freezed,
    Object? channelMemberCount = freezed,
    Object? channelMessageCount = freezed,
    Object? channelType = freezed,
    Object? cid = freezed,
    Object? createdAt = null,
    Object? createdBy = freezed,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? shadow = freezed,
    Object? team = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserUnbannedEvent(
        channelCustom: freezed == channelCustom
            ? _self.channelCustom
            : channelCustom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelMemberCount: freezed == channelMemberCount
            ? _self.channelMemberCount
            : channelMemberCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        channelMessageCount: freezed == channelMessageCount
            ? _self.channelMessageCount
            : channelMessageCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        channelType: freezed == channelType
            ? _self.channelType
            : channelType // ignore: cast_nullable_to_non_nullable
                  as String?,
        cid: freezed == cid
            ? _self.cid
            : cid // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdBy: freezed == createdBy
            ? _self.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields?,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        shadow: freezed == shadow
            ? _self.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as bool?,
        team: freezed == team
            ? _self.team
            : team // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseCommonFields,
      ),
    );
  }
}

/// @nodoc
mixin _$UserUpdatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  DateTime? get receivedAt;
  String get type;
  UserResponsePrivacyFields get user;

  /// Create a copy of UserUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserUpdatedEventCopyWith<UserUpdatedEvent> get copyWith => _$UserUpdatedEventCopyWithImpl<UserUpdatedEvent>(
    this as UserUpdatedEvent,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserUpdatedEvent &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    const DeepCollectionEquality().hash(custom),
    receivedAt,
    type,
    user,
  );

  @override
  String toString() {
    return 'UserUpdatedEvent(createdAt: $createdAt, custom: $custom, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $UserUpdatedEventCopyWith<$Res> {
  factory $UserUpdatedEventCopyWith(
    UserUpdatedEvent value,
    $Res Function(UserUpdatedEvent) _then,
  ) = _$UserUpdatedEventCopyWithImpl;
  @useResult
  $Res call({
    DateTime createdAt,
    Map<String, Object?> custom,
    DateTime? receivedAt,
    String type,
    UserResponsePrivacyFields user,
  });
}

/// @nodoc
class _$UserUpdatedEventCopyWithImpl<$Res> implements $UserUpdatedEventCopyWith<$Res> {
  _$UserUpdatedEventCopyWithImpl(this._self, this._then);

  final UserUpdatedEvent _self;
  final $Res Function(UserUpdatedEvent) _then;

  /// Create a copy of UserUpdatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(
      UserUpdatedEvent(
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        custom: null == custom
            ? _self.custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, Object?>,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponsePrivacyFields,
      ),
    );
  }
}
