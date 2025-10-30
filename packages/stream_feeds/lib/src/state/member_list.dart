import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feed_member_data.dart';
import '../models/query_configuration.dart';
import '../repository/feeds_repository.dart';
import 'event/member_list_event_handler.dart';
import 'member_list_state.dart';
import 'query/members_query.dart';
import 'state_notifier_extentions.dart';

/// Represents a list of feed members with a query and state.
///
/// The primary interface for working with member lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of feed members with pagination support.
///
/// Each member list instance is associated with a specific feed and maintains its own state
/// that can be observed for real-time updates. The member list state includes members and
/// pagination information.
class MemberList extends Disposable {
  MemberList({
    required this.query,
    required this.feedsRepository,
    required this.eventsEmitter,
  }) {
    _stateNotifier = MemberListStateNotifier(
      initialState: const MemberListState(),
    );

    final eventHandler = MemberListEventHandler(
      query: query,
      state: _stateNotifier,
    );

    // Attach event handlers for the member list events
    _eventsSubscription = eventsEmitter.listen(eventHandler.handleEvent);
  }

  final MembersQuery query;
  final FeedsRepository feedsRepository;

  MemberListState get state => stateNotifier.value;
  StateNotifier<MemberListState> get notifier => stateNotifier;
  Stream<MemberListState> get stream => stateNotifier.stream;

  @internal
  MemberListStateNotifier get stateNotifier => _stateNotifier;
  late final MemberListStateNotifier _stateNotifier;

  final SharedEmitter<WsEvent> eventsEmitter;
  StreamSubscription<WsEvent>? _eventsSubscription;

  /// Queries the initial list of members based on the provided [MembersQuery].
  ///
  /// Returns a [Result] containing a list of [FeedMemberData] or an error.
  Future<Result<List<FeedMemberData>>> get() => _queryMembers(query);

  /// Queries more members based on the current pagination state.
  ///
  /// If there are no more members available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// members to return.
  Future<Result<List<FeedMemberData>>> queryMoreMembers({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.pagination?.next;

    // Early return if no more members available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      fid: query.fid,
      next: next,
      limit: limit ?? query.limit,
    );

    return _queryMembers(nextQuery);
  }

  // Internal method to query feeds and update state.
  Future<Result<List<FeedMemberData>>> _queryMembers(MembersQuery query) async {
    final fid = query.fid;
    final request = query.toRequest();

    final result = await feedsRepository.queryFeedMembers(fid, request);

    result.onSuccess(
      (feedData) {
        _stateNotifier.onQueryMoreMembers(
          feedData,
          QueryConfiguration(
            filter: query.filter,
            sort: query.sort ?? MembersSort.defaultSort,
          ),
        );
      },
    );

    return result.map((feedData) => feedData.items);
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    _stateNotifier.dispose();
    super.dispose();
  }
}
