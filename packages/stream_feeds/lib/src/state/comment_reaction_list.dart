import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feeds_reaction_data.dart';
import '../models/query_configuration.dart';
import '../repository/comments_repository.dart';
import 'comment_reaction_list_state.dart';
import 'event/comment_reaction_list_event_handler.dart';
import 'query/comment_reactions_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of comment reactions with a query and state.
///
/// The primary interface for working with comment reaction lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of comment reactions with pagination support.
///
/// Each comment reaction list instance is associated with a specific comment and maintains its own state
/// that can be observed for real-time updates. The comment reaction list state includes reactions and
/// pagination information.
class CommentReactionList with Disposable {
  @internal
  CommentReactionList({
    required this.query,
    required this.commentsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = CommentReactionListStateNotifier(
      initialState: const CommentReactionListState(),
    );

    // Attach event handlers for real-time updates
    final handler = CommentReactionListEventHandler(state: _stateNotifier);
    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final CommentReactionsQuery query;
  final CommentsRepository commentsRepository;

  late final CommentReactionListStateNotifier _stateNotifier;

  CommentReactionListState get state => _stateNotifier.value;
  StateNotifier<CommentReactionListState> get notifier => _stateNotifier;
  Stream<CommentReactionListState> get stream => _stateNotifier.stream;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }

  /// Queries the initial list of comment reactions based on the provided query.
  ///
  /// Returns a [Result] containing a list of comment reactions or an error.
  Future<Result<List<FeedsReactionData>>> get() =>
      _queryCommentReactions(query);

  /// Loads more comment reactions based on the current pagination state.
  ///
  /// If there are no more reactions available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// reactions to return.
  Future<Result<List<FeedsReactionData>>> queryMoreReactions({
    int? limit,
  }) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more reactions available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryCommentReactions(nextQuery);
  }

  // Internal method to query comment reactions and update state.
  Future<Result<List<FeedsReactionData>>> _queryCommentReactions(
    CommentReactionsQuery query,
  ) async {
    final result = await commentsRepository.queryCommentReactions(
      query.commentId,
      query,
    );

    result.onSuccess(
      (reactionsData) => _stateNotifier.onQueryMoreReactions(
        reactionsData,
        QueryConfiguration(filter: query.filter, sort: query.sort),
      ),
    );

    return result.map((reactionsData) => reactionsData.items);
  }
}
