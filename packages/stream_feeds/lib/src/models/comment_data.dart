// ignore_for_file: avoid_redundant_argument_values

import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import '../state/query/comments_query.dart';
import 'feeds_reaction_data.dart';
import 'moderation.dart';
import 'reaction_group_data.dart';
import 'user_data.dart';

part 'comment_data.freezed.dart';

/// A comment in the Stream Feeds system.
///
/// Rich content attached to activities that supports threaded discussions with
/// nested replies, social interactions like reactions and mentions, and
/// Reddit-style sorting algorithms for intelligent content ranking.
@freezed
class CommentData with _$CommentData implements CommentsSortDataFields {
  /// Creates a new [CommentData] instance.
  const CommentData({
    required this.confidenceScore,
    required this.createdAt,
    required this.downvoteCount,
    required this.id,
    required this.latestReactions,
    required this.mentionedUsers,
    required this.objectId,
    required this.objectType,
    required this.ownReactions,
    required this.reactionCount,
    required this.reactionGroups,
    required this.replyCount,
    required this.score,
    required this.status,
    required this.updatedAt,
    required this.upvoteCount,
    required this.user,
    this.attachments,
    this.bookmarkCount = 0,
    this.controversyScore,
    this.deletedAt,
    this.editedAt,
    this.meta,
    this.moderation,
    this.parentId,
    this.replies,
    this.text,
    this.custom,
  });

  /// File attachments associated with the comment.
  @override
  final List<Attachment>? attachments;

  /// The number of bookmarks this comment has received.
  @override
  final int bookmarkCount;

  /// A confidence score indicating the quality or relevance of the comment.
  @override
  final double confidenceScore;

  /// A controversy score indicating the potential controversy level of the comment.
  @override
  final double? controversyScore;

  /// The date and time when the comment was created.
  @override
  final DateTime createdAt;

  /// The date and time when the comment was deleted, if applicable.
  @override
  final DateTime? deletedAt;

  /// The date and time when the comment was last edited, if applicable.
  @override
  final DateTime? editedAt;

  /// The number of downvotes received by the comment.
  @override
  final int downvoteCount;

  /// The unique identifier of the comment.
  @override
  final String id;

  /// The most recent reactions added to the comment.
  @override
  final List<FeedsReactionData> latestReactions;

  /// Users mentioned in the comment.
  @override
  final List<UserData> mentionedUsers;

  /// Metadata about the comment's replies structure.
  @override
  final RepliesMeta? meta;

  /// Moderation state for the comment.
  @override
  final Moderation? moderation;

  /// The ID of the object this comment belongs to.
  @override
  final String objectId;

  /// The type of object this comment belongs to.
  @override
  final String objectType;

  /// All the reactions from the current user.
  @override
  final List<FeedsReactionData> ownReactions;

  /// The ID of the parent comment, if this is a reply.
  @override
  final String? parentId;

  /// The total number of reactions on the comment.
  @override
  final int reactionCount;

  /// Groups of reactions by type.
  @override
  final Map<String, ReactionGroupData> reactionGroups;

  /// The replies to this comment, if any.
  @override
  final List<CommentData>? replies;

  /// The number of replies to this comment.
  @override
  final int replyCount;

  /// A score assigned to the comment.
  @override
  final int score;

  /// The current status of the comment.
  @override
  final CommentStatus status;

  /// The text content of the comment.
  @override
  final String? text;

  /// The date and time when the comment was last updated.
  @override
  final DateTime updatedAt;

  /// The number of upvotes received by the comment.
  @override
  final int upvoteCount;

  /// The user who created the comment.
  @override
  final UserData user;

  /// Custom data associated with the comment.
  @override
  final Map<String, Object?>? custom;

  /// Indicates whether this comment has threaded replies.
  /// Returns true if replies are loaded (not null).
  bool get isThreaded => replies != null;
}

