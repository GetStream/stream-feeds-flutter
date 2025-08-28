import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/threaded_comment_data.dart';
import '../repository/comments_repository.dart';
import 'comment_reply_list_state.dart';
import 'event/comment_reply_list_event_handler.dart';
import 'query/comment_replies_query.dart';

/// Represents a list of comment replies with a query and state.
///
/// The primary interface for working with comment replies in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of comment replies with pagination support.
///
/// Each comment reply list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The comment reply list state includes replies and
/// pagination information.
class CommentReplyList with Disposable {
  @internal
  CommentReplyList({
    required this.query,
    required this.currentUserId,
    required this.commentsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = CommentReplyListStateNotifier(
      initialState: const CommentReplyListState(),
      currentUserId: currentUserId,
    );

    // Attach event handlers for real-time updates
    final handler = CommentReplyListEventHandler(state: _stateNotifier);
    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final CommentRepliesQuery query;
  final String currentUserId;
  final CommentsRepository commentsRepository;

  late final CommentReplyListStateNotifier _stateNotifier;

  StateNotifier<CommentReplyListState> get state => _stateNotifier;
  Stream<CommentReplyListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of replies based on the provided query.
  ///
  /// Returns a [Result] containing a list of replies or an error.
  Future<Result<List<ThreadedCommentData>>> get() => _queryReplies(query);

  /// Loads more replies if available.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// replies to return.
  Future<Result<List<ThreadedCommentData>>> queryMoreReplies({
    int? limit,
  }) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.state.pagination?.next;

    // Early return if no more replies available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryReplies(nextQuery);
  }

  // Internal method to query replies and update state.
  Future<Result<List<ThreadedCommentData>>> _queryReplies(
    CommentRepliesQuery query,
  ) async {
    final result = await commentsRepository.getCommentReplies(query);

    result.onSuccess(
      (repliesData) => _stateNotifier.onQueryMoreReplies(
        repliesData,
        query.sort,
      ),
    );

    return result.map((repliesData) => repliesData.items);
  }
}
