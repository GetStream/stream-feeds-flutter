import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import 'query/comments_query.dart';

part 'comment_reply_list_state.freezed.dart';

/// Manages the state of a comment reply list and handles state updates.
///
/// Provides methods to update the comment reply list state in response to data changes
/// and real-time events from the Stream Feeds API.
class CommentReplyListStateNotifier
    extends StateNotifier<CommentReplyListState> {
  CommentReplyListStateNotifier({
    required CommentReplyListState initialState,
    required this.currentUserId,
    required this.parentCommentId,
  }) : super(initialState);

  final String currentUserId;
  final String parentCommentId;

  CommentsSort? _sort;
  CommentsSort get commentSort => _sort ?? CommentsSort.last;

  /// Handles the result of a query for replies to a comment.
  void onQueryMoreReplies(
    PaginationResult<CommentData> result,
    CommentsSort? sort,
  ) {
    _sort = sort;

    // Merge the new replies with the existing ones (keeping the sort order)
    final updatedReplies = state.replies.merge(
      result.items,
      key: (it) => it.id,
      compare: commentSort.compare,
    );

    state = state.copyWith(
      replies: updatedReplies,
      pagination: result.pagination,
    );
  }

  /// Handles the deletion of the parent comment.
  void onParentCommentDeleted() {
    state = state.copyWith(
      replies: [], // Clear all replies when the parent comment is deleted
      pagination: null,
    );
  }

  /// Handles the addition of a new comment reply.
  void onReplyAdded(CommentData reply) {
    final parentId = reply.parentId;
    // If there's no parentId, it's not a reply; ignore it
    if (parentId == null) return;

    // If this is a top-level reply to the parent comment, add it directly
    if (parentId == parentCommentId) {
      final updatedReplies = state.replies.sortedUpsert(
        reply,
        key: (it) => it.id,
        compare: commentSort.compare,
        update: (existing, updated) => existing.updateWith(updated),
      );

      state = state.copyWith(replies: updatedReplies);
      return;
    }

    // Otherwise, it's a nested reply - find the parent reply and add it
    final updatedReplies = state.replies.updateNested(
      (reply) => reply.id == parentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.upsertReply(reply, commentSort.compare),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the update of an existing comment reply.
  void onReplyUpdated(CommentData reply) {
    // Update nested replies (handles both top-level and nested replies)
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == reply.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.updateWith(reply),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the removal of a comment reply.
  void onReplyRemoved(CommentData reply) {
    final removeIndex = state.replies.indexWhere((it) => it.id == reply.id);

    // If found at the top level, remove it directly
    if (removeIndex >= 0) {
      final updatedReplies = [...state.replies].apply(
        (it) => it.removeAt(removeIndex),
      );

      state = state.copyWith(replies: updatedReplies);
      return;
    }

    // Otherwise, it's a nested reply - find the parent reply and remove it
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == reply.parentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReply(reply),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the addition or update of a reaction to a comment reply.
  void onReplyReactionUpserted(
    CommentData reply,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    // Update nested replies (handles both top-level and nested replies)
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == reply.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.upsertReaction(
        reply,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the removal of a reaction from a comment reply.
  void onReplyReactionRemoved(
    CommentData reply,
    FeedsReactionData reaction,
  ) {
    // Update nested replies (handles both top-level and nested replies)
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == reply.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReaction(reply, reaction, currentUserId),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }
}

/// An observable state object that manages the current state of a comment reply list.
///
/// Maintains the current list of replies and pagination information for
/// efficient loading and navigation through reply collections.
@freezed
class CommentReplyListState with _$CommentReplyListState {
  const CommentReplyListState({
    this.replies = const [],
    this.pagination,
  });

  /// All the paginated replies currently loaded.
  ///
  /// This list contains all replies that have been fetched across multiple
  /// pagination requests. The replies are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<CommentData> replies;

  /// Last pagination information.
  ///
  /// Contains the next and previous cursors for pagination, allowing for
  /// efficient navigation through the complete reply collection.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more replies available to load.
  bool get canLoadMore => pagination?.next != null;
}