/// Extension functions for [CommentData] to handle common operations.
extension CommentDataMutations on CommentData {
  /// Updates this comment with new data while preserving own reactions.
  ///
  /// Merges [updated] comment data with this instance, preserving [ownReactions] from
  /// this instance when not provided. For threaded comments, also preserves meta and
  /// replies data. This ensures that user-specific data is not lost when updating
  /// from WebSocket events.
  ///
  /// Returns a new [CommentData] instance with the merged data.
  CommentData updateWith(
    CommentData updated, {
    List<FeedsReactionData>? ownReactions,
  }) {
    // If the comment is threaded, only preserve own reactions.
    if (updated.isThreaded) {
      return updated.copyWith(
        // Preserve own reactions from the current instance if not provided
        // as they may not be reliable from WS events.
        ownReactions: ownReactions ?? this.ownReactions,
      );
    }

    // For non-threaded comments, preserve meta and replies as well.
    return updated.copyWith(
      meta: meta,
      replies: replies,
      // Preserve own reactions from the current instance if not provided
      // as they may not be reliable from WS events.
      ownReactions: ownReactions ?? this.ownReactions,
    );
  }

  /// Adds or updates a reply in this comment.
  ///
  /// Updates the replies list by adding or updating [reply]. If the reply already exists,
  /// it will be updated. The reply count is automatically recalculated.
  ///
  /// Returns a new [CommentData] instance with the updated replies and reply count.
  CommentData upsertReply(
    CommentData reply,
    Comparator<CommentData> compare,
  ) {
    final currentReplies = [...?replies];
    final updatedReplies = currentReplies.sortedUpsert(
      reply,
      key: (it) => it.id,
      compare: compare,
      update: (existing, updated) => existing.updateWith(updated),
    );

    final difference = updatedReplies.length - currentReplies.length;
    final updatedReplyCount = math.max(0, replyCount + difference);

    return copyWith(
      replies: updatedReplies,
      replyCount: updatedReplyCount,
    );
  }

  /// Removes a reply from this comment.
  ///
  /// Updates the replies list by removing [reply]. The reply count is automatically
  /// recalculated.
  ///
  /// Returns a new [CommentData] instance with the updated replies and reply count.
  CommentData removeReply(CommentData reply) {
    final currentReplies = [...?replies];
    final updatedReplies = [...currentReplies.where((it) => it.id != reply.id)];

    final difference = updatedReplies.length - currentReplies.length;
    final updatedReplyCount = math.max(0, replyCount + difference);

    return copyWith(
      replies: updatedReplies,
      replyCount: updatedReplyCount,
    );
  }

  /// Adds or updates a reaction in this comment with unique enforcement.
  ///
  /// Updates the own reactions list by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When unique enforcement is enabled, replaces any
  /// existing reaction from the same user.
  ///
  /// Returns a new [CommentData] instance with the updated own reactions.
  CommentData upsertUniqueReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    return upsertReaction(
      updatedComment,
      reaction,
      currentUserId,
      enforceUnique: true,
    );
  }

  /// Adds or updates a reaction in this comment.
  ///
  /// Updates the own reactions list by adding or updating [reaction]. Only adds reactions
  /// that belong to [currentUserId]. When [enforceUnique] is true, replaces any existing
  /// reaction from the same user; otherwise, allows multiple reactions from the same user.
  ///
  /// Returns a new [CommentData] instance with the updated own reactions.
  CommentData upsertReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId, {
    bool enforceUnique = false,
  }) {
    final updatedOwnReactions = ownReactions.let((it) {
      if (reaction.user.id != currentUserId) return it;
      return it.upsertReaction(reaction, enforceUnique: enforceUnique);
    });

    return updateWith(updatedComment, ownReactions: updatedOwnReactions);
  }

  /// Removes a reaction from this comment.
  ///
  /// Updates the own reactions list by removing [reaction]. Only removes reactions
  /// that belong to [currentUserId].
  ///
  /// Returns a new [CommentData] instance with the updated own reactions.
  CommentData removeReaction(
    CommentData updatedComment,
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = ownReactions.let((it) {
      if (reaction.user.id != currentUserId) return it;
      return it.where((it) => it.id != reaction.id).toList();
    });

    return updateWith(updatedComment, ownReactions: updatedOwnReactions);
  }
}

