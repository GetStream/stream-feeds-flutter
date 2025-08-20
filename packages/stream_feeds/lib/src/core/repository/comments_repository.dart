import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
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
/// threaded discussions with Reddit-style sorting. All methods return [Result] objects
/// for explicit error handling.
class CommentsRepository {
  /// Creates a new [CommentsRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const CommentsRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Queries comments based on the provided [CommentsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [CommentData] or an error.
  Future<Result<PaginationResult<CommentData>>> queryComments(
    CommentsQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryComments(
        queryCommentsRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryComments');
      }

      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }

  /// Retrieves comments for a specific activity based on the provided [ActivityCommentsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ThreadedCommentData] or an error.
  Future<Result<PaginationResult<ThreadedCommentData>>> getComments(
    ActivityCommentsQuery query,
  ) {
    return runSafely(() async {
      final response = await _apiClient.getComments(
        objectId: query.objectId,
        objectType: query.objectType,
        depth: query.depth,
        sort: query.sort,
        limit: query.limit,
        next: query.next,
        prev: query.previous,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from getComments');
      }

      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }

  /// Adds a new comment based on the provided [AddCommentRequest].
  ///
  /// Returns a [Result] containing the newly created [CommentData] or an error.
  Future<Result<CommentData>> addComment(api.AddCommentRequest request) {
    return runSafely(() async {
      final response = await _apiClient.addComment(
        addCommentRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from addComment');
      }

      return response.comment.toModel();
    });
  }

  /// Adds multiple comments based on the provided [AddCommentsBatchRequest].
  ///
  /// Returns a [Result] containing a list of [CommentData] or an error.
  Future<Result<List<CommentData>>> addCommentsBatch(
    api.AddCommentsBatchRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.addCommentsBatch(
        addCommentsBatchRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from addCommentsBatch');
      }

      return response.comments.map((c) => c.toModel()).toList();
    });
  }

  /// Deletes a comment by ID.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteComment(String commentId) {
    return runSafely(() async {
      await _apiClient.deleteComment(commentId: commentId);
    });
  }

  /// Retrieves a specific comment by ID.
  ///
  /// Returns a [Result] containing the [CommentData] or an error.
  Future<Result<CommentData>> getComment(String commentId) {
    return runSafely(() async {
      final response = await _apiClient.getComment(commentId: commentId);

      if (response == null) {
        throw ClientException(message: 'No result data from getComment');
      }

      return response.comment.toModel();
    });
  }

  /// Updates an existing comment based on the provided [UpdateCommentRequest].
  ///
  /// Returns a [Result] containing the updated [CommentData] or an error.
  Future<Result<CommentData>> updateComment(
    String commentId,
    api.UpdateCommentRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updateComment(
        commentId: commentId,
        updateCommentRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updateComment');
      }

      return response.comment.toModel();
    });
  }

  /// Adds a reaction to a comment based on the provided [AddReactionRequest].
  ///
  /// Returns a [Result] containing the [FeedsReactionData] or an error.
  Future<Result<(FeedsReactionData, String)>> addCommentReaction(
    String commentId,
    api.AddCommentReactionRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.addCommentReaction(
        commentId: commentId,
        addCommentReactionRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from addCommentReaction',
        );
      }

      return (response.reaction.toModel(), response.comment.id);
    });
  }

  /// Deletes a reaction from a comment.
  ///
  /// Returns a [Result] containing the deleted [FeedsReactionData] or an error.
  Future<Result<(FeedsReactionData, String)>> deleteCommentReaction(
    String commentId,
    String type,
  ) {
    return runSafely(() async {
      final response = await _apiClient.deleteCommentReaction(
        commentId: commentId,
        type: type,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from deleteCommentReaction',
        );
      }

      return (response.reaction.toModel(), response.comment.id);
    });
  }

  /// Queries reactions for a specific comment based on the provided [CommentReactionsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedsReactionData] or an error.
  Future<Result<PaginationResult<FeedsReactionData>>> queryCommentReactions(
    String commentId,
    CommentReactionsQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryCommentReactions(
        commentId: commentId,
        queryCommentReactionsRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from queryCommentReactions',
        );
      }

      final reactions = response.reactions.map((r) => r.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: reactions, pagination: pagination);
    });
  }

  /// Retrieves replies for a specific comment based on the provided [CommentRepliesQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ThreadedCommentData] or an error.
  Future<Result<PaginationResult<ThreadedCommentData>>> getCommentReplies(
    CommentRepliesQuery query,
  ) {
    return runSafely(() async {
      final response = await _apiClient.getCommentReplies(
        commentId: query.commentId,
        depth: query.depth,
        limit: query.limit,
        next: query.next,
        prev: query.previous,
        repliesLimit: query.repliesLimit,
        sort: query.sort,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from getCommentReplies',
        );
      }

      final comments = response.comments.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: comments, pagination: pagination);
    });
  }
}
