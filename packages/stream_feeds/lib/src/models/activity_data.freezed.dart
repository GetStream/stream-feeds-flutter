// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityData {
  List<Attachment> get attachments;
  int get bookmarkCount;
  int get commentCount;
  List<CommentData> get comments;
  DateTime get createdAt;
  FeedData? get currentFeed;
  DateTime? get deletedAt;
  DateTime? get editedAt;
  DateTime? get expiresAt;
  List<String> get feeds;
  List<String> get filterTags;
  String get id;
  List<String> get interestTags;
  List<FeedsReactionData> get latestReactions;
  ActivityLocation? get location;
  List<UserData> get mentionedUsers;
  Moderation? get moderation;
  NotificationContext? get notificationContext;
  List<BookmarkData> get ownBookmarks;
  List<FeedsReactionData> get ownReactions;
  ActivityData? get parent;
  PollData? get poll;
  int get popularity;
  int get reactionCount;
  Map<String, ReactionGroupData> get reactionGroups;
  double get score;
  Map<String, Object?> get searchData;
  int get shareCount;
  String? get text;
  String get type;
  DateTime get updatedAt;
  UserData get user;
  ActivityDataVisibility get visibility;
  String? get visibilityTag;
  Map<String, Object?>? get custom;

  /// Create a copy of ActivityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityDataCopyWith<ActivityData> get copyWith =>
      _$ActivityDataCopyWithImpl<ActivityData>(
          this as ActivityData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityData &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.bookmarkCount, bookmarkCount) ||
                other.bookmarkCount == bookmarkCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.currentFeed, currentFeed) ||
                other.currentFeed == currentFeed) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.interestTags, interestTags) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUsers, mentionedUsers) &&
            (identical(other.moderation, moderation) ||
                other.moderation == moderation) &&
            (identical(other.notificationContext, notificationContext) ||
                other.notificationContext == notificationContext) &&
            const DeepCollectionEquality()
                .equals(other.ownBookmarks, ownBookmarks) &&
            const DeepCollectionEquality()
                .equals(other.ownReactions, ownReactions) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.reactionCount, reactionCount) ||
                other.reactionCount == reactionCount) &&
            const DeepCollectionEquality()
                .equals(other.reactionGroups, reactionGroups) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other.searchData, searchData) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.visibilityTag, visibilityTag) ||
                other.visibilityTag == visibilityTag) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(attachments),
        bookmarkCount,
        commentCount,
        const DeepCollectionEquality().hash(comments),
        createdAt,
        currentFeed,
        deletedAt,
        editedAt,
        expiresAt,
        const DeepCollectionEquality().hash(feeds),
        const DeepCollectionEquality().hash(filterTags),
        id,
        const DeepCollectionEquality().hash(interestTags),
        const DeepCollectionEquality().hash(latestReactions),
        location,
        const DeepCollectionEquality().hash(mentionedUsers),
        moderation,
        notificationContext,
        const DeepCollectionEquality().hash(ownBookmarks),
        const DeepCollectionEquality().hash(ownReactions),
        parent,
        poll,
        popularity,
        reactionCount,
        const DeepCollectionEquality().hash(reactionGroups),
        score,
        const DeepCollectionEquality().hash(searchData),
        shareCount,
        text,
        type,
        updatedAt,
        user,
        visibility,
        visibilityTag,
        const DeepCollectionEquality().hash(custom)
      ]);

  @override
  String toString() {
    return 'ActivityData(attachments: $attachments, bookmarkCount: $bookmarkCount, commentCount: $commentCount, comments: $comments, createdAt: $createdAt, currentFeed: $currentFeed, deletedAt: $deletedAt, editedAt: $editedAt, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, id: $id, interestTags: $interestTags, latestReactions: $latestReactions, location: $location, mentionedUsers: $mentionedUsers, moderation: $moderation, notificationContext: $notificationContext, ownBookmarks: $ownBookmarks, ownReactions: $ownReactions, parent: $parent, poll: $poll, popularity: $popularity, reactionCount: $reactionCount, reactionGroups: $reactionGroups, score: $score, searchData: $searchData, shareCount: $shareCount, text: $text, type: $type, updatedAt: $updatedAt, user: $user, visibility: $visibility, visibilityTag: $visibilityTag, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $ActivityDataCopyWith<$Res> {
  factory $ActivityDataCopyWith(
          ActivityData value, $Res Function(ActivityData) _then) =
      _$ActivityDataCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment> attachments,
      int bookmarkCount,
      int commentCount,
      List<CommentData> comments,
      DateTime createdAt,
      FeedData? currentFeed,
      DateTime? deletedAt,
      DateTime? editedAt,
      DateTime? expiresAt,
      List<String> feeds,
      List<String> filterTags,
      String id,
      List<String> interestTags,
      List<FeedsReactionData> latestReactions,
      ActivityLocation? location,
      List<UserData> mentionedUsers,
      Moderation? moderation,
      NotificationContext? notificationContext,
      List<BookmarkData> ownBookmarks,
      List<FeedsReactionData> ownReactions,
      ActivityData? parent,
      PollData? poll,
      int popularity,
      int reactionCount,
      Map<String, ReactionGroupData> reactionGroups,
      double score,
      Map<String, Object?> searchData,
      int shareCount,
      String? text,
      String type,
      DateTime updatedAt,
      UserData user,
      ActivityDataVisibility visibility,
      String? visibilityTag,
      Map<String, Object?>? custom});
}

