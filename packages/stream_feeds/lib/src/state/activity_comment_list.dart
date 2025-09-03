import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/threaded_comment_data.dart';
import '../repository/comments_repository.dart';
import 'activity_comment_list_state.dart';
import 'event/activity_comment_list_event_handler.dart';
import 'query/activity_comments_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of activity comments with a query and state.
///
/// The primary interface for working with activity comment lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of activity comments with pagination support.
///
/// Each activity comment list instance is associated with a specific activity and maintains its own state
/// that can be observed for real-time updates. The activity comment list state includes comments and
/// pagination information.
class ActivityCommentList extends Disposable {
  @internal
  ActivityCommentList({
    required this.query,
    required this.commentsRepository,
    required this.eventsEmitter,
    required this.currentUserId,
  }) {
    _stateNotifier = ActivityCommentListStateNotifier(
      initialState: const ActivityCommentListState(),
      currentUserId: currentUserId,
    );

    // Attach event handlers for real-time updates
    final handler = ActivityCommentListEventHandler(
      objectId: query.objectId,
      objectType: query.objectType,
      state: _stateNotifier,
    );

    _eventsSubscription = eventsEmitter.listen(handler.handleEvent);
  }

  final ActivityCommentsQuery query;
  final CommentsRepository commentsRepository;
  final String currentUserId;

  StateNotifier<ActivityCommentListState> get state => notifier;
  Stream<ActivityCommentListState> get stream => notifier.stream;

  @internal
  ActivityCommentListStateNotifier get notifier => _stateNotifier;
  late final ActivityCommentListStateNotifier _stateNotifier;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  /// Queries the initial list of activity comments based on the provided [ActivityCommentsQuery].
  ///
  /// Returns a [Result] containing a list of [ThreadedCommentData] or an error.
  Future<Result<List<ThreadedCommentData>>> get() => _queryComments(query);

  /// Loads more activity comments based on the current pagination state.
  ///
  /// If there are no more comments available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// comments to return.
  Future<Result<List<ThreadedCommentData>>> queryMoreComments({
    int? limit,
  }) async {
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
  Future<Result<List<ThreadedCommentData>>> _queryComments(
    ActivityCommentsQuery query,
  ) async {
    final result = await commentsRepository.getComments(query);

    result.onSuccess(
      (commentsData) => _stateNotifier.onQueryMoreComments(
        commentsData,
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
