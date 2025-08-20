import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;
import '../state/query/comments_query.dart';
import 'comment_data.dart';
import 'feeds_reaction_data.dart';
import 'moderation.dart';
import 'reaction_group_data.dart';
import 'user_data.dart';

part 'threaded_comment_data.freezed.dart';

/// A threaded comment in the Stream Feeds system.
///
/// Contains comment content, metadata, reactions, nested replies, and user
/// information for threaded discussion functionality.
/// It supports hierarchical comment structures with pagination metadata.
@freezed
class ThreadedCommentData
    with _$ThreadedCommentData
    implements CommentsSortDataFields {
  /// Creates a new instance of [ThreadedCommentData].
  const ThreadedCommentData({
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

  /// Creates a new instance of [ThreadedCommentData] from a [CommentData] object.
  ///
  /// This constructor converts a regular comment to a threaded comment,
  /// preserving all the comment data while adding support for threaded replies.
  factory ThreadedCommentData.fromComment(CommentData comment) {
    return ThreadedCommentData(
      attachments: comment.attachments,
      confidenceScore: comment.confidenceScore,
      controversyScore: comment.controversyScore,
      createdAt: comment.createdAt,
      custom: comment.custom,
      deletedAt: comment.deletedAt,
      downvoteCount: comment.downvoteCount,
      id: comment.id,
      latestReactions: comment.latestReactions,
      mentionedUsers: comment.mentionedUsers,
      meta: null, // Comments don't have meta loaded by default
      moderation: comment.moderation,
      objectId: comment.objectId,
      objectType: comment.objectType,
      ownReactions: comment.ownReactions,
      parentId: comment.parentId,
      reactionCount: comment.reactionCount,
      reactionGroups: comment.reactionGroups,
      replies: null, // Comments don't have replies loaded by default
      replyCount: comment.replyCount,
      score: comment.score,
      status: comment.status,
      text: comment.text,
      updatedAt: comment.updatedAt,
      upvoteCount: comment.upvoteCount,
      user: comment.user,
    );
  }

  /// File attachments associated with the comment.
  @override
  final List<api.Attachment>? attachments;

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
  final api.RepliesMeta? meta;

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
  final List<ThreadedCommentData>? replies;

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
  final Map<String, Object>? custom;
}

/// Extension function to convert a [api.ThreadedCommentResponse] to a [ThreadedCommentData] model.
extension ThreadedCommentResponseMapper on api.ThreadedCommentResponse {
  /// Converts this API comment response to a domain [ThreadedCommentData] instance.
  ///
  /// This creates a threaded comment from a regular comment response,
  /// suitable for use in threaded comment displays.
  ThreadedCommentData toModel() {
    return ThreadedCommentData(
      attachments: attachments,
      confidenceScore: confidenceScore as double,
      controversyScore: controversyScore as double?,
      createdAt: createdAt,
      custom: custom,
      deletedAt: deletedAt,
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
        for (final entry in {...?reactionGroups?.entries})
          entry.key: entry.value.toModel(),
      },
      replies: [...?replies?.map((e) => e.toModel())],
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
