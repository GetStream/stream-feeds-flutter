import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import 'query/comments_query.dart';

part 'activity_comment_list_state.freezed.dart';

/// Manages the state of an activity comment list and handles state updates.
///
/// Provides methods to update the activity comment list state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityCommentListStateNotifier
    extends StateNotifier<ActivityCommentListState> {
  ActivityCommentListStateNotifier({
    required this.currentUserId,
    required ActivityCommentListState initialState,
  }) : super(initialState);

  final String currentUserId;

  CommentsSort? _commentSort;
  CommentsSort get commentSort => _commentSort ?? CommentsSort.last;

  /// Handles the result of a query for more comments.
  void onQueryMoreComments(
    PaginationResult<CommentData> result, {
    CommentsSort? sort,
  }) {
    _commentSort = sort;

    // Merge the new comments with the existing ones (keeping the sort order)
    final updatedComments = state.comments.merge(
      result.items,
      key: (it) => it.id,
      compare: commentSort.compare,
    );

    state = state.copyWith(
      comments: updatedComments,
      pagination: result.pagination,
    );
  }

  /// Handles the deletion of the activity.
  void onActivityDeleted() {
    state = state.copyWith(
      comments: [], // Clear all comments when the activity is deleted
      pagination: null,
    );
  }

  /// Handles the addition of a new comment.
  void onCommentAdded(CommentData comment) {
    final parentId = comment.parentId;

    // If there's no parentId, it's a top-level comment
    if (parentId == null) {
      final updatedComments = state.comments.sortedUpsert(
        comment,
        key: (comment) => comment.id,
        compare: commentSort.compare,
        update: (existing, updated) => existing.updateWith(updated),
      );

      state = state.copyWith(comments: updatedComments);
      return;
    }

    // Otherwise, it's a reply to an existing comment
    final updatedComments = state.comments.updateNested(
      (it) => it.id == parentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.upsertReply(comment, commentSort.compare),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles updates to a specific comment.
  void onCommentUpdated(CommentData comment) {
    // Update nested replies (handles both top-level and nested replies)
    final updatedComments = state.comments.updateNested(
      (it) => it.id == comment.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.updateWith(comment),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
    );

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles the removal of a comment by ID.
  void onCommentRemoved(CommentData comment) {
    final removeIndex = state.comments.indexWhere((it) => it.id == comment.id);

    // If found at the top level, remove it directly
    if (removeIndex >= 0) {
      final updatedComments = [...state.comments].apply(
        (it) => it.removeAt(removeIndex),
      );

      state = state.copyWith(comments: updatedComments);
      return;
    }

    // Otherwise, it might be a direct reply to a top-level comment
    final updatedComments = state.comments.updateNested(
      (it) => it.id == comment.parentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReply(comment),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
    );

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles the upsertion of a reaction on a comment.
  void onCommentReactionUpserted(
    CommentData comment,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    final updatedComments = state.comments.updateNested(
      (it) => it.id == comment.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.upsertReaction(
        comment,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles the removal of a reaction from a comment.
  void onCommentReactionRemoved(
    CommentData comment,
    FeedsReactionData reaction,
  ) {
    final updatedComments = state.comments.updateNested(
      (it) => it.id == comment.id,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReaction(comment, reaction, currentUserId),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(comments: updatedComments);
  }
}

/// An observable state object that manages the current state of an activity comment list.
///
/// Maintains the current list of comments and pagination information for
/// efficient loading and navigation through activity comment collections.
@freezed
class ActivityCommentListState with _$ActivityCommentListState {
  const ActivityCommentListState({
    this.comments = const [],
    this.pagination,
  });

  /// All the paginated activity comments currently loaded.
  ///
  /// This list contains all comments that have been fetched across multiple
  /// pagination requests. The comments are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<CommentData> comments;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of activity comments.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more comments available to load.
  bool get canLoadMore => pagination?.next != null;
}
