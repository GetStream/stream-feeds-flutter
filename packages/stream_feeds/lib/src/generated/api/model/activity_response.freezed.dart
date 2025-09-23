// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityResponse {
  List<Attachment> get attachments;
  int get bookmarkCount;
  int get commentCount;
  List<CommentResponse> get comments;
  DateTime get createdAt;
  FeedResponse? get currentFeed;
  Map<String, Object?> get custom;
  DateTime? get deletedAt;
  DateTime? get editedAt;
  DateTime? get expiresAt;
  List<String> get feeds;
  List<String> get filterTags;
  bool? get hidden;
  String get id;
  List<String> get interestTags;
  List<FeedsReactionResponse> get latestReactions;
  ActivityLocation? get location;
  List<UserResponse> get mentionedUsers;
  ModerationV2Response? get moderation;
  NotificationContext? get notificationContext;
  List<BookmarkResponse> get ownBookmarks;
  List<FeedsReactionResponse> get ownReactions;
  ActivityResponse? get parent;
  PollResponseData? get poll;
  int get popularity;
  int get reactionCount;
  Map<String, ReactionGroupResponse> get reactionGroups;
  double get score;
  Map<String, Object?> get searchData;
  int get shareCount;
  String? get text;
  String get type;
  DateTime get updatedAt;
  UserResponse get user;
  ActivityResponseVisibility get visibility;
  String? get visibilityTag;

  /// Create a copy of ActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityResponseCopyWith<ActivityResponse> get copyWith =>
      _$ActivityResponseCopyWithImpl<ActivityResponse>(
          this as ActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityResponse &&
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
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other.feeds, feeds) &&
            const DeepCollectionEquality()
                .equals(other.filterTags, filterTags) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
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
                other.visibilityTag == visibilityTag));
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
        const DeepCollectionEquality().hash(custom),
        deletedAt,
        editedAt,
        expiresAt,
        const DeepCollectionEquality().hash(feeds),
        const DeepCollectionEquality().hash(filterTags),
        hidden,
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
        visibilityTag
      ]);

  @override
  String toString() {
    return 'ActivityResponse(attachments: $attachments, bookmarkCount: $bookmarkCount, commentCount: $commentCount, comments: $comments, createdAt: $createdAt, currentFeed: $currentFeed, custom: $custom, deletedAt: $deletedAt, editedAt: $editedAt, expiresAt: $expiresAt, feeds: $feeds, filterTags: $filterTags, hidden: $hidden, id: $id, interestTags: $interestTags, latestReactions: $latestReactions, location: $location, mentionedUsers: $mentionedUsers, moderation: $moderation, notificationContext: $notificationContext, ownBookmarks: $ownBookmarks, ownReactions: $ownReactions, parent: $parent, poll: $poll, popularity: $popularity, reactionCount: $reactionCount, reactionGroups: $reactionGroups, score: $score, searchData: $searchData, shareCount: $shareCount, text: $text, type: $type, updatedAt: $updatedAt, user: $user, visibility: $visibility, visibilityTag: $visibilityTag)';
  }
}

/// @nodoc
abstract mixin class $ActivityResponseCopyWith<$Res> {
  factory $ActivityResponseCopyWith(
          ActivityResponse value, $Res Function(ActivityResponse) _then) =
      _$ActivityResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<Attachment> attachments,
      int bookmarkCount,
      int commentCount,
      List<CommentResponse> comments,
      DateTime createdAt,
      FeedResponse? currentFeed,
      Map<String, Object?> custom,
      DateTime? deletedAt,
      DateTime? editedAt,
      DateTime? expiresAt,
      List<String> feeds,
      List<String> filterTags,
      bool? hidden,
      String id,
      List<String> interestTags,
      List<FeedsReactionResponse> latestReactions,
      ActivityLocation? location,
      List<UserResponse> mentionedUsers,
      ModerationV2Response? moderation,
      NotificationContext? notificationContext,
      List<BookmarkResponse> ownBookmarks,
      List<FeedsReactionResponse> ownReactions,
      ActivityResponse? parent,
      PollResponseData? poll,
      int popularity,
      int reactionCount,
      Map<String, ReactionGroupResponse> reactionGroups,
      double score,
      Map<String, Object?> searchData,
      int shareCount,
      String? text,
      String type,
      DateTime updatedAt,
      UserResponse user,
      ActivityResponseVisibility visibility,
      String? visibilityTag});
}

/// @nodoc
class _$ActivityResponseCopyWithImpl<$Res>
    implements $ActivityResponseCopyWith<$Res> {
  _$ActivityResponseCopyWithImpl(this._self, this._then);

  final ActivityResponse _self;
  final $Res Function(ActivityResponse) _then;

  /// Create a copy of ActivityResponse
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
    Object? custom = null,
    Object? deletedAt = freezed,
    Object? editedAt = freezed,
    Object? expiresAt = freezed,
    Object? feeds = null,
    Object? filterTags = null,
    Object? hidden = freezed,
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
  }) {
    return _then(ActivityResponse(
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
              as List<CommentResponse>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentFeed: freezed == currentFeed
          ? _self.currentFeed
          : currentFeed // ignore: cast_nullable_to_non_nullable
              as FeedResponse?,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
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
      hidden: freezed == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<FeedsReactionResponse>,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation?,
      mentionedUsers: null == mentionedUsers
          ? _self.mentionedUsers
          : mentionedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserResponse>,
      moderation: freezed == moderation
          ? _self.moderation
          : moderation // ignore: cast_nullable_to_non_nullable
              as ModerationV2Response?,
      notificationContext: freezed == notificationContext
          ? _self.notificationContext
          : notificationContext // ignore: cast_nullable_to_non_nullable
              as NotificationContext?,
      ownBookmarks: null == ownBookmarks
          ? _self.ownBookmarks
          : ownBookmarks // ignore: cast_nullable_to_non_nullable
              as List<BookmarkResponse>,
      ownReactions: null == ownReactions
          ? _self.ownReactions
          : ownReactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionResponse>,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as ActivityResponse?,
      poll: freezed == poll
          ? _self.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollResponseData?,
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
              as Map<String, ReactionGroupResponse>,
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
              as UserResponse,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as ActivityResponseVisibility,
      visibilityTag: freezed == visibilityTag
          ? _self.visibilityTag
          : visibilityTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
