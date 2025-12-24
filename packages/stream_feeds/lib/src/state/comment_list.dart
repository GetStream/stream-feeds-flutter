import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/comment_data.dart';
import '../repository/comments_repository.dart';
import 'comment_list_state.dart';
import 'event/handler/comment_list_event_handler.dart';
import 'event/state_update_event.dart';
import 'query/comments_query.dart';
import 'state_notifier_extentions.dart';

/// A list of comments with a query and state.
///
/// The primary interface for working with comment lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of comments with pagination support.
///
/// Each comment list instance is associated with a specific query and maintains its own state
/// that can be observed for real-time updates. The comment list state includes comments and
/// pagination information.
class CommentList extends Disposable {
  @internal
  CommentList({
    required this.query,
    required this.commentsRepository,
    required this.eventsEmitter,
    required this.currentUserId,
  }) {
    _stateNotifier = CommentListStateNotifier(
      initialState: const CommentListState(),
      currentUserId: currentUserId,
    );

    // Attach event handlers for real-time updates
    final handler = CommentListEventHandler(
      query: query,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final CommentsQuery query;
  final CommentsRepository commentsRepository;
  final String currentUserId;

  CommentListState get state => stateNotifier.value;
  StateNotifier<CommentListState> get notifier => stateNotifier;
  Stream<CommentListState> get stream => stateNotifier.stream;

  @internal
  CommentListStateNotifier get stateNotifier => _stateNotifier;
  late final CommentListStateNotifier _stateNotifier;

  final SharedEmitter<StateUpdateEvent> eventsEmitter;
  StreamSubscription<StateUpdateEvent>? _eventsSubscription;

  /// Queries the initial list of comments based on the provided [CommentsQuery].
  ///
  /// Returns a [Result] containing a list of [CommentData] or an error.
  Future<Result<List<CommentData>>> get() => _queryComments(query);

  /// Loads more comments if available.
  ///
  /// Returns a [Result] containing additional [CommentData] or an error.
  Future<Result<List<CommentData>>> queryMoreComments({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more comments available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      limit: limit ?? query.limit,
      next: next,
      previous: null,
    );

    return _queryComments(nextQuery);
  }

  // Internal method to query comments and update state.
  Future<Result<List<CommentData>>> _queryComments(CommentsQuery query) async {
    final result = await commentsRepository.queryComments(query);

    result.onSuccess(
      (commentsData) => _stateNotifier.onQueryMoreComments(
        commentsData,
        filter: query.filter,
        sort: query.sort,
      ),
    );

    return result.map((commentsData) => commentsData.items);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }
}