/// Extension type representing the status of a comment.
///
/// This collapses the per-message-shape status types the API generator emits
/// ([CommentResponseStatus], [ThreadedCommentResponseStatus]) into one domain
/// name, so the public API doesn't move when the generator reshapes them.
///
/// By implementing String, it seamlessly supports both known and unknown
/// status values.
extension type const CommentStatus(String value) implements String {
  /// The comment is visible.
  static const active = CommentStatus('active');

  /// The comment was deleted.
  static const deleted = CommentStatus('deleted');

  /// The comment was hidden by moderation.
  static const hidden = CommentStatus('hidden');

  /// The comment was removed by moderation.
  static const removed = CommentStatus('removed');

  /// The comment is visible to its author only, having been shadow blocked.
  static const shadowBlocked = CommentStatus('shadow_blocked');
}

/// Extension function to convert a [CommentResponse] to a [CommentData] model.
extension CommentResponseMapper on CommentResponse {
  /// Converts this API comment response to a domain [CommentData] instance.
  ///
  /// Returns a [CommentData] instance containing all the comment information
  /// from the API response with proper type conversions and null handling.
  CommentData toModel() {
    return CommentData(
      attachments: attachments,
      bookmarkCount: bookmarkCount,
      confidenceScore: confidenceScore,
      controversyScore: controversyScore,
      createdAt: createdAt,
      custom: custom,
      deletedAt: deletedAt,
      editedAt: editedAt,
      downvoteCount: downvoteCount,
      id: id,
      latestReactions: [...?latestReactions?.map((e) => e.toModel())],
      mentionedUsers: [...mentionedUsers.map((e) => e.toModel())],
      meta: null, // Comments don't have meta loaded by default
      moderation: moderation?.toModel(),
      objectId: objectId,
      objectType: objectType,
      ownReactions: [...ownReactions.map((e) => e.toModel())],
      parentId: parentId,
      reactionCount: reactionCount,
      reactionGroups: {
        for (final entry in {...?reactionGroups?.entries}) entry.key: entry.value.toModel(),
      },
      replies: null, // Comments don't have replies loaded by default
      replyCount: replyCount,
      score: score,
      status: CommentStatus(status),
      text: text,
      updatedAt: updatedAt,
      upvoteCount: upvoteCount,
      user: user.toModel(),
    );
  }
}

extension ThreadedCommentResponseMapper on ThreadedCommentResponse {
  /// Converts this API comment response to a domain [CommentData] instance.
  ///
  /// Returns a [CommentData] instance containing all the comment information
  /// from the API response with proper type conversions and null handling.
  CommentData toModel() {
    return CommentData(
      attachments: attachments,
      bookmarkCount: bookmarkCount,
      confidenceScore: confidenceScore,
      controversyScore: controversyScore,
      createdAt: createdAt,
      custom: custom,
      deletedAt: deletedAt,
      editedAt: editedAt,
      downvoteCount: downvoteCount,
      id: id,
      latestReactions: [...?latestReactions?.map((e) => e.toModel())],
      mentionedUsers: [...mentionedUsers.map((e) => e.toModel())],
      meta: meta,
      moderation: moderation?.toModel(),
      objectId: objectId,
      objectType: objectType,
      ownReactions: [...ownReactions.map((e) => e.toModel())],
      parentId: parentId,
      reactionCount: reactionCount,
      reactionGroups: {
        for (final entry in {...?reactionGroups?.entries}) entry.key: entry.value.toModel(),
      },
      replies: replies?.map((e) => e.toModel()).toList(),
      replyCount: replyCount,
      score: score,
      status: CommentStatus(status),
      text: text,
      updatedAt: updatedAt,
      upvoteCount: upvoteCount,
      user: user.toModel(),
    );
  }
}