/// @nodoc
class _$ActivityDataCopyWithImpl<$Res> implements $ActivityDataCopyWith<$Res> {
  _$ActivityDataCopyWithImpl(this._self, this._then);

  final ActivityData _self;
  final $Res Function(ActivityData) _then;

  /// Create a copy of ActivityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachments = null,
    Object? bookmarkCount = null,
    Object? commentCount = null,
    Object? comments = null,
    Object? createdAt = null,
    Object? currentFeed = freezed,
    Object? deletedAt = freezed,
    Object? editedAt = freezed,
    Object? expiresAt = freezed,
    Object? feeds = null,
    Object? filterTags = null,
    Object? id = null,
    Object? interestTags = null,
    Object? latestReactions = null,
    Object? location = freezed,
    Object? mentionedUsers = null,
    Object? moderation = freezed,
    Object? notificationContext = freezed,
    Object? ownBookmarks = null,
    Object? ownReactions = null,
    Object? parent = freezed,
    Object? poll = freezed,
    Object? popularity = null,
    Object? reactionCount = null,
    Object? reactionGroups = null,
    Object? score = null,
    Object? searchData = null,
    Object? shareCount = null,
    Object? text = freezed,
    Object? type = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? visibility = null,
    Object? visibilityTag = freezed,
    Object? custom = freezed,
  }) {
    return _then(ActivityData(
      attachments: null == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      bookmarkCount: null == bookmarkCount
          ? _self.bookmarkCount
          : bookmarkCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _self.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentData>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentFeed: freezed == currentFeed
          ? _self.currentFeed
          : currentFeed // ignore: cast_nullable_to_non_nullable
              as FeedData?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editedAt: freezed == editedAt
          ? _self.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feeds: null == feeds
          ? _self.feeds
          : feeds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTags: null == filterTags
          ? _self.filterTags
          : filterTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      interestTags: null == interestTags
          ? _self.interestTags
          : interestTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latestReactions: null == latestReactions
          ? _self.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionData>,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation?,
      mentionedUsers: null == mentionedUsers
          ? _self.mentionedUsers
          : mentionedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      moderation: freezed == moderation
          ? _self.moderation
          : moderation // ignore: cast_nullable_to_non_nullable
              as Moderation?,
      notificationContext: freezed == notificationContext
          ? _self.notificationContext
          : notificationContext // ignore: cast_nullable_to_non_nullable
              as NotificationContext?,
      ownBookmarks: null == ownBookmarks
          ? _self.ownBookmarks
          : ownBookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkData>,
      ownReactions: null == ownReactions
          ? _self.ownReactions
          : ownReactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionData>,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as ActivityData?,
      poll: freezed == poll
          ? _self.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollData?,
      popularity: null == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      reactionCount: null == reactionCount
          ? _self.reactionCount
          : reactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionGroups: null == reactionGroups
          ? _self.reactionGroups
          : reactionGroups // ignore: cast_nullable_to_non_nullable
              as Map<String, ReactionGroupData>,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      searchData: null == searchData
          ? _self.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      shareCount: null == shareCount
          ? _self.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ActivityDataVisibility,
      visibilityTag: freezed == visibilityTag
          ? _self.visibilityTag
          : visibilityTag // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

// dart format on
