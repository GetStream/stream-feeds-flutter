// ignore_for_file: avoid_redundant_argument_values

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
    this.controversyScore,
    this.deletedAt,
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
  final String status;

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

/// Extension function to convert a [CommentResponse] to a [CommentData] model.
extension CommentResponseMapper on CommentResponse {
  /// Converts this API comment response to a domain [CommentData] instance.
  ///
  /// Returns a [CommentData] instance containing all the comment information
  /// from the API response with proper type conversions and null handling.
  CommentData toModel() {
    return CommentData(
      attachments: attachments,
      confidenceScore: confidenceScore,
      controversyScore: controversyScore,
      createdAt: createdAt,
      custom: custom,
      deletedAt: deletedAt,
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
        for (final entry in {...?reactionGroups?.entries})
          entry.key: entry.value.toModel(),
      },
      replies: null, // Comments don't have replies loaded by default
      replyCount: replyCount,
      score: score,
      status: status,
      text: text,
      updatedAt: updatedAt,
      upvoteCount: upvoteCount,
      user: user.toModel(),
    );
  }
}

extension CommentDataMutations on CommentData {
  /// Adds a reaction to the comment, updating the latest reactions, reaction groups, reaction count,
  /// and own reactions if applicable.
  ///
  /// @param reaction The reaction to add.
  /// @param currentUserId The ID of the current user, used to update own reactions.
  /// @return A new [CommentData] instance with the updated reaction data.
  CommentData addReaction(
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = switch (reaction.user.id == currentUserId) {
      true => ownReactions.upsert(reaction, key: (it) => it.id),
      false => ownReactions,
    };

    final updatedLatestReactions = latestReactions.upsert(
      reaction,
      key: (reaction) => reaction.id,
    );

    final reactionGroup = switch (reactionGroups[reaction.type]) {
      final existingGroup? => existingGroup,
      _ => ReactionGroupData(
          count: 1,
          firstReactionAt: reaction.createdAt,
          lastReactionAt: reaction.createdAt,
        ),
    };

    final updatedReactionGroups = {
      ...reactionGroups,
      reaction.type: reactionGroup.increment(reaction.createdAt),
    };

    final updatedReactionCount = updatedReactionGroups.values.sumOf(
      (group) => group.count,
    );

    return copyWith(
      ownReactions: updatedOwnReactions,
      latestReactions: updatedLatestReactions,
      reactionGroups: updatedReactionGroups,
      reactionCount: updatedReactionCount,
    );
  }

  /// Removes a reaction from the comment, updating the latest reactions, reaction groups, reaction
  /// count, and own reactions if applicable.
  ///
  /// @param reaction The reaction to remove.
  /// @param currentUserId The ID of the current user, used to update own reactions.
  /// @return A new [CommentData] instance with the updated reaction data.
  CommentData removeReaction(
    FeedsReactionData reaction,
    String currentUserId,
  ) {
    final updatedOwnReactions = switch (reaction.user.id == currentUserId) {
      true => ownReactions.where((it) => it.id != reaction.id).toList(),
      false => ownReactions,
    };

    final updatedLatestReactions = latestReactions.where((it) {
      return it.id != reaction.id;
    }).toList(growable: false);

    final updatedReactionGroups = {...reactionGroups};
    final reactionGroup = updatedReactionGroups.remove(reaction.type);

    if (reactionGroup == null) {
      // If there is no reaction group for this type, just update latest and own reactions.
      // Note: This is only a hypothetical case, as we should always have a reaction group.
      return copyWith(
        latestReactions: updatedLatestReactions,
        ownReactions: updatedOwnReactions,
      );
    }

    final updatedReactionGroup = reactionGroup.decrement(reaction.createdAt);
    if (updatedReactionGroup.count > 0) {
      updatedReactionGroups[reaction.type] = updatedReactionGroup;
    }

    final updatedReactionCount = updatedReactionGroups.values.sumOf(
      (group) => group.count,
    );

    return copyWith(
      ownReactions: updatedOwnReactions,
      latestReactions: updatedLatestReactions,
      reactionGroups: updatedReactionGroups,
      reactionCount: updatedReactionCount,
    );
  }
}
