import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/threaded_comment_data.dart';
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
  }) : super(initialState);

  final String currentUserId;

  CommentsSort? _sort;
  CommentsSort get commentSort => _sort ?? CommentsSort.last;

  /// Handles the result of a query for replies to a comment.
  void onQueryMoreReplies(
    PaginationResult<ThreadedCommentData> result,
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

  /// Handles the addition of a new comment reply.
  void onCommentAdded(ThreadedCommentData comment) {
    final parentId = comment.parentId;
    // If there's no parentId, it's not a reply; ignore it
    if (parentId == null) return;

    final updatedReplies = state.replies.updateNested(
      (reply) => reply.id == parentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.addReply(comment, commentSort.compare),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the removal of a comment reply.
  void onCommentRemoved(String commentId) {
    final updatedReplies = state.replies.removeNested(
      (reply) => reply.id == commentId,
      children: (it) => it.replies ?? [],
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the update of an existing comment reply.
  void onCommentUpdated(CommentData comment) {
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == comment.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.setCommentData(comment),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the addition of a reaction to a comment reply.
  void onCommentReactionAdded(String commentId, FeedsReactionData reaction) {
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == commentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.addReaction(reaction, currentUserId),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(replies: updatedReplies);
  }

  /// Handles the removal of a reaction from a comment reply.
  void onCommentReactionRemoved(String commentId, FeedsReactionData reaction) {
    final updatedReplies = state.replies.updateNested(
      (it) => it.id == commentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReaction(reaction, currentUserId),
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
  final List<ThreadedCommentData> replies;

  /// Last pagination information.
  ///
  /// Contains the next and previous cursors for pagination, allowing for
  /// efficient navigation through the complete reply collection.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more replies available to load.
  bool get canLoadMore => pagination?.next != null;
}
