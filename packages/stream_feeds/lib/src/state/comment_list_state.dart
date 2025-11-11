import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import 'query/comments_query.dart';

part 'comment_list_state.freezed.dart';

/// Manages the state of a comment list and handles state updates.
///
/// Provides methods to update the comment list state in response to data changes
/// and real-time events from the Stream Feeds API.
class CommentListStateNotifier extends StateNotifier<CommentListState> {
  CommentListStateNotifier({
    required CommentListState initialState,
    required this.currentUserId,
  }) : super(initialState);

  final String currentUserId;
  ({Filter? filter, CommentsSort? sort})? _queryConfig;
  CommentsSort get commentSort => _queryConfig?.sort ?? CommentsSort.last;

  /// Handles the result of a query for more comments.
  void onQueryMoreComments(
    PaginationResult<CommentData> result, {
    Filter? filter,
    CommentsSort? sort,
  }) {
    _queryConfig = (filter: filter, sort: sort);

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

  /// Handles updates to a specific comment.
  void onCommentUpdated(CommentData comment) {
    final updatedComments = state.comments.map((it) {
      if (it.id != comment.id) return it;
      return comment;
    }).toList();

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles removal of a comment by ID.
  void onCommentRemoved(String commentId) {
    final updatedComments = state.comments.where((it) {
      return it.id != commentId;
    }).toList();

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles the addition of a reaction to a comment.
  void onCommentReactionAdded(String commentId, FeedsReactionData reaction) {
    final updatedComments = state.comments.updateNested(
      (comment) => comment.id == commentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.addReaction(reaction, currentUserId),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(comments: updatedComments);
  }

  /// Handles the removal of a reaction from a comment.
  void onCommentReactionRemoved(String commentId, FeedsReactionData reaction) {
    final updatedComments = state.comments.updateNested(
      (comment) => comment.id == commentId,
      children: (it) => it.replies ?? [],
      update: (found) => found.removeReaction(reaction, currentUserId),
      updateChildren: (parent, replies) => parent.copyWith(replies: replies),
      compare: commentSort.compare,
    );

    state = state.copyWith(comments: updatedComments);
  }
}

/// An observable state object that manages the current state of a comment list.
///
/// Maintains the current list of comments and pagination information for
/// efficient loading and navigation through comment collections.
@freezed
class CommentListState with _$CommentListState {
  const CommentListState({
    this.comments = const [],
    this.pagination,
  });

  /// All the paginated comments currently loaded.
  ///
  /// This list contains all comments that have been fetched across multiple
  /// pagination requests. The comments are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<CommentData> comments;

  /// Last pagination information.
  ///
  /// Contains the next and previous cursors for pagination, allowing for
  /// efficient navigation through the complete comment collection.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more comments available to load.
  bool get canLoadMore => pagination?.next != null;
}
