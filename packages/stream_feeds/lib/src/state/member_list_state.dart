import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feed_member_data.dart';
import '../models/model_updates.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/members_query.dart';

part 'member_list_state.freezed.dart';

/// Manages the state of a member list and handles state updates.
///
/// Provides methods to update the member list state in response to data changes
/// and real-time events from the Stream Feeds API.
class MemberListStateNotifier extends StateNotifier<MemberListState> {
  MemberListStateNotifier({
    required MemberListState initialState,
  }) : super(initialState);

  QueryConfiguration<FeedMemberData>? _queryConfig;
  List<Sort<FeedMemberData>> get membersSort {
    return _queryConfig?.sort ?? MembersSort.defaultSort;
  }

  /// Handles the result of a query for more members.
  void onQueryMoreMembers(
    PaginationResult<FeedMemberData> result,
    QueryConfiguration<FeedMemberData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new members with the existing ones (keeping the sort order)
    final updatedMembers = state.members.merge(
      result.items,
      key: (it) => it.id,
      compare: membersSort.compare,
    );

    state = state.copyWith(
      members: updatedMembers,
      pagination: result.pagination,
    );
  }

  /// Handles the addition of a new member.
  void onMemberAdded(FeedMemberData member) {
    final updatedMembers = state.members.sortedUpsert(
      member,
      key: (it) => it.id,
      compare: membersSort.compare,
    );

    state = state.copyWith(members: updatedMembers);
  }

  /// Handles the update of a member's data.
  void onMemberUpdated(FeedMemberData member) {
    final updatedMembers = state.members.sortedUpsert(
      member,
      key: (it) => it.id,
      compare: membersSort.compare,
    );

    state = state.copyWith(members: updatedMembers);
  }

  /// Handles the removal of a member by their ID.
  void onMemberRemoved(String memberId) {
    final updatedMembers = state.members.where((it) {
      return it.id != memberId;
    }).toList();

    state = state.copyWith(members: updatedMembers);
  }

  /// Handles updates to multiple members.
  void onMembersUpdated(ModelUpdates<FeedMemberData> updates) {
    // Replace existing members with updated ones
    var updatedMembers = state.members.batchReplace(
      updates.updated,
      key: (it) => it.id,
    );

    // Remove members by their IDs
    updatedMembers = updatedMembers.whereNot((it) {
      return updates.removedIds.contains(it.id);
    }).sorted(membersSort.compare);

    state = state.copyWith(members: updatedMembers);
  }

  /// Clears the current member list state.
  void clear() => state = const MemberListState();
}

/// An observable state object that manages the current state of a member list.
///
/// Maintains the current list of members and pagination information for
/// efficient loading and navigation through member collections.
@freezed
class MemberListState with _$MemberListState {
  const MemberListState({
    this.members = const [],
    this.pagination,
  });

  /// All the paginated members currently loaded.
  ///
  /// This list contains all members that have been fetched across multiple
  /// pagination requests. The members are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<FeedMemberData> members;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of members.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more members available to load.
  bool get canLoadMore => pagination?.next != null;
}
