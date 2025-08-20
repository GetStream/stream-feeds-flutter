// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threaded_comment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThreadedCommentData {
  List<api.Attachment>? get attachments;
  double get confidenceScore;
  double? get controversyScore;
  DateTime get createdAt;
  DateTime? get deletedAt;
  int get downvoteCount;
  String get id;
  List<FeedsReactionData> get latestReactions;
  List<UserData> get mentionedUsers;
  api.RepliesMeta? get meta;
  Moderation? get moderation;
  String get objectId;
  String get objectType;
  List<FeedsReactionData> get ownReactions;
  String? get parentId;
  int get reactionCount;
  Map<String, ReactionGroupData> get reactionGroups;
  List<ThreadedCommentData>? get replies;
  int get replyCount;
  int get score;
  String get status;
  String? get text;
  DateTime get updatedAt;
  int get upvoteCount;
  UserData get user;
  Map<String, Object>? get custom;

  /// Create a copy of ThreadedCommentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThreadedCommentDataCopyWith<ThreadedCommentData> get copyWith =>
      _$ThreadedCommentDataCopyWithImpl<ThreadedCommentData>(
          this as ThreadedCommentData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThreadedCommentData &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.controversyScore, controversyScore) ||
                other.controversyScore == controversyScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.downvoteCount, downvoteCount) ||
                other.downvoteCount == downvoteCount) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions) &&
            const DeepCollectionEquality()
                .equals(other.mentionedUsers, mentionedUsers) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.moderation, moderation) ||
                other.moderation == moderation) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            const DeepCollectionEquality()
                .equals(other.ownReactions, ownReactions) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.reactionCount, reactionCount) ||
                other.reactionCount == reactionCount) &&
            const DeepCollectionEquality()
                .equals(other.reactionGroups, reactionGroups) &&
            const DeepCollectionEquality().equals(other.replies, replies) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.upvoteCount, upvoteCount) ||
                other.upvoteCount == upvoteCount) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other.custom, custom));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(attachments),
        confidenceScore,
        controversyScore,
        createdAt,
        deletedAt,
        downvoteCount,
        id,
        const DeepCollectionEquality().hash(latestReactions),
        const DeepCollectionEquality().hash(mentionedUsers),
        meta,
        moderation,
        objectId,
        objectType,
        const DeepCollectionEquality().hash(ownReactions),
        parentId,
        reactionCount,
        const DeepCollectionEquality().hash(reactionGroups),
        const DeepCollectionEquality().hash(replies),
        replyCount,
        score,
        status,
        text,
        updatedAt,
        upvoteCount,
        user,
        const DeepCollectionEquality().hash(custom)
      ]);

  @override
  String toString() {
    return 'ThreadedCommentData(attachments: $attachments, confidenceScore: $confidenceScore, controversyScore: $controversyScore, createdAt: $createdAt, deletedAt: $deletedAt, downvoteCount: $downvoteCount, id: $id, latestReactions: $latestReactions, mentionedUsers: $mentionedUsers, meta: $meta, moderation: $moderation, objectId: $objectId, objectType: $objectType, ownReactions: $ownReactions, parentId: $parentId, reactionCount: $reactionCount, reactionGroups: $reactionGroups, replies: $replies, replyCount: $replyCount, score: $score, status: $status, text: $text, updatedAt: $updatedAt, upvoteCount: $upvoteCount, user: $user, custom: $custom)';
  }
}

/// @nodoc
abstract mixin class $ThreadedCommentDataCopyWith<$Res> {
  factory $ThreadedCommentDataCopyWith(
          ThreadedCommentData value, $Res Function(ThreadedCommentData) _then) =
      _$ThreadedCommentDataCopyWithImpl;
  @useResult
  $Res call(
      {double confidenceScore,
      DateTime createdAt,
      int downvoteCount,
      String id,
      List<FeedsReactionData> latestReactions,
      List<UserData> mentionedUsers,
      String objectId,
      String objectType,
      List<FeedsReactionData> ownReactions,
      int reactionCount,
      Map<String, ReactionGroupData> reactionGroups,
      int replyCount,
      int score,
      String status,
      DateTime updatedAt,
      int upvoteCount,
      UserData user,
      List<Attachment>? attachments,
      double? controversyScore,
      DateTime? deletedAt,
      RepliesMeta? meta,
      Moderation? moderation,
      String? parentId,
      List<ThreadedCommentData>? replies,
      String? text,
      Map<String, Object>? custom});
}

/// @nodoc
class _$ThreadedCommentDataCopyWithImpl<$Res>
    implements $ThreadedCommentDataCopyWith<$Res> {
  _$ThreadedCommentDataCopyWithImpl(this._self, this._then);

  final ThreadedCommentData _self;
  final $Res Function(ThreadedCommentData) _then;

  /// Create a copy of ThreadedCommentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confidenceScore = null,
    Object? createdAt = null,
    Object? downvoteCount = null,
    Object? id = null,
    Object? latestReactions = null,
    Object? mentionedUsers = null,
    Object? objectId = null,
    Object? objectType = null,
    Object? ownReactions = null,
    Object? reactionCount = null,
    Object? reactionGroups = null,
    Object? replyCount = null,
    Object? score = null,
    Object? status = null,
    Object? updatedAt = null,
    Object? upvoteCount = null,
    Object? user = null,
    Object? attachments = freezed,
    Object? controversyScore = freezed,
    Object? deletedAt = freezed,
    Object? meta = freezed,
    Object? moderation = freezed,
    Object? parentId = freezed,
    Object? replies = freezed,
    Object? text = freezed,
    Object? custom = freezed,
  }) {
    return _then(ThreadedCommentData(
      confidenceScore: null == confidenceScore
          ? _self.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      downvoteCount: null == downvoteCount
          ? _self.downvoteCount
          : downvoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latestReactions: null == latestReactions
          ? _self.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionData>,
      mentionedUsers: null == mentionedUsers
          ? _self.mentionedUsers
          : mentionedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      objectId: null == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      objectType: null == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      ownReactions: null == ownReactions
          ? _self.ownReactions
          : ownReactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionData>,
      reactionCount: null == reactionCount
          ? _self.reactionCount
          : reactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionGroups: null == reactionGroups
          ? _self.reactionGroups
          : reactionGroups // ignore: cast_nullable_to_non_nullable
              as Map<String, ReactionGroupData>,
      replyCount: null == replyCount
          ? _self.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upvoteCount: null == upvoteCount
          ? _self.upvoteCount
          : upvoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      attachments: freezed == attachments
          ? _self.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
      controversyScore: freezed == controversyScore
          ? _self.controversyScore
          : controversyScore // ignore: cast_nullable_to_non_nullable
              as double?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as RepliesMeta?,
      moderation: freezed == moderation
          ? _self.moderation
          : moderation // ignore: cast_nullable_to_non_nullable
              as Moderation?,
      parentId: freezed == parentId
          ? _self.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      replies: freezed == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ThreadedCommentData>?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>?,
    ));
  }
}

// dart format on
