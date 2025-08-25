import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/threaded_comment_data.dart';
import '../state/query/activity_comments_query.dart';
import '../state/query/comment_reactions_query.dart';
import '../state/query/comment_replies_query.dart';
import '../state/query/comments_query.dart';

/// Repository for managing comments and comment-related operations.
///
/// Provides methods for creating, querying, updating comments and managing
/// threaded discussions with Reddit-style sorting.
///
/// All methods return [Result] objects for explicit error handling.
class CommentsRepository {
  /// Creates a new [CommentsRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const CommentsRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Queries comments.
  ///
  /// Searches for comments using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [CommentData] or an error.
  Future<Result<PaginationResult<CommentData>>> queryComments(
    CommentsQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryComments(
      queryCommentsRequest: request,
    );

    return result.map((response) {
      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }

  /// Retrieves comments for a specific activity.
  ///
  /// Fetches threaded comments for an activity using the specified [query] parameters.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ThreadedCommentData] or an error.
  Future<Result<PaginationResult<ThreadedCommentData>>> getComments(
    ActivityCommentsQuery query,
  ) async {
    final result = await _api.getComments(
      objectId: query.objectId,
      objectType: query.objectType,
      depth: query.depth,
      sort: query.sort,
      limit: query.limit,
      next: query.next,
      prev: query.previous,
    );

    return result.map((response) {
      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }

  /// Adds a new comment.
  ///
  /// Creates a new comment using the provided [request] data.
  ///
  /// Returns a [Result] containing the newly created [CommentData] or an error.
  Future<Result<CommentData>> addComment(api.AddCommentRequest request) async {
    final result = await _api.addComment(
      addCommentRequest: request,
    );

    return result.map((response) => response.comment.toModel());
  }

  /// Adds multiple comments.
  ///
  /// Creates multiple comments in a single batch operation using the provided [request] data.
  ///
  /// Returns a [Result] containing a list of [CommentData] or an error.
  Future<Result<List<CommentData>>> addCommentsBatch(
    api.AddCommentsBatchRequest request,
  ) async {
    final result = await _api.addCommentsBatch(
      addCommentsBatchRequest: request,
    );

    return result.map(
      (response) => response.comments.map((c) => c.toModel()).toList(),
    );
  }

  /// Deletes a comment.
  ///
  /// Removes the comment with the specified [commentId] from the system.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteComment(String commentId) {
    return _api.deleteComment(id: commentId);
  }

  /// Retrieves a specific comment.
  ///
  /// Fetches the comment with the specified [commentId] from the server.
  ///
  /// Returns a [Result] containing the [CommentData] or an error.
  Future<Result<CommentData>> getComment(String commentId) async {
    final result = await _api.getComment(id: commentId);

    return result.map((response) => response.comment.toModel());
  }

  /// Updates an existing comment.
  ///
  /// Modifies the comment with [commentId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the updated [CommentData] or an error.
  Future<Result<CommentData>> updateComment(
    String commentId,
    api.UpdateCommentRequest request,
  ) async {
    final result = await _api.updateComment(
      id: commentId,
      updateCommentRequest: request,
    );

    return result.map((response) => response.comment.toModel());
  }

  /// Adds a reaction to a comment.
  ///
  /// Creates a new reaction on the comment with [commentId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the [FeedsReactionData] or an error.
  Future<Result<({FeedsReactionData reaction, String commentId})>>
      addCommentReaction(
    String commentId,
    api.AddCommentReactionRequest request,
  ) async {
    final result = await _api.addCommentReaction(
      id: commentId,
      addCommentReactionRequest: request,
    );

    return result.map(
      (response) => (
        reaction: response.reaction.toModel(),
        commentId: response.comment.id,
      ),
    );
  }

  /// Deletes a reaction from a comment.
  ///
  /// Removes the reaction of [type] from the comment with [commentId].
  ///
  /// Returns a [Result] containing the deleted [FeedsReactionData] or an error.
  Future<Result<({FeedsReactionData reaction, String commentId})>>
      deleteCommentReaction(
    String commentId,
    String type,
  ) async {
    final result = await _api.deleteCommentReaction(id: commentId, type: type);

    return result.map(
      (response) => (
        reaction: response.reaction.toModel(),
        commentId: response.comment.id,
      ),
    );
  }

  /// Queries reactions for a specific comment.
  ///
  /// Retrieves reactions for the comment with [commentId] using the specified [query] filters.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedsReactionData] or an error.
  Future<Result<PaginationResult<FeedsReactionData>>> queryCommentReactions(
    String commentId,
    CommentReactionsQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryCommentReactions(
      id: commentId,
      queryCommentReactionsRequest: request,
    );

    return result.map((response) {
      final reactions = response.reactions.map((r) => r.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: reactions, pagination: pagination);
    });
  }

  /// Retrieves replies for a specific comment.
  ///
  /// Fetches threaded replies for a comment using the specified [query] parameters.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ThreadedCommentData] or an error.
  Future<Result<PaginationResult<ThreadedCommentData>>> getCommentReplies(
    CommentRepliesQuery query,
  ) async {
    final result = await _api.getCommentReplies(
      id: query.commentId,
      depth: query.depth,
      limit: query.limit,
      next: query.next,
      prev: query.previous,
      repliesLimit: query.repliesLimit,
      sort: query.sort,
    );

    return result.map((response) {
      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }
}
